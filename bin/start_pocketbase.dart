#! /usr/bin/env dcli

import 'dart:io';

import 'package:args/args.dart';
import 'package:dcli/dcli.dart';
import 'package:path/path.dart' as p;
import 'package:pb_dtos/src/tools/obtain_pocketbase.dart';
import 'package:pb_dtos/src/tools/start_pocketbase.dart';

void copyDirectoryContents(String sourceDir, String destDir) {
  if (!exists(sourceDir)) return;
  find('*', workingDirectory: sourceDir, recursive: false).forEach((file) {
    copy(file, destDir);
  });
}

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption(
      'config',
      abbr: 'c',
      defaultsTo: 'pocketbase',
      help: 'PocketBase configuration directory.',
    )
    ..addOption(
      'pocketbase-executable',
      abbr: 'x',
      defaultsTo: p.join(env['HOME']!, 'develop', 'pocketbase', 'pocketbase'),
      help: 'Path to PocketBase executable.',
    )
    ..addOption(
      'pocketbase-version',
      abbr: 'v',
      help:
          'PocketBase release to download, used instead of --pocketbase-executable if set.',
    )
    ..addOption(
      'pocketbase-release-dir',
      abbr: 'r',
      defaultsTo: p.join(env['HOME']!, 'develop', 'pocketbase'),
      help: 'Where to download binary specified by --pocketbase-version.',
    )
    ..addOption('output', abbr: 'o', help: 'PocketBase data directory.')
    ..addOption(
      'port',
      abbr: 'p',
      defaultsTo: '8696',
      help: 'PocketBase port.',
    );

  final results = parser.parse(args);

  final pocketbasePort = int.tryParse(results['port'] as String);
  if (pocketbasePort == null) {
    print('Invalid port number: ${results['port']}');
    exit(1);
  }

  final pocketbaseConfig = results['config'] as String;
  var pocketbaseExecutable = results['pocketbase-executable'] as String?;
  final pocketbaseVersion = results['pocketbase-version'] as String?;
  final pocketbaseReleaseDir = results['pocketbase-release-dir'] as String;
  ObtainPocketBaseConfig? obtainConfig;
  if (pocketbaseVersion != null) {
    obtainConfig = ObtainPocketBaseConfig(
      githubTag: pocketbaseVersion,
      downloadPath: pocketbaseReleaseDir,
    );
  }
  final pocketbaseDir = results['output'] as String?;

  if (obtainConfig != null) {
    pocketbaseExecutable = await obtainPocketBase(obtainConfig);
  }

  var process = await launchPocketbase(
    LaunchPocketBaseConfig(
      configurationDirectory: pocketbaseConfig,
      pocketBaseExecutable: pocketbaseExecutable,
      pocketBaseDataDirectory: pocketbaseDir,
      pocketBasePort: pocketbasePort,
      detached: false,
    ),
  );

  await process.exitCode;
}
