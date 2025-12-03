import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:pb_obtain/pb_obtain.dart';

import '../dart_dto_dumper.dart';
import '../pocket_base_schema.dart';
import 'dump_schema_config.dart';

sealed class _Either<A, B> {
  const _Either._();

  factory _Either.from(A? a, B? b) {
    if (a != null && b != null) {
      throw Exception("Only one element should be set.");
    }
    if (a != null) {
      return _First(a);
    } else if (b != null) {
      return _Second(b);
    } else {
      throw Exception("At least one element should be set.");
    }
  }
}

class _First<A, B> extends _Either<A, B> {
  final A value;

  const _First(this.value) : super._();
}

class _Second<A, B> extends _Either<A, B> {
  final B value;

  _Second(this.value) : super._();
}

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
  var oneOf = _Either.from(config.pocketbaseUrl, config.launch);
  switch (oneOf) {
    case _First(:final value):
      pocketbaseUrl = value;
    case _Second(:final value):
      var launchConfig = value;
      launched = await launch(launchConfig);
      pocketbaseUrl = "http://127.0.0.1:${launchConfig.port}";
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
