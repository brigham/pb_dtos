#!/usr/bin/env dart

import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path/path.dart' as p;

const oldCoverageFile = 'OLD_COVERAGE.csv';
const newCoverageFile = 'COVERAGE.csv';

class FileCoverage {
  final int totalLines;
  final int linesHit;

  FileCoverage({required this.totalLines, required this.linesHit});

  double get ratio => totalLines == 0 ? 0 : linesHit / totalLines;
}

Future<Map<String, FileCoverage>> readCoverage(String filename) async {
  final results = <String, FileCoverage>{};
  final file = File(filename);
  if (!await file.exists()) {
    return results;
  }

  final content = await file.readAsString();
  final eol = content.contains('\r\n') ? '\r\n' : '\n';
  final rows = CsvToListConverter(
    fieldDelimiter: ',',
    eol: eol,
  ).convert(content);

  if (rows.isEmpty) {
    return results;
  }

  var headerRowIndex = 0;
  if (rows.isNotEmpty && (rows.first.isEmpty || rows.first[0].toString() != 'filepath')) {
    headerRowIndex = rows
        .indexWhere((row) => row.isNotEmpty && row[0].toString() == 'filepath');
  }

  if (headerRowIndex == -1) {
    print('Warning: Could not find header in $filename');
    return results;
  }

  final headers = rows[headerRowIndex].map((e) => e.toString()).toList();
  final filePathIndex = headers.indexOf('filepath');
  final totalLinesIndex = headers.indexOf('lines_of_code');
  final linesHitIndex = headers.indexOf('lines_of_code_hit');

  for (var i = 0; i < rows.length; i++) {
    if (i == headerRowIndex) continue;
    final row = rows[i];
    if (row.length <= filePathIndex) continue;
    final filepath = row[filePathIndex].toString();
    if (filepath.isEmpty) continue;
    final totalLines = int.parse(row[totalLinesIndex].toString());
    final linesHit = int.parse(row[linesHitIndex].toString());
    results[filepath] = FileCoverage(
      totalLines: totalLines,
      linesHit: linesHit,
    );
  }

  return results;
}

class Regression {
  final String filepath;
  final FileCoverage oldCoverage;
  final FileCoverage newCoverage;

  Regression({
    required this.filepath,
    required this.oldCoverage,
    required this.newCoverage,
  });

  double get decreaseMagnitude {
    if (oldCoverage.ratio == 0) {
      return 1.0;
    }
    return (oldCoverage.ratio - newCoverage.ratio) / oldCoverage.ratio;
  }
}

void main() async {
  final oldCoverage = await readCoverage(oldCoverageFile);
  final newCoverage = await readCoverage(newCoverageFile);
  final regressions = <String, Regression>{};

  for (final entry in oldCoverage.entries) {
    final filepath = entry.key;
    final oldc = entry.value;
    var newc = newCoverage[filepath];

    if (newc == null) {
      if (!await File(filepath).exists()) {
        continue;
      }
      newc = FileCoverage(totalLines: oldc.totalLines, linesHit: 0);
    }

    if (newc.ratio < oldc.ratio) {
      regressions[filepath] = Regression(
        filepath: filepath,
        oldCoverage: oldc,
        newCoverage: newc,
      );
    }
  }

  final allCoveredPaths = newCoverage.keys.toSet();
  final libDir = Directory('lib');
  await for (final file in libDir.list(recursive: true)) {
    if (file is! File) continue;

    final filepath = p.relative(file.path);
    if (filepath.endsWith('.freezed.dart') ||
        filepath.startsWith('lib/gen/') ||
        {
          "lib/pb/dto/dto_field.dart",
          "lib/pb/dto/dto.dart",
          "lib/pb/dto/dto_expand.dart",
          "lib/pb/dto/patch_dto.dart",
        }.contains(filepath) ||
        !filepath.endsWith('.dart')) {
      continue;
    }

    if (!allCoveredPaths.contains(filepath)) {
      var oldc =
          oldCoverage[filepath] ?? FileCoverage(totalLines: 0, linesHit: 0);
      regressions[filepath] = Regression(
        filepath: filepath,
        oldCoverage: oldc,
        newCoverage: FileCoverage(totalLines: oldc.totalLines, linesHit: 0),
      );
    }
  }

  if (regressions.isEmpty) {
    exit(0);
  }

  final sortedRegressions = regressions.values.toList()
    ..sort((a, b) => b.decreaseMagnitude.compareTo(a.decreaseMagnitude));

  for (final regression in sortedRegressions) {
    if (regression.oldCoverage.ratio > 0) {
      print(
        '${regression.filepath} coverage decreased from ${(regression.oldCoverage.ratio * 100).toStringAsFixed(2)}% to ${(regression.newCoverage.ratio * 100).toStringAsFixed(2)}%',
      );
    } else {
      print('${regression.filepath} is not covered at all');
    }
  }

  exit(1);
}
