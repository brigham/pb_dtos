import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:pb_obtain/pb_obtain.dart';

import '../dart_dto_dumper.dart';
import '../pocket_base_schema.dart';
import 'dump_schema_config.dart';

Future<void> dumpSchema(DumpSchemaConfig config) async {
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
  PocketBaseProcess? launched;
  if (config.pocketbaseUrl != null) {
    pocketbaseUrl = config.pocketbaseUrl!;
  } else if (config.launch != null) {
    var launchConfig = config.launch!;
    launched = await launch(launchConfig);
    pocketbaseUrl = "http://127.0.0.1:${launchConfig.port}";
  } else {
    stderr.writeln("No way to find PocketBase URL.");
    exit(1);
  }

  try {
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
      outputDir: config.outputDir,
      suffix: config.suffix ?? "",
    );
    await libDumper.process();

    for (var filepath in libDumper.filepaths) {
      print(filepath);
    }
  } finally {
    if (launched != null) {
      await launched.stop();
    }
  }
}
