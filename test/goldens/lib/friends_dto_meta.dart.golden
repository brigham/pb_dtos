import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'friends_dto.dart';
import 'friends_dto_filter.dart';
import 'friends_dto_expand.dart';
import 'friends_dto_sort.dart';
import 'friends_dto_field_select.dart';

class FriendsDtoMeta
    extends
        DtoMeta<
          FriendsDto,
          FriendsDtoFilter,
          FriendsDtoExpand<FriendsDto>,
          FriendsDtoSort<FriendsDto>,
          FriendsDtoFieldSelect<FriendsDto>
        > {
  const FriendsDtoMeta();

  @override
  final String collectionName = 'friends';

  @override
  FriendsDto fromRecord(RecordModel model) => FriendsDto.fromRecord(model);

  @override
  FriendsDtoExpand<FriendsDto> expansions() => FriendsDtoExpand();

  @override
  FriendsDtoFieldSelect<FriendsDto> fields() => FriendsDtoFieldSelect();

  @override
  FriendsDtoFilter filter() => FriendsDtoFilter();

  @override
  FriendsDtoSort<FriendsDto> sort() => FriendsDtoSort();
}
