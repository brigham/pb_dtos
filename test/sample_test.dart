@Tags(["postgen"])
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:pb_dtos/pocketbase_api_client.dart';
import 'package:pb_dtos/src/sample/friends_dto.dart';
import 'package:pb_dtos/src/sample/users_dto.dart';
import 'package:test/test.dart';

void main() {
  group('Sample tests', () {
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
          // Ignore connection errors
        }
        await Future.delayed(const Duration(seconds: 1));
      }

      if (!serverReady) {
        fail('PocketBase server did not become healthy in time.');
      }

      api = PocketBaseApiClient(pocketBaseUri);
      // TODO: How to auth as super user?
      var authResult = await api.raw
          .collection('_superusers')
          .authWithPassword('test@example.com', '1234567890');
      expect(authResult.record.data['email'], 'test@example.com');
    });

    Future<UsersDto> createUser(UsersDto user) {
      user = user.copyWith(password: "hunter22", passwordConfirm: "hunter22");
      return api.create(UsersDto.meta(), body: user);
    }

    group('two users', () {
      late UsersDto user1;
      late UsersDto user2;

      setUp(() async {
        user1 = await createUser(
          UsersDto(
            email: "zucchini@samplr.example.com",
            birthday: DateTime.utc(1984, 4, 29),
          ),
        );
        expect(user1.email, "zucchini@samplr.example.com");
        expect(user1.birthday, DateTime.utc(1984, 4, 29));

        user2 = await createUser(
          UsersDto(
            email: "lemon@samplr.example.com",
            birthday: DateTime.utc(1982, 2, 1),
          ),
        );
        expect(user2.email, "lemon@samplr.example.com");
        expect(user2.birthday, DateTime.utc(1982, 2, 1));
      });

      test('friending', () async {
        var request = await api.create(
          FriendsDto.meta(),
          body: FriendsDto(
            state: .pending,
            requester: user1.asRelation(),
            accepter: user2.asRelation(),
          ),
        );
        expect(request.state, FriendsStateEnum.pending);

        var otherRequest = await api.create(
          FriendsDto.meta(),
          body: FriendsDto(
            state: .accepted,
            requester: user2.asRelation(),
            accepter: user1.asRelation(),
          ),
        );
        expect(otherRequest.state, FriendsStateEnum.accepted);

        request = await api.update(
          FriendsDto.meta(),
          request.id,
          body: FriendsDto.patch((p) => p.state = .accepted),
        );
        expect(request.state, FriendsStateEnum.accepted);

        var user1WithFriends = await api.getList(
          UsersDto.meta(),
          expand: UsersDto.expansions((e) => e..friendsViaAccepter()),
          filter: UsersDto.filter(
            (f) => f
              ..id().equal(user1.id)
              ..friendsViaAccepter().state().equal(.accepted),
          ),
        );
        var user1Friends = user1WithFriends
            .expand((u) => u.expand?.friendsViaAccepter ?? const <FriendsDto>[])
            .toList();

        expect(user1Friends.length, 1);
        expect(user1Friends[0].requester.id, user2.id);
      });
    });
  });
}
