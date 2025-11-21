import 'package:pb_dtos/pb/dto/relation_dto.dart';

import 'generated_sample/friends_dto.dart';
import 'generated_sample/posts_dto.dart';
import 'generated_sample/posts_dto_expand.dart';
import 'generated_sample/users_dto.dart';
import 'generated_sample/users_dto_expand.dart';

void filters() {
  var expression = PostsDto.filter(
    (f) => f.poster().roles().permissions().name().anyEqual("donuts.favorite"),
  );
  var permissionsTerminalPath = PostsDto.filter(
    (f) => f.poster().roles().permissions().anyEqual(RelationDto("abcdef")),
  );
  var usersWhoUploadedSixSeven = UsersDto.filter(
    (f) => f
        .postsViaPoster()
        .reviewStars()
        .equal(6)
        .and(
          UsersDto.filter(
            (f) => f.postsViaPoster().reviewStars().equal(7),
          ).expression!,
        ),
  );
  var vote = FriendsDto.filter(
    (f) => f
      ..requester().equal(RelationDto("abcdef"))
      ..accepter().equal(RelationDto("ghijkl")),
  );
  print(expression);
  print(permissionsTerminalPath);
  print(usersWhoUploadedSixSeven);
  print(vote);
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
