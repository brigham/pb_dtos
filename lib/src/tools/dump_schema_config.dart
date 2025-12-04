import 'package:args/args.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/src/tools/credentials_config.dart';
import 'package:pb_obtain/config.dart';
import 'package:pb_obtain/pb_obtain.dart';

part 'dump_schema_config.freezed.dart';
part 'dump_schema_config.g.dart';

@freezed
@JsonSerializable(anyMap: true, checked: true, disallowUnrecognizedKeys: true)
class DumpSchemaConfig with _$DumpSchemaConfig {
  @override
  final String? pocketbaseUrl;

  @override
  final LaunchConfig? launch;

  @override
  final String outputDir;

  @override
  final CredentialsConfig? credentials;

  @override
  final String? suffix;

  @override
  final bool verbose;

  @override
  final bool debug;

  void _validate() {
    if ((pocketbaseUrl == null) == (launch == null)) {
      throw ArgumentError.value(
        pocketbaseUrl,
        'pocketbaseUrl',
        "One and only one of 'pocketbaseUrl' and 'launch' "
            "can be set",
      );
    }
    if (pocketbaseUrl != null) {
      try {
        Uri.parse(pocketbaseUrl!);
      } on FormatException catch (e) {
        throw ArgumentError.value(pocketbaseUrl, 'pocketbaseUrl', e.message);
      }
    }
    if (outputDir.isEmpty) {
      throw ArgumentError.value(
        outputDir,
        'outputDir',
        'Output directory must be specified',
      );
    }
  }

  DumpSchemaConfig({
    this.pocketbaseUrl,
    this.launch,
    required this.outputDir,
    this.credentials,
    this.suffix,
    this.verbose = false,
    this.debug = false,
  }) {
    _validate();
  }

  const DumpSchemaConfig.empty()
    : pocketbaseUrl = '',
      launch = null,
      outputDir = '',
      credentials = null,
      suffix = '',
      verbose = false,
      debug = false;

  factory DumpSchemaConfig.fromJson(Map json) =>
      _$DumpSchemaConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DumpSchemaConfigToJson(this);

  static void addOptions(ArgParser parser) {
    parser
      ..addFlag('verbose', abbr: 'v', help: 'Enable verbose output.')
      ..addFlag('debug', help: 'Enable debug output.')
      ..addSeparator(
        '''
Dumping the schema
==================
'''
            .trim(),
      )
      ..addOption(
        'url',
        defaultsTo: '',
        help: 'URL of already running instance, if not launching (see below).',
      )
      ..addOption('output-dir', help: 'Output directory for generated files.')
      ..addOption(
        'suffix',
        defaultsTo: '',
        help:
            'Suffix to append to generated files. Useful to avoid IDEs treating goldens as real Dart files.',
      );
    LaunchConfig.addOptions(parser);
  }

  static ({DumpSchemaConfig? config, bool pickedAny}) merge(
    DumpSchemaConfig? config,
    ArgResults results,
  ) {
    var picker = ArgPicker(config, results);

    bool? verbose = picker.pickFlag('verbose');
    bool? debug = picker.pickFlag('debug');
    String? instanceUrl = picker.pickString('url');
    String? outputDir = picker.pickString('output-dir');
    String? suffix = picker.pickString('suffix');

    var (config: mergedLaunch, pickedAny: launchPickedAny) = LaunchConfig.merge(
      config?.launch,
      results,
      required: false,
    );

    var pickedAny = picker.pickedAny || launchPickedAny;

    if (pickedAny) {
      config ??= DumpSchemaConfig.empty();
      config = config.copyWith(
        pocketbaseUrl: instanceUrl ?? config.pocketbaseUrl,
        launch: mergedLaunch,
        outputDir: outputDir ?? config.outputDir,
        suffix: suffix ?? config.suffix,
        verbose: verbose ?? config.verbose,
        debug: debug ?? config.debug,
      );
    }

    return (config: config, pickedAny: pickedAny);
  }
}
