#! /usr/bin/env dcli

import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:path/path.dart' as p;

void copyDirectoryContents(String sourceDir, String destDir) {
  if (!exists(sourceDir)) return;
  find('*', workingDirectory: sourceDir, recursive: false).forEach((file) {
    copy(file, destDir, overwrite: true);
  });
}

class LaunchPocketBaseConfig {
  final String configurationDirectory;
  final String? pocketBaseExecutable;
  final String? pocketBaseDataDirectory;
  final int pocketBasePort;
  final bool detached;

  LaunchPocketBaseConfig({
    required this.configurationDirectory,
    required this.pocketBasePort,
    required this.detached,
    this.pocketBaseExecutable,
    this.pocketBaseDataDirectory,
  });
}

void _createDirIfNotExists(String path, {bool recursive = false}) {
  if (!exists(path)) {
    createDir(path, recursive: recursive);
  }
}

Future<Process> launchPocketbase(LaunchPocketBaseConfig config) async {
  final pocketbasePort = config.pocketBasePort;
  final pocketbaseConfig = config.configurationDirectory;
  final pocketbaseExecutable = config.pocketBaseExecutable;
  final pocketbaseDir = config.pocketBaseDataDirectory;

  if (pocketbaseExecutable == null) {
    throw ArgumentError(
      'pocketBaseExecutable must be provided in LaunchPocketBaseConfig',
    );
  }

  String pbDir;
  bool tempDir = false;
  if (pocketbaseDir == null) {
    pbDir = Directory.systemTemp.createTempSync('pocketbase_').path;
    print('Created temporary PocketBase directory at $pbDir');
    tempDir = true;
  } else {
    pbDir = pocketbaseDir;
    if (!exists(pbDir)) {
      createDir(pbDir, recursive: true);
    }
    print('Using PocketBase directory at $pbDir');
  }

  _createDirIfNotExists(p.join(pbDir, 'pb_data'), recursive: true);
  _createDirIfNotExists(p.join(pbDir, 'pb_hooks'), recursive: true);
  _createDirIfNotExists(p.join(pbDir, 'pb_public'), recursive: true);
  _createDirIfNotExists(p.join(pbDir, 'pb_migrations'), recursive: true);

  final pocketbaseLink = p.join(pbDir, 'pocketbase');
  if (exists(pocketbaseLink)) {
    delete(pocketbaseLink);
  }
  createSymLink(targetPath: pocketbaseExecutable, linkPath: pocketbaseLink);

  copyDirectoryContents(
    p.join(pocketbaseConfig, 'migrations'),
    p.join(pbDir, 'pb_migrations'),
  );
  copyDirectoryContents(
    p.join(pocketbaseConfig, 'pb_migrations'),
    p.join(pbDir, 'pb_migrations'),
  );

  if (tempDir) {
    copyDirectoryContents(
      p.join(pocketbaseConfig, 'dev_migrations'),
      p.join(pbDir, 'pb_migrations'),
    );
  }

  copyDirectoryContents(
    p.join(pocketbaseConfig, 'pb_hooks'),
    p.join(pbDir, 'pb_hooks'),
  );

  ProcessStartMode mode = config.detached ? .detachedWithStdio : .normal;
  final process = await Process.start(p.join(pbDir, 'pocketbase'), [
    'serve',
    '--dir=${p.join(pbDir, 'pb_data')}',
    '--hooksDir=${p.join(pbDir, 'pb_hooks')}',
    '--publicDir=${p.join(pbDir, 'pb_public')}',
    '--migrationsDir=${p.join(pbDir, 'pb_migrations')}',
    '--http=127.0.0.1:$pocketbasePort',
  ], mode: mode);

  process.stdout.transform(SystemEncoding().decoder).listen(print);
  process.stderr.transform(SystemEncoding().decoder).listen(print);

  return process;
}
