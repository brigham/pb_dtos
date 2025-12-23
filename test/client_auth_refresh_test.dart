@Tags(['postgen'])
library;

import 'package:http/http.dart' as http;
import 'package:pb_dtos/pocketbase_api_client.dart';
import 'package:test/test.dart';

import 'generated_sample/users_dto.dart';

void main() {
  group('PocketBaseApiClient', () {
    late PocketBaseApiClient api;

    setUpAll(() async {
      // Wait for the server to be healthy by polling the health endpoint.
      print('Waiting for PocketBase to become healthy...');
      var pocketBaseUri = 'http://127.0.0.1:8698';
      final healthCheckUrl = Uri.parse('$pocketBaseUri/api/health');
      var serverReady = false;
      for (var i = 0; i < 20; i++) {
        // 20-second timeout
        try {
          final response = await http.get(healthCheckUrl);
          if (response.statusCode == 200) {
            print('PocketBase is healthy.');
            serverReady = true;
            break;
          }
        } catch (e) {
          print('Connection error: $e');
        }
        await Future<void>.delayed(const Duration(seconds: 1));
      }

      if (!serverReady) {
        fail('PocketBase server did not become healthy in time.');
      }

      api = PocketBaseApiClient(pocketBaseUri);
    });

    test('authRefresh works', () async {
      // 1. Create a user (or use existing)
      // Since create requires authentication (usually) or not depending on collection rules.
      // Assuming 'users' collection is open for registration or we use the superuser to create one first.

      // We'll use the superuser to create a user first to ensure it exists.
      var adminApi = PocketBaseApiClient(api.raw.baseURL);
      await adminApi.raw
          .collection('_superusers')
          .authWithPassword('test@example.com', '1234567890');

      var email =
          'refresh_test_${DateTime.now().millisecondsSinceEpoch}@example.com';
      var password = 'password123';

      var createdUser = await adminApi.create(
        UsersDto.meta(),
        body: UsersDto(
          email: email,
          password: password,
          passwordConfirm: password,
          birthday: DateTime.now(),
        ),
      );

      // 2. Auth with password as the new user
      var userApi = PocketBaseApiClient(api.raw.baseURL);
      var loggedInUser = await userApi.authWithPassword(
        UsersDto.meta(),
        email,
        password,
      );

      expect(loggedInUser.id, createdUser.id);
      expect(userApi.raw.authStore.isValid, isTrue);

      // 3. Call authRefresh
      var refreshedUser = await userApi.authRefresh(UsersDto.meta());

      expect(refreshedUser.id, createdUser.id);
      expect(refreshedUser.email, email);
      expect(userApi.raw.authStore.isValid, isTrue);

      // Verify token is present (authRefresh updates the token)
      expect(userApi.raw.authStore.token, isNotEmpty);
    });
  });
}
