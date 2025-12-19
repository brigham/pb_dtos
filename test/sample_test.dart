@Tags(["postgen"])
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image_size_getter/image_size_getter.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
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
  late String pocketBaseUrl;
  late Uri pocketBaseUri;

  setUpAll(() {
    pocketBaseUrl = 'http://127.0.0.1:8698';
    pocketBaseUri = Uri.parse(pocketBaseUrl);
  });

  group('Sample tests', () {
    late PocketBaseApiClient api;

    setUpAll(() async {
      // Wait for the server to be healthy by polling the health endpoint.
      print('Waiting for PocketBase to become healthy...');

      final healthCheckUrl = Uri.parse('$pocketBaseUrl/api/health');
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

      api = PocketBaseApiClient(pocketBaseUrl);
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
          expand: (e) => e.friendsViaAccepter(),
          filter: (f) => f
            ..id.equal(.val(user1.id))
            ..friendsViaAccepter.state.equal(.val(.accepted)),
        );
        var user1Friends = user1WithFriends
            .expand((u) => u.expand?.friendsViaAccepter ?? const <FriendsDto>[])
            .toList();

        expect(user1Friends.length, 1);
        expect(user1Friends[0].requester.id, user2.id);
      });
    });

    group('posting', () {
      late UsersDto poster;
      List<UsersDto> others = [];
      late PostsDto post;
      late Uint8List decodedImage;
      late DateTime cleanScheduledTime;

      setUpAll(() {
        decodedImage = base64Decode(_imgBytes[0]);
      });

      setUp(() async {
        final id = _randomId();
        poster = await createUser(
          UsersDto(
            email: "poster-$id@samplr.example.com",
            name: "Poster McPostface",
            birthday: DateTime.utc(1990, 1, 1),
          ),
        );
        for (int i = 0; i < 4; i++) {
          others.add(
            await createUser(
              UsersDto(
                email: "other-$id-$i@samplr.example.com",
                name: "Taggee #$i",
                birthday: DateTime.utc(1990, 1, i),
                zodiac: [
                  UsersZodiacEnum.aries,
                  UsersZodiacEnum.taurus,
                  UsersZodiacEnum.gemini,
                  null,
                ][i],
              ),
            ),
          );
        }
        // Create a Post with all fields populated
        cleanScheduledTime = DateTime.utc(2025, 1, 1, 12, 0, 0);

        post = await api.create(
          PostsDto.meta(),
          body: PostsDto(
            message: "Hello World",
            link: "https://example.com",
            tagged: others.map((u) => u.asRelation()).toList(),
            draft: true,
            reviewStars: 4.5,
            scheduled: cleanScheduledTime,
            location: const GeopointDto(lat: 34, lon: -118),
            photo: FileDto.fromBytes(
              decodedImage,
              filename: "green_square.png",
              contentType: http.MediaType('image', 'png'),
            ),
            poster: poster.asRelation(),
            visibility: .public,
            metadata: {
              'riskProfile': 4,
              'advertiserCategories': [
                {'score': 99, 'name': 'sports'},
                {'score': 22, 'name': 'electronics'},
              ],
            },
          ),
        );
      });

      test('PostsDto exercises all types', () {
        expect(post.message, "Hello World");
        expect(post.link, "https://example.com");
        expect(post.tagged.length, others.length);
        expect(post.draft, isTrue);
        expect(post.reviewStars, 4.5);
        expect(post.scheduled, cleanScheduledTime);
        expect(post.location.lat, 34);
        expect(post.location.lon, -118);
        expect(post.poster.id, poster.id);
        expect(post.photo, isNotNull);
        expect(post.visibility, PostsVisibilityEnum.public);
        expect(post.metadata, {
          'riskProfile': 4,
          'advertiserCategories': [
            {'score': 99, 'name': 'sports'},
            {'score': 22, 'name': 'electronics'},
          ],
        });
      });

      test('Thumbs exist', () async {
        var uri = post.photo!.toUri(PostsDto.meta(), post)!;
        expect(
          uri.toString(),
          startsWith('/api/files/posts/${post.id}/green_square_'),
        );
        expect(uri.toString(), endsWith('.png'));

        uri = pocketBaseUri.resolve(uri.toString());
        var bytes = await http.readBytes(uri);
        expect(bytes, decodedImage);

        var thumbs =
            (PostsDtoFieldEnum.photo.settings as DtoFileFieldSettings).thumbs;
        for (var thumb in thumbs) {
          uri = post.photo!.toUri(PostsDto.meta(), post, thumb: thumb)!;
          expect(
            uri.toString(),
            startsWith('/api/files/posts/${post.id}/green_square_'),
          );
          expect(uri.toString(), endsWith('.png?thumb=$thumb'));
          uri = pocketBaseUri.resolve(uri.toString());
          bytes = await http.readBytes(uri);
          var imageSizeResult = ImageSizeGetter.getSizeResult(
            MemoryInput(bytes),
          );
          expect(
            "${imageSizeResult.size.width}x${imageSizeResult.size.height}",
            thumb,
          );
        }

        // Yes, bool range comparisons work.
        var gtPosts = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.draft.greaterThan(.val(false)),
        );
        expect(gtPosts, isNotEmpty);

        var ltPosts = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.draft.lessThan(.val(false)),
        );
        expect(ltPosts, isEmpty);

        // Do file comparisons work?
        var eqPhoto = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.photo.equal(.val(post.photo!)),
        );
        expect(eqPhoto, isNotEmpty);

        var nePhoto = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.photo.notEqual(.val(post.photo!)),
        );
        expect(nePhoto, isEmpty);

        var gtPhoto = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.photo.greaterThan(.val(post.photo!)),
        );
        expect(gtPhoto, isEmpty);

        var gtePhoto = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.photo.greaterThanOrEqual(.val(post.photo!)),
        );
        expect(gtePhoto, isNotEmpty);

        var ltPhoto = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.photo.lessThan(.val(post.photo!)),
        );
        expect(ltPhoto, isEmpty);

        var ltePhoto = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.photo.lessThanOrEqual(.val(post.photo!)),
        );
        expect(ltePhoto, isNotEmpty);

        var likePhoto = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.photo.like(.val(post.photo!)),
        );
        expect(likePhoto, isNotEmpty);

        var notLikePhoto = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.photo.notLike(.val(post.photo!)),
        );
        expect(notLikePhoto, isEmpty);

        // Select comparisons
        var eqVisibility = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.visibility.equal(.val(.public)),
        );
        expect(eqVisibility, isNotEmpty);

        var neVisibility = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.visibility.notEqual(.val(.public)),
        );
        expect(neVisibility, isEmpty);

        var gtVisibility = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.visibility.greaterThan(.val(.public)),
        );
        expect(gtVisibility, isEmpty);

        var gteVisibility = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.visibility.greaterThanOrEqual(.val(.public)),
        );
        expect(gteVisibility, isNotEmpty);

        var ltVisibility = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.visibility.lessThan(.val(.public)),
        );
        expect(ltVisibility, isEmpty);

        var lteVisibility = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.visibility.lessThanOrEqual(.val(.public)),
        );
        expect(lteVisibility, isNotEmpty);

        var likeVisibility = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.visibility.like(.val(.public)),
        );
        expect(likeVisibility, isNotEmpty);

        var notLikeVisibility = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.visibility.notLike(.val(.public)),
        );
        expect(notLikeVisibility, isEmpty);

        // JSON
        var eqMetadata = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.metadata.equal(
            .val({
              'advertiserCategories': [
                {'name': 'sports', 'score': 99},
                {'name': 'electronics', 'score': 22},
              ],
              'riskProfile': 4,
            }),
          ),
        );
        expect(eqMetadata, isNotEmpty);

        // Location
        var eqLocation = await api.getList(
          PostsDto.meta(),
          filter: (f) =>
              f.location.equal(.val(GeopointDto(lat: 34, lon: -118))),
        );
        expect(eqLocation, isNotEmpty);

        // Modifiers
        var eqTaggedLength = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.tagged.length().equal(.val(4)),
        );
        expect(eqTaggedLength, isNotEmpty);

        var neZodiacEach = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.tagged.zodiac.each().notEqual(.val(.cancer)),
        );
        expect(neZodiacEach, isNotEmpty);

        // Macros
        var beforeNow = await api.getList(
          PostsDto.meta(),
          filter: (f) => f.scheduled.lessThan(MacroOperand.now()),
        );
        expect(beforeNow, isNotEmpty);
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

      test(
        'Partial response with missing required field uses default',
        () async {
          // Create a user (email is required)
          final id = _randomId();
          final user = await createUser(
            UsersDto(
              email: "partial-$id@samplr.example.com",
              name: "Partial User",
              birthday: DateTime.utc(1990, 1, 1),
            ),
          );

          // Fetch the user but request only 'name'
          // 'email' is required but should be missing in response
          final partialUser = await api.getOne(
            UsersDto.meta(),
            user.id,
            fields: (f) => f.name(),
          );

          expect(partialUser.name, "Partial User");
          expect(
            partialUser.email,
            "",
          ); // Default value for missing required field
        },
      );

      test('Limiting nested fields in response', () {

      });
    });
  });
}

const _imgBytes = [
  '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'
      'GQAAAABJRU5ErkJggg==',
];
