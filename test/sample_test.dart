@Tags(["postgen"])
import 'dart:async';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/geopoint_dto.dart';
import 'package:pb_dtos/pocketbase_api_client.dart';
import 'package:test/test.dart';

import 'generated_sample/blocks_dto.dart';
import 'generated_sample/friends_dto.dart';
import 'generated_sample/posts_dto.dart';
import 'generated_sample/users_dto.dart';

String _randomId() {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(
    10,
    (index) => chars[random.nextInt(chars.length)],
  ).join();
}

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
        final id1 = _randomId();
        user1 = await createUser(
          UsersDto(
            email: "zucchini-$id1@samplr.example.com",
            birthday: DateTime.utc(1984, 4, 29),
          ),
        );
        expect(user1.email, "zucchini-$id1@samplr.example.com");
        expect(user1.birthday, DateTime.utc(1984, 4, 29));

        final id2 = _randomId();
        user2 = await createUser(
          UsersDto(
            email: "lemon-$id2@samplr.example.com",
            birthday: DateTime.utc(1982, 2, 1),
          ),
        );
        expect(user2.email, "lemon-$id2@samplr.example.com");
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

    group('All Types', () {
      late UsersDto poster;

      setUp(() async {
        final id = _randomId();
        poster = await createUser(
          UsersDto(
            email: "poster-$id@samplr.example.com",
            name: "Poster McPostface",
            birthday: DateTime.utc(1990, 1, 1),
          ),
        );
      });

      test('PostsDto exercises all types', () async {
        // Create a Post with all fields populated
        final cleanScheduledTime = DateTime.utc(2025, 1, 1, 12, 0, 0);

        final post = await api.create(
          PostsDto.meta(),
          body: PostsDto(
            message: "Hello World",
            link: "https://example.com",
            draft: true,
            reviewStars: 4.5,
            scheduled: cleanScheduledTime,
            location: const GeopointDto(lat: 34.0522, lon: -118.2437),
            photo: const FileDto.fromString(
              "some image content",
              filename: "image.txt",
            ),
            poster: poster.asRelation(),
          ),
        );

        expect(post.message, "Hello World");
        expect(post.link, "https://example.com");
        expect(post.draft, isTrue);
        expect(post.reviewStars, 4.5);
        expect(post.scheduled, cleanScheduledTime);
        expect(post.location.lat, 34.0522);
        expect(post.location.lon, -118.2437);
        expect(post.poster.id, poster.id);
        expect(post.photo, isNotNull);
      });

      test('BlocksDto exercises Enum and Relation', () async {
        final id = _randomId();
        final blocked = await createUser(
          UsersDto(
            email: "blocked-$id@samplr.example.com",
            birthday: DateTime.utc(1995, 5, 5),
          ),
        );

        final block = await api.create(
          BlocksDto.meta(),
          body: BlocksDto(
            type: BlocksTypeEnum.block,
            blocker: poster.asRelation(),
            blocked: blocked.asRelation(),
          ),
        );

        expect(block.type, BlocksTypeEnum.block);
        expect(block.blocker.id, poster.id);
        expect(block.blocked.id, blocked.id);
      });
    });
  });
}
