import 'package:pb_dtos/pb/dto/relation_dto.dart';

import 'generated_sample/friends_dto.dart';
import 'generated_sample/posts_dto.dart';
import 'generated_sample/posts_dto_expand.dart';
import 'generated_sample/users_dto.dart';
import 'generated_sample/users_dto_expand.dart';

void filters() {
  var expression = PostsDto.filter(
    (f) => f.poster.roles.permissions.name.anyEqual(.val("donuts.favorite")),
  );
  var permissionsTerminalPath = PostsDto.filter(
    (f) =>
        f.poster.roles.permissions.anyEqual(.val(RelationDto("abcdef"))),
  );
  var usersWhoUploadedSixAndSeven = UsersDto.filter(
    (f) => f
      ..postsViaPoster.reviewStars.equal(.val(6))
      ..postsViaPoster.reviewStars.equal(.val(7)),
  );
  var usersWhoUploadedSixOrSeven = UsersDto.filter(
    (f) => f
      ..or([
        (f) => f..postsViaPoster.reviewStars.equal(.val(6)),
        (f) => f.postsViaPoster.reviewStars.equal(.val(7)),
      ]),
  );
  var vote = FriendsDto.filter(
    (f) => f
      ..requester.equal(.val(RelationDto("abcdef")))
      ..accepter.equal(.val(RelationDto("ghijkl"))),
  );
  var likedOwnPost = PostsDto.filter(
    (f) => f..tagged.anyEqual(.field(f.poster)),
  );
  var taggedFriends = FriendsDto.filter(
    (f) => f
      ..requester.postsViaPoster.tagged.anyEqual(
        .field(f.accepter.blocksViaBlocked.blocker),
      ),
  );
  print(expression);
  print(permissionsTerminalPath);
  print(usersWhoUploadedSixAndSeven);
  print(usersWhoUploadedSixOrSeven);
  print(vote);
  print(likedOwnPost);
  print(taggedFriends);
}

void sorts() {
  print(PostsDto.sort((s) => s..poster().roles().permissions().name()));
  print(
    PostsDto.sort(
      (s) => s
        ..reviewStars()
        ..id()
        ..poster().name()
        ..poster().roles().permissions().name(),
    ),
  );
}

void expands() {
  print(PostsDtoExpand<PostsDto>()..poster());
  print(PostsDtoExpand<PostsDto>()..poster().roles().permissions());
  print(
    UsersDtoExpand<UsersDto>()
      ..roles().permissions()
      ..postsViaPoster()
      ..postsViaTagged()
      ..friendsViaRequester().requester(),
  );
}

void fields() {
  print(
    PostsDto.fields(
      (f) => f
        ..star_()
        ..expand().poster().roles().permissions().name(),
    ),
  );
  print(PostsDto.fields((f) => f..message().excerpt(9, withEllipsis: true)));
}

void main() {
  filters();
  sorts();
  expands();
  fields();
}
