import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:http/http.dart' as http;
import 'package:pb_dtos/src/tools/obtain_pocketbase.dart';
import 'package:pb_dtos/src/tools/start_pocketbase.dart';

import '../dart_dto_dumper.dart';
import '../pocket_base_schema.dart';

sealed class PocketBaseSetup {}

class PocketBaseUrl extends PocketBaseSetup {
  final String url;

  PocketBaseUrl({required this.url});
}

class PocketBaseSpec extends PocketBaseSetup {
  final LaunchPocketBaseConfig launchPocketBaseConfig;
  final ObtainPocketBaseConfig? obtainPocketBaseConfig;

  PocketBaseSpec(this.launchPocketBaseConfig, {this.obtainPocketBaseConfig});
}

class PocketBaseCredentials {
  final String email;
  final String password;

  PocketBaseCredentials({required this.email, required this.password});
}

class DumpSchemaConfig {
  final bool verbose;
  final String suffix;
  final PocketBaseSetup pocketBaseSetup;
  final String dtoOutputDir;
  final PocketBaseCredentials? credentials;

  DumpSchemaConfig({
    this.verbose = false,
    this.suffix = '',
    required this.pocketBaseSetup,
    required this.dtoOutputDir,
    this.credentials,
  });
}

Future<void> dumpSchema(DumpSchemaConfig config) async {
  final suffix = config.suffix;

  var email = '';
  var password = '';

  var pbCreds = Platform.environment['PB_CREDS'];
  if (pbCreds != null) {
    var parts = pbCreds.split(':');
    if (parts.length == 2) {
      email = parts[0];
      password = parts[1];
    }
  }

  if (config.credentials != null) {
    email = config.credentials!.email;
    password = config.credentials!.password;
  }

  String pocketbaseUrl;
  Process? launched;
  switch (config.pocketBaseSetup) {
    case PocketBaseUrl pbUrl:
      pocketbaseUrl = pbUrl.url;
    case PocketBaseSpec spec:
      var launchConfig = spec.launchPocketBaseConfig;
      if (spec.obtainPocketBaseConfig != null) {
        if (launchConfig.pocketBaseExecutable != null) {
          throw ArgumentError(
            'Cannot specify both obtainPocketBaseConfig and pocketBaseExecutable',
          );
        }
        final obtainedPath = await obtainPocketBase(
          spec.obtainPocketBaseConfig!,
        );
        launchConfig = LaunchPocketBaseConfig(
          configurationDirectory: launchConfig.configurationDirectory,
          pocketBaseExecutable: obtainedPath,
          pocketBasePort: launchConfig.pocketBasePort,
          detached: launchConfig.detached,
          pocketBaseDataDirectory: launchConfig.pocketBaseDataDirectory,
        );
      }
      launched = await launchPocketbase(launchConfig);
      pocketbaseUrl =
          "http://127.0.0.1:${spec.launchPocketBaseConfig.pocketBasePort}";
  }

  try {
    final healthCheckUrl = Uri.parse(
      pocketbaseUrl,
    ).replace(path: '/api/health');
    var serverReady = false;
    for (var i = 0; i < 10; i++) {
      try {
        final response = await http.get(healthCheckUrl);
        if (response.statusCode == 200) {
          serverReady = true;
          break;
        }
      } catch (e) {
        print('  Connection failed: $e');
      }
      await Future.delayed(Duration(seconds: 1));
    }

    if (!serverReady) {
      print('Error: PocketBase server did not start up in time.');
      exit(1);
    }

    if (email.isEmpty) {
      email = ask('Superuser email:');
      password = ask('Password:', hidden: true);
    }

    final schema = await PocketBaseSchema.create(
      pocketbaseUrl,
      email: email,
      password: password,
    );
    var libDumper = DartDtoDumper(
      schema,
      outputDir: config.dtoOutputDir,
      suffix: suffix,
    );
    await libDumper.process();

    for (var filepath in libDumper.filepaths) {
      print(filepath);
    }
  } finally {
    if (launched != null) {
      launched.kill();
    }
  }
}
