import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;

class ObtainPocketBaseConfig {
  final String githubTag;
  final String downloadPath;

  ObtainPocketBaseConfig({required this.githubTag, required this.downloadPath});
}

Future<String> obtainPocketBase(ObtainPocketBaseConfig config) async {
  final downloadDir = Directory(config.downloadPath);
  if (!downloadDir.existsSync()) {
    downloadDir.createSync(recursive: true);
  }

  final executableName = Platform.isWindows ? 'pocketbase.exe' : 'pocketbase';
  final executablePath = p.join(downloadDir.path, executableName);

  if (File(executablePath).existsSync()) {
    print('PocketBase executable already exists at $executablePath');
    return executablePath;
  }

  print('Obtaining PocketBase ${config.githubTag}...');

  // 1. Identify Platform
  String os;
  if (Platform.isLinux) {
    os = 'linux';
  } else if (Platform.isMacOS) {
    os = 'darwin';
  } else if (Platform.isWindows) {
    os = 'windows';
  } else {
    throw UnsupportedError(
      'Unsupported operating system: ${Platform.operatingSystem}',
    );
  }

  String arch;
  final version = Platform.version.toLowerCase();
  if (version.contains('arm64') || version.contains('aarch64')) {
    arch = 'arm64';
  } else if (version.contains('x64') || version.contains('x86_64')) {
    arch = 'amd64';
  } else {
    if (Platform.isMacOS &&
        (await Process.run('uname', ['-m'])).stdout.toString().trim() ==
            'arm64') {
      arch = 'arm64';
    } else {
      arch = 'amd64'; // Defaulting to amd64 for now
    }
  }

  // 2. Fetch Release Info
  final releaseUrl =
      'https://api.github.com/repos/pocketbase/pocketbase/releases/tags/${config.githubTag}';
  print('Fetching release info from $releaseUrl');
  final response = await http.get(Uri.parse(releaseUrl));
  if (response.statusCode != 200) {
    throw Exception(
      'Failed to fetch release info: ${response.statusCode} ${response.body}',
    );
  }

  final releaseJson = jsonDecode(response.body);
  final assets = releaseJson['assets'] as List;

  // 3. Find Assets
  final versionStr = config.githubTag.startsWith('v')
      ? config.githubTag.substring(1)
      : config.githubTag;
  final targetName = 'pocketbase_${versionStr}_${os}_$arch.zip';

  print('Looking for asset: $targetName');

  Map<String, dynamic>? binaryAsset;
  Map<String, dynamic>? checksumAsset;

  for (var asset in assets) {
    if (asset['name'] == targetName) {
      binaryAsset = asset;
    }
    if (asset['name'] == 'checksums.txt') {
      checksumAsset = asset;
    }
  }

  if (binaryAsset == null) {
    throw Exception(
      'Could not find asset $targetName in release ${config.githubTag}',
    );
  }

  if (checksumAsset == null) {
    print('Warning: checksums.txt not found. Verification will be skipped.');
  }

  // 4. Download
  final zipPath = p.join(downloadDir.path, targetName);
  print('Downloading $targetName to $zipPath...');
  final zipBytes = await http.readBytes(
    Uri.parse(binaryAsset['browser_download_url']),
  );
  File(zipPath).writeAsBytesSync(zipBytes);

  // 5. Verify
  if (checksumAsset != null) {
    print('Verifying checksum...');
    final checksumsContent = await http.read(
      Uri.parse(checksumAsset['browser_download_url']),
    );
    // checksums.txt format: "sha256_hash  filename"
    final lines = checksumsContent.split('\n');
    String? expectedHash;
    for (var line in lines) {
      if (line.trim().endsWith(targetName)) {
        expectedHash = line.trim().split(RegExp(r'\s+')).first;
        break;
      }
    }

    if (expectedHash == null) {
      print(
        'Warning: Could not find checksum for $targetName in checksums.txt',
      );
    } else {
      final digest = sha256.convert(zipBytes);
      if (digest.toString() != expectedHash) {
        throw Exception(
          'Checksum verification failed! Expected $expectedHash, got $digest',
        );
      }
      print('Checksum verified.');
    }
  }

  // 6. Unzip
  print('Unzipping...');
  final archive = ZipDecoder().decodeBytes(zipBytes);
  for (final file in archive) {
    final filename = file.name;
    if (file.isFile) {
      final data = file.content as List<int>;
      if (filename == 'pocketbase' || filename == 'pocketbase.exe') {
        File(executablePath)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);

        if (!Platform.isWindows) {
          await Process.run('chmod', ['+x', executablePath]);
        }
      }
    }
  }

  // Cleanup zip
  File(zipPath).deleteSync();

  print('PocketBase obtained successfully at $executablePath');
  return executablePath;
}
