import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/geopoint_dto.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'package:test/test.dart';

import 'generated_sample/posts_dto.dart';

void main() {
  group('operators (text)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.poster.name.equal(.val("'bruce'")),
      ).toString();
      expect(expr, r"poster.name = '\'bruce\''");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.name.notEqual(.val("'bruce'")),
      ).toString();

      expect(expr, r"poster.name != '\'bruce\''");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.poster.name.greaterThan(.val("'bruce'")),
      ).toString();
      expect(expr, r"poster.name > '\'bruce\''");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.name.greaterThanOrEqual(.val("'bruce'")),
      ).toString();
      expect(expr, r"poster.name >= '\'bruce\''");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.poster.name.lessThan(.val("'bruce'")),
      ).toString();
      expect(expr, r"poster.name < '\'bruce\''");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.name.lessThanOrEqual(.val("'bruce'")),
      ).toString();
      expect(expr, r"poster.name <= '\'bruce\''");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.poster.name.like(.val("'bruce'")),
      ).toString();

      expect(expr, r"poster.name ~ '\'bruce\''");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.poster.name.notLike(.val("'bruce'")),
      ).toString();

      expect(expr, r"poster.name !~ '\'bruce\''");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) =>
            f.poster.roles.permissions.name.anyEqual(.val("donuts.favorite")),
      ).toString();

      expect(expr, "poster.roles.permissions.name ?= 'donuts.favorite'");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.roles.permissions.name.anyNotEqual(
          .val("donuts.favorite"),
        ),
      ).toString();

      expect(expr, "poster.roles.permissions.name ?!= 'donuts.favorite'");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.poster.roles.permissions.name.anyGreaterThan(
          .val("donuts.favorite"),
        ),
      ).toString();

      expect(expr, "poster.roles.permissions.name ?> 'donuts.favorite'");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.roles.permissions.name.anyGreaterThanOrEqual(
          .val("donuts.favorite"),
        ),
      ).toString();

      expect(expr, "poster.roles.permissions.name ?>= 'donuts.favorite'");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.poster.roles.permissions.name.anyLessThan(
          .val("donuts.favorite"),
        ),
      ).toString();

      expect(expr, "poster.roles.permissions.name ?< 'donuts.favorite'");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.roles.permissions.name.anyLessThanOrEqual(
          .val("donuts.favorite"),
        ),
      ).toString();

      expect(expr, "poster.roles.permissions.name ?<= 'donuts.favorite'");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.poster.roles.permissions.name.anyLike(.val("donuts.favorite")),
      ).toString();

      expect(expr, "poster.roles.permissions.name ?~ 'donuts.favorite'");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) =>
            f.poster.roles.permissions.name.anyNotLike(.val("donuts.favorite")),
      ).toString();

      expect(expr, "poster.roles.permissions.name ?!~ 'donuts.favorite'");
    });
  });

  group('operators (email)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.poster.email.equal(.val('bruce@example.com')),
      ).toString();
      expect(expr, r"poster.email = 'bruce@example.com'");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.email.notEqual(.val('bruce@example.com')),
      ).toString();

      expect(expr, r"poster.email != 'bruce@example.com'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.poster.email.greaterThan(.val('bruce@example.com')),
      ).toString();
      expect(expr, r"poster.email > 'bruce@example.com'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.email.greaterThanOrEqual(.val('bruce@example.com')),
      ).toString();
      expect(expr, r"poster.email >= 'bruce@example.com'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.poster.email.lessThan(.val('bruce@example.com')),
      ).toString();
      expect(expr, r"poster.email < 'bruce@example.com'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.email.lessThanOrEqual(.val('bruce@example.com')),
      ).toString();
      expect(expr, r"poster.email <= 'bruce@example.com'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.poster.email.like(.val('bruce@example.com')),
      ).toString();

      expect(expr, r"poster.email ~ 'bruce@example.com'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.poster.email.notLike(.val('bruce@example.com')),
      ).toString();

      expect(expr, r"poster.email !~ 'bruce@example.com'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.email.anyEqual(.val("test@example.com")),
      ).toString();

      expect(expr, "tagged.email ?= 'test@example.com'");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.email.anyNotEqual(.val("test@example.com")),
      ).toString();

      expect(expr, "tagged.email ?!= 'test@example.com'");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.email.anyGreaterThan(.val("test@example.com")),
      ).toString();

      expect(expr, "tagged.email ?> 'test@example.com'");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.email.anyGreaterThanOrEqual(.val("test@example.com")),
      ).toString();

      expect(expr, "tagged.email ?>= 'test@example.com'");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.email.anyLessThan(.val("test@example.com")),
      ).toString();

      expect(expr, "tagged.email ?< 'test@example.com'");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.email.anyLessThanOrEqual(.val("test@example.com")),
      ).toString();

      expect(expr, "tagged.email ?<= 'test@example.com'");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.email.anyLike(.val("test@example.com")),
      ).toString();

      expect(expr, "tagged.email ?~ 'test@example.com'");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.email.anyNotLike(.val("test@example.com")),
      ).toString();

      expect(expr, "tagged.email ?!~ 'test@example.com'");
    });
  });

  group('operators (bool)', () {
    test('equal', () {
      var expr = PostsDto.filter((f) => f.draft.equal(.val(true))).toString();
      expect(expr, r"draft = true");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.draft.notEqual(.val(true)),
      ).toString();

      expect(expr, r"draft != true");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.draft.greaterThan(.val(true)),
      ).toString();
      expect(expr, r"draft > true");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.draft.greaterThanOrEqual(.val(true)),
      ).toString();
      expect(expr, r"draft >= true");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.draft.lessThan(.val(true)),
      ).toString();
      expect(expr, r"draft < true");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.draft.lessThanOrEqual(.val(true)),
      ).toString();
      expect(expr, r"draft <= true");
    });
    test('like', () {
      var expr = PostsDto.filter((f) => f.draft.like(.val(true))).toString();

      expect(expr, r"draft ~ true");
    });
    test('notLike', () {
      var expr = PostsDto.filter((f) => f.draft.notLike(.val(true))).toString();

      expect(expr, r"draft !~ true");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.verified.anyEqual(.val(true)),
      ).toString();

      expect(expr, "tagged.verified ?= true");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.verified.anyNotEqual(.val(true)),
      ).toString();

      expect(expr, "tagged.verified ?!= true");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.verified.anyGreaterThan(.val(true)),
      ).toString();

      expect(expr, "tagged.verified ?> true");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.verified.anyGreaterThanOrEqual(.val(true)),
      ).toString();

      expect(expr, "tagged.verified ?>= true");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.verified.anyLessThan(.val(true)),
      ).toString();

      expect(expr, "tagged.verified ?< true");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.verified.anyLessThanOrEqual(.val(true)),
      ).toString();

      expect(expr, "tagged.verified ?<= true");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.verified.anyLike(.val(true)),
      ).toString();

      expect(expr, "tagged.verified ?~ true");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.verified.anyNotLike(.val(true)),
      ).toString();

      expect(expr, "tagged.verified ?!~ true");
    });
  });

  group('operators (file)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.photo.equal(.val(FileDto.remote('test.jpg'))),
      ).toString();
      expect(expr, r"photo = 'test.jpg'");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.photo.notEqual(.val(FileDto.remote('test.jpg'))),
      ).toString();

      expect(expr, r"photo != 'test.jpg'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.photo.greaterThan(.val(FileDto.remote('test.jpg'))),
      ).toString();
      expect(expr, r"photo > 'test.jpg'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.photo.greaterThanOrEqual(.val(FileDto.remote('test.jpg'))),
      ).toString();
      expect(expr, r"photo >= 'test.jpg'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.photo.lessThan(.val(FileDto.remote('test.jpg'))),
      ).toString();
      expect(expr, r"photo < 'test.jpg'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.photo.lessThanOrEqual(.val(FileDto.remote('test.jpg'))),
      ).toString();
      expect(expr, r"photo <= 'test.jpg'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.photo.like(.val(FileDto.remote('test.jpg'))),
      ).toString();

      expect(expr, r"photo ~ 'test.jpg'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.photo.notLike(.val(FileDto.remote('test.jpg'))),
      ).toString();

      expect(expr, r"photo !~ 'test.jpg'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.avatar.anyEqual(.val(FileDto.remote('test.jpg'))),
      ).toString();

      expect(expr, "tagged.avatar ?= 'test.jpg'");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.avatar.anyNotEqual(.val(FileDto.remote('test.jpg'))),
      ).toString();

      expect(expr, "tagged.avatar ?!= 'test.jpg'");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.avatar.anyGreaterThan(.val(FileDto.remote('test.jpg'))),
      ).toString();

      expect(expr, "tagged.avatar ?> 'test.jpg'");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.avatar.anyGreaterThanOrEqual(
          .val(FileDto.remote('test.jpg')),
        ),
      ).toString();

      expect(expr, "tagged.avatar ?>= 'test.jpg'");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.avatar.anyLessThan(.val(FileDto.remote('test.jpg'))),
      ).toString();

      expect(expr, "tagged.avatar ?< 'test.jpg'");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.avatar.anyLessThanOrEqual(
          .val(FileDto.remote('test.jpg')),
        ),
      ).toString();

      expect(expr, "tagged.avatar ?<= 'test.jpg'");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.avatar.anyLike(.val(FileDto.remote('test.jpg'))),
      ).toString();

      expect(expr, "tagged.avatar ?~ 'test.jpg'");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.avatar.anyNotLike(.val(FileDto.remote('test.jpg'))),
      ).toString();

      expect(expr, "tagged.avatar ?!~ 'test.jpg'");
    });
  });

  group('operators (enum)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.visibility.equal(.val(.friends)),
      ).toString();
      expect(expr, r"visibility = 'friends'");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.visibility.notEqual(.val(.friends)),
      ).toString();

      expect(expr, r"visibility != 'friends'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.visibility.greaterThan(.val(.friends)),
      ).toString();
      expect(expr, r"visibility > 'friends'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.visibility.greaterThanOrEqual(.val(.friends)),
      ).toString();
      expect(expr, r"visibility >= 'friends'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.visibility.lessThan(.val(.friends)),
      ).toString();
      expect(expr, r"visibility < 'friends'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.visibility.lessThanOrEqual(.val(.friends)),
      ).toString();
      expect(expr, r"visibility <= 'friends'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.visibility.like(.val(.friends)),
      ).toString();

      expect(expr, r"visibility ~ 'friends'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.visibility.notLike(.val(.friends)),
      ).toString();

      expect(expr, "visibility !~ 'friends'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.blocksViaBlocked.type.anyEqual(.val(.mute)),
      ).toString();

      expect(expr, "tagged.blocks_via_blocked.type ?= 'mute'");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.blocksViaBlocked.type.anyNotEqual(.val(.mute)),
      ).toString();

      expect(expr, "tagged.blocks_via_blocked.type ?!= 'mute'");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.blocksViaBlocked.type.anyGreaterThan(.val(.mute)),
      ).toString();

      expect(expr, "tagged.blocks_via_blocked.type ?> 'mute'");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) =>
            f.tagged.blocksViaBlocked.type.anyGreaterThanOrEqual(.val(.mute)),
      ).toString();

      expect(expr, "tagged.blocks_via_blocked.type ?>= 'mute'");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.blocksViaBlocked.type.anyLessThan(.val(.mute)),
      ).toString();

      expect(expr, "tagged.blocks_via_blocked.type ?< 'mute'");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.blocksViaBlocked.type.anyLessThanOrEqual(.val(.mute)),
      ).toString();

      expect(expr, "tagged.blocks_via_blocked.type ?<= 'mute'");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.blocksViaBlocked.type.anyLike(.val(.mute)),
      ).toString();

      expect(expr, "tagged.blocks_via_blocked.type ?~ 'mute'");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.blocksViaBlocked.type.anyNotLike(.val(.mute)),
      ).toString();

      expect(expr, "tagged.blocks_via_blocked.type ?!~ 'mute'");
    });
  });

  group('operators (relation)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.poster.equal(.val(RelationDto('abc123'))),
      ).toString();
      expect(expr, r"poster = 'abc123'");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.notEqual(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, r"poster != 'abc123'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.poster.greaterThan(.val(RelationDto('abc123'))),
      ).toString();
      expect(expr, r"poster > 'abc123'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.greaterThanOrEqual(.val(RelationDto('abc123'))),
      ).toString();
      expect(expr, r"poster >= 'abc123'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.poster.lessThan(.val(RelationDto('abc123'))),
      ).toString();
      expect(expr, r"poster < 'abc123'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.poster.lessThanOrEqual(.val(RelationDto('abc123'))),
      ).toString();
      expect(expr, r"poster <= 'abc123'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.poster.like(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, r"poster ~ 'abc123'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.poster.notLike(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, r"poster !~ 'abc123'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.anyEqual(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, "tagged ?= 'abc123'");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.anyNotEqual(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, "tagged ?!= 'abc123'");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.anyGreaterThan(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, "tagged ?> 'abc123'");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.anyGreaterThanOrEqual(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, "tagged ?>= 'abc123'");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.anyLessThan(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, "tagged ?< 'abc123'");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.anyLessThanOrEqual(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, "tagged ?<= 'abc123'");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.anyLike(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, "tagged ?~ 'abc123'");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.anyNotLike(.val(RelationDto('abc123'))),
      ).toString();

      expect(expr, "tagged ?!~ 'abc123'");
    });
  });

  group('operators (autodate)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.created.equal(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"created = '2025-08-04 02:03:04.000Z'");
    });
    test('equal (not UTC)', () {
      var expr = PostsDto.filter(
        (f) => f.created.equal(.val(.new(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, startsWith("created = '"));
      expect(expr, endsWith("Z'"));
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.created.notEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, r"created != '2025-08-04 02:03:04.000Z'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.created.greaterThan(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"created > '2025-08-04 02:03:04.000Z'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.created.greaterThanOrEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"created >= '2025-08-04 02:03:04.000Z'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.created.lessThan(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"created < '2025-08-04 02:03:04.000Z'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.created.lessThanOrEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"created <= '2025-08-04 02:03:04.000Z'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.created.like(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, r"created ~ '2025-08-04 02:03:04.000Z'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.created.notLike(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, r"created !~ '2025-08-04 02:03:04.000Z'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.created.anyEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.created ?= '2025-08-04 02:03:04.000Z'");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.created.anyNotEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.created ?!= '2025-08-04 02:03:04.000Z'");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.created.anyGreaterThan(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.created ?> '2025-08-04 02:03:04.000Z'");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.created.anyGreaterThanOrEqual(
          .val(.utc(2025, 8, 4, 2, 3, 4)),
        ),
      ).toString();

      expect(expr, "tagged.created ?>= '2025-08-04 02:03:04.000Z'");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.created.anyLessThan(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.created ?< '2025-08-04 02:03:04.000Z'");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.created.anyLessThanOrEqual(
          .val(.utc(2025, 8, 4, 2, 3, 4)),
        ),
      ).toString();

      expect(expr, "tagged.created ?<= '2025-08-04 02:03:04.000Z'");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.created.anyLike(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.created ?~ '2025-08-04 02:03:04.000Z'");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.created.anyNotLike(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.created ?!~ '2025-08-04 02:03:04.000Z'");
    });
  });

  group('operators (date)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.scheduled.equal(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"scheduled = '2025-08-04 02:03:04.000Z'");
    });
    test('equal (not UTC)', () {
      var expr = PostsDto.filter(
        (f) => f.scheduled.equal(.val(.new(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, startsWith("scheduled = '"));
      expect(expr, endsWith("Z'"));
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.scheduled.notEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, r"scheduled != '2025-08-04 02:03:04.000Z'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.scheduled.greaterThan(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"scheduled > '2025-08-04 02:03:04.000Z'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.scheduled.greaterThanOrEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"scheduled >= '2025-08-04 02:03:04.000Z'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.scheduled.lessThan(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"scheduled < '2025-08-04 02:03:04.000Z'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.scheduled.lessThanOrEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();
      expect(expr, r"scheduled <= '2025-08-04 02:03:04.000Z'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.scheduled.like(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, r"scheduled ~ '2025-08-04 02:03:04.000Z'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.scheduled.notLike(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, r"scheduled !~ '2025-08-04 02:03:04.000Z'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.birthday.anyEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.birthday ?= '2025-08-04 02:03:04.000Z'");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.birthday.anyNotEqual(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.birthday ?!= '2025-08-04 02:03:04.000Z'");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) =>
            f.tagged.birthday.anyGreaterThan(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.birthday ?> '2025-08-04 02:03:04.000Z'");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.birthday.anyGreaterThanOrEqual(
          .val(.utc(2025, 8, 4, 2, 3, 4)),
        ),
      ).toString();

      expect(expr, "tagged.birthday ?>= '2025-08-04 02:03:04.000Z'");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.birthday.anyLessThan(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.birthday ?< '2025-08-04 02:03:04.000Z'");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.birthday.anyLessThanOrEqual(
          .val(.utc(2025, 8, 4, 2, 3, 4)),
        ),
      ).toString();

      expect(expr, "tagged.birthday ?<= '2025-08-04 02:03:04.000Z'");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.birthday.anyLike(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.birthday ?~ '2025-08-04 02:03:04.000Z'");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.birthday.anyNotLike(.val(.utc(2025, 8, 4, 2, 3, 4))),
      ).toString();

      expect(expr, "tagged.birthday ?!~ '2025-08-04 02:03:04.000Z'");
    });
  });

  group('operators (url)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.link.equal(.val('https://www.google.com')),
      ).toString();
      expect(expr, r"link = 'https://www.google.com'");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.link.notEqual(.val('https://www.google.com')),
      ).toString();

      expect(expr, r"link != 'https://www.google.com'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.link.greaterThan(.val('https://www.google.com')),
      ).toString();
      expect(expr, r"link > 'https://www.google.com'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.link.greaterThanOrEqual(.val('https://www.google.com')),
      ).toString();
      expect(expr, r"link >= 'https://www.google.com'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.link.lessThan(.val('https://www.google.com')),
      ).toString();
      expect(expr, r"link < 'https://www.google.com'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.link.lessThanOrEqual(.val('https://www.google.com')),
      ).toString();
      expect(expr, r"link <= 'https://www.google.com'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.link.like(.val('https://www.google.com')),
      ).toString();

      expect(expr, r"link ~ 'https://www.google.com'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.link.notLike(.val('https://www.google.com')),
      ).toString();

      expect(expr, r"link !~ 'https://www.google.com'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.homepage.anyEqual(.val("https://www.google.com")),
      ).toString();

      expect(expr, "tagged.homepage ?= 'https://www.google.com'");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.homepage.anyNotEqual(.val("https://www.google.com")),
      ).toString();

      expect(expr, "tagged.homepage ?!= 'https://www.google.com'");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.homepage.anyGreaterThan(.val("https://www.google.com")),
      ).toString();

      expect(expr, "tagged.homepage ?> 'https://www.google.com'");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.homepage.anyGreaterThanOrEqual(
          .val("https://www.google.com"),
        ),
      ).toString();

      expect(expr, "tagged.homepage ?>= 'https://www.google.com'");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.homepage.anyLessThan(.val("https://www.google.com")),
      ).toString();

      expect(expr, "tagged.homepage ?< 'https://www.google.com'");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.homepage.anyLessThanOrEqual(
          .val("https://www.google.com"),
        ),
      ).toString();

      expect(expr, "tagged.homepage ?<= 'https://www.google.com'");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.homepage.anyLike(.val("https://www.google.com")),
      ).toString();

      expect(expr, "tagged.homepage ?~ 'https://www.google.com'");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.homepage.anyNotLike(.val("https://www.google.com")),
      ).toString();

      expect(expr, "tagged.homepage ?!~ 'https://www.google.com'");
    });
  });

  group('operators (json)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.metadata.equal(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();
      expect(expr, "metadata = '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.metadata.notEqual(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(expr, "metadata != '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.metadata.greaterThan(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();
      expect(expr, "metadata > '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.metadata.greaterThanOrEqual(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();
      expect(expr, "metadata >= '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.metadata.lessThan(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();
      expect(expr, "metadata < '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.metadata.lessThanOrEqual(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();
      expect(expr, "metadata <= '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.metadata.like(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(expr, "metadata ~ '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.metadata.notLike(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(expr, "metadata !~ '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.metadata.anyEqual(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(
        expr,
        "tagged.metadata ?= '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'",
      );
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.metadata.anyNotEqual(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(
        expr,
        "tagged.metadata ?!= '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'",
      );
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.metadata.anyGreaterThan(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(
        expr,
        "tagged.metadata ?> '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'",
      );
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.metadata.anyGreaterThanOrEqual(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(
        expr,
        "tagged.metadata ?>= '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'",
      );
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.metadata.anyLessThan(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(
        expr,
        "tagged.metadata ?< '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'",
      );
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.metadata.anyLessThanOrEqual(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(
        expr,
        "tagged.metadata ?<= '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'",
      );
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.metadata.anyLike(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(
        expr,
        "tagged.metadata ?~ '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'",
      );
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.metadata.anyNotLike(
          .val({
            'b': [
              {'d': true, 'c': false},
            ],
            'a': 5,
          }),
        ),
      ).toString();

      expect(
        expr,
        "tagged.metadata ?!~ '{\"a\":5,\"b\":[{\"c\":false,\"d\":true}]}'",
      );
    });
  });

  group('operators (editor)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.message.equal(.val('<p><b>"For"</b> <i>\'sure\'</i></p>')),
      ).toString();
      expect(expr, "message = '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.message.notEqual(.val('<p><b>"For"</b> <i>\'sure\'</i></p>')),
      ).toString();

      expect(expr, "message != '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) =>
            f.message.greaterThan(.val('<p><b>"For"</b> <i>\'sure\'</i></p>')),
      ).toString();
      expect(expr, "message > '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.message.greaterThanOrEqual(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();
      expect(expr, "message >= '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.message.lessThan(.val('<p><b>"For"</b> <i>\'sure\'</i></p>')),
      ).toString();
      expect(expr, "message < '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.message.lessThanOrEqual(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();
      expect(expr, "message <= '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.message.like(.val('<p><b>"For"</b> <i>\'sure\'</i></p>')),
      ).toString();

      expect(expr, "message ~ '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.message.notLike(.val('<p><b>"For"</b> <i>\'sure\'</i></p>')),
      ).toString();

      expect(expr, "message !~ '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.biography.anyEqual(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();

      expect(
        expr,
        "tagged.biography ?= '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'",
      );
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.biography.anyNotEqual(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();

      expect(
        expr,
        "tagged.biography ?!= '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'",
      );
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.biography.anyGreaterThan(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();

      expect(
        expr,
        "tagged.biography ?> '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'",
      );
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.biography.anyGreaterThanOrEqual(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();

      expect(
        expr,
        "tagged.biography ?>= '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'",
      );
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.biography.anyLessThan(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();

      expect(
        expr,
        "tagged.biography ?< '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'",
      );
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.biography.anyLessThanOrEqual(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();

      expect(
        expr,
        "tagged.biography ?<= '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'",
      );
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.biography.anyLike(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();

      expect(
        expr,
        "tagged.biography ?~ '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'",
      );
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.biography.anyNotLike(
          .val('<p><b>"For"</b> <i>\'sure\'</i></p>'),
        ),
      ).toString();

      expect(
        expr,
        "tagged.biography ?!~ '<p><b>\"For\"</b> <i>\\'sure\\'</i></p>'",
      );
    });
  });

  group('operators (geoPoint)', () {
    test('equal', () {
      var expr = PostsDto.filter(
        (f) => f.location.equal(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();
      expect(expr, "location = '{\"lon\":-118,\"lat\":34}'");
    });
    test('notEqual', () {
      var expr = PostsDto.filter(
        (f) => f.location.notEqual(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();

      expect(expr, "location != '{\"lon\":-118,\"lat\":34}'");
    });
    test('greaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.location.greaterThan(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();
      expect(expr, "location > '{\"lon\":-118,\"lat\":34}'");
    });
    test('greaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.location.greaterThanOrEqual(
          .val(GeopointDto(lat: 34, lon: -118)),
        ),
      ).toString();
      expect(expr, "location >= '{\"lon\":-118,\"lat\":34}'");
    });
    test('lessThan', () {
      var expr = PostsDto.filter(
        (f) => f.location.lessThan(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();
      expect(expr, "location < '{\"lon\":-118,\"lat\":34}'");
    });
    test('lessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) =>
            f.location.lessThanOrEqual(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();
      expect(expr, "location <= '{\"lon\":-118,\"lat\":34}'");
    });
    test('like', () {
      var expr = PostsDto.filter(
        (f) => f.location.like(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();

      expect(expr, "location ~ '{\"lon\":-118,\"lat\":34}'");
    });
    test('notLike', () {
      var expr = PostsDto.filter(
        (f) => f.location.notLike(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();

      expect(expr, "location !~ '{\"lon\":-118,\"lat\":34}'");
    });
    test('anyEqual', () {
      var expr = PostsDto.filter(
        (f) =>
            f.tagged.hometown.anyEqual(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();

      expect(expr, "tagged.hometown ?= '{\"lon\":-118,\"lat\":34}'");
    });
    test('anyNotEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.hometown.anyNotEqual(
          .val(GeopointDto(lat: 34, lon: -118)),
        ),
      ).toString();

      expect(expr, "tagged.hometown ?!= '{\"lon\":-118,\"lat\":34}'");
    });
    test('anyGreaterThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.hometown.anyGreaterThan(
          .val(GeopointDto(lat: 34, lon: -118)),
        ),
      ).toString();

      expect(expr, "tagged.hometown ?> '{\"lon\":-118,\"lat\":34}'");
    });
    test('anyGreaterThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.hometown.anyGreaterThanOrEqual(
          .val(GeopointDto(lat: 34, lon: -118)),
        ),
      ).toString();

      expect(expr, "tagged.hometown ?>= '{\"lon\":-118,\"lat\":34}'");
    });
    test('anyLessThan', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.hometown.anyLessThan(
          .val(GeopointDto(lat: 34, lon: -118)),
        ),
      ).toString();

      expect(expr, "tagged.hometown ?< '{\"lon\":-118,\"lat\":34}'");
    });
    test('anyLessThanOrEqual', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.hometown.anyLessThanOrEqual(
          .val(GeopointDto(lat: 34, lon: -118)),
        ),
      ).toString();

      expect(expr, "tagged.hometown ?<= '{\"lon\":-118,\"lat\":34}'");
    });
    test('anyLike', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.hometown.anyLike(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();

      expect(expr, "tagged.hometown ?~ '{\"lon\":-118,\"lat\":34}'");
    });
    test('anyNotLike', () {
      var expr = PostsDto.filter(
        (f) =>
            f.tagged.hometown.anyNotLike(.val(GeopointDto(lat: 34, lon: -118))),
      ).toString();

      expect(expr, "tagged.hometown ?!~ '{\"lon\":-118,\"lat\":34}'");
    });
  });

  group('modifiers (length)', () {
    test('relation', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.length().equal(.val(3)),
      ).toString();
      expect(expr, "tagged:length = 3");
    });
  });

  group('modifiers (each)', () {
    test('select', () {
      var expr = PostsDto.filter(
        (f) => f.tagged.zodiac.each().notEqual(.val(.cancer)),
      ).toString();
      expect(expr, "tagged.zodiac:each != 'cancer'");
    });
  });
}
