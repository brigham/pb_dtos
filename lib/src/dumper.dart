import 'dart:io';
import 'dart:isolate';

import 'package:mustache_template/mustache_template.dart';

import 'collection_schema.dart';
import 'pocket_base_schema.dart';
import 'package:dart_style/dart_style.dart';

typedef ContextPredicate = bool Function(Map<String, dynamic> context);

bool _defaultIsNeeded(Map<String, dynamic> context) => true;

typedef TemplateConfig = ({String path, ContextPredicate? isNeeded});

Future<String?> _resolveTemplate(String path) async {
  if (path.startsWith('lib/')) {
    path = path.substring(4);
  }
  final uri = Uri.parse('package:pb_dtos/$path');

  final resolvedUri = await Isolate.resolvePackageUri(uri);

  if (resolvedUri == null) {
    print('Error: Could not resolve package URI: $uri');
    return null;
  }

  final file = File.fromUri(resolvedUri);

  if (!file.existsSync()) {
    print('Error: File not found at ${file.path}');
    return null;
  }

  print('Found bundled file at: ${file.path}');
  return file.path;
}

TemplateConfig config(
  String path, [
  ContextPredicate isNeeded = _defaultIsNeeded,
]) => (path: path, isNeeded: isNeeded);

typedef _DumperTemplate = ({String path, ContextPredicate isNeeded});

abstract class Dumper {
  final PocketBaseSchema schema;
  final List<_DumperTemplate> _templates;
  final DartFormatter formatter = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
  );
  final String suffix;

  final List<String> filepaths = [];

  Dumper(this.schema, List<TemplateConfig> templatePaths, {this.suffix = ''})
    : _templates = templatePaths
          .map<_DumperTemplate>(
            (config) => (
              path: config.path,
              isNeeded: config.isNeeded ?? _defaultIsNeeded,
            ),
          )
          .toList();

  Future<void> process() async {
    Map<String, Template> templateCache = {};
    Future<Template> getTemplate(String path) async {
      var cached = templateCache[path];
      if (cached != null) {
        return cached;
      }
      var templatePath = await _resolveTemplate(path);
      if (templatePath == null) {
        throw Exception('Could not resolve template: $path');
      }
      var template = Template(
        File(templatePath).readAsStringSync(),
        name: path,
        htmlEscapeValues: false,
      );
      templateCache[path] = template;
      return template;
    }

    final sortedCollections = schema.collections.toList()
      ..sort((a, b) => a.model.name.compareTo(b.model.name));
    for (var collection in sortedCollections) {
      var context = createContext(collection);
      for (var (path: relativeTemplatePath, :isNeeded) in _templates) {
        try {
          var path = getPath(relativeTemplatePath, collection);
          if (path == null) continue;
          path = path + suffix;
          if (!isNeeded(context)) {
            continue;
          }
          var template = await getTemplate(relativeTemplatePath);
          var rendered = template.renderString(context);
          filepaths.add(path);
          final file = File(path);
          file.parent.createSync(recursive: true);
          String formatted;
          try {
            formatted = formatter.format(rendered);
          } catch (e, s) {
            stderr.writeln('Could not format file: $path due to $e');
            stderr.writeln(s.toString());
            formatted = rendered;
          }
          file.writeAsStringSync(formatted);
        } on TemplateException catch (e) {
          print(e.toString());
          rethrow;
        }
      }
    }
  }

  Map<String, dynamic> createContext(CollectionSchema collectionSchema);

  String? getPath(String templatePath, CollectionSchema collectionSchema);
}
