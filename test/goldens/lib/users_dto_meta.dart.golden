import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'users_dto.dart';
import 'users_dto_filter.dart';
import 'users_dto_expand.dart';
import 'users_dto_sort.dart';
import 'users_dto_field_select.dart';

class UsersDtoMeta
    extends
        DtoMeta<
          UsersDto,
          UsersDtoFilter,
          UsersDtoExpand<UsersDto>,
          UsersDtoSort<UsersDto>,
          UsersDtoFieldSelect<UsersDto>
        > {
  const UsersDtoMeta();

  @override
  final String collectionName = 'users';

  @override
  UsersDto fromRecord(RecordModel model) => UsersDto.fromRecord(model);

  @override
  UsersDtoExpand<UsersDto> expansions() => UsersDtoExpand();

  @override
  UsersDtoFieldSelect<UsersDto> fields() => UsersDtoFieldSelect();

  @override
  UsersDtoFilter filter() => UsersDtoFilter();

  @override
  UsersDtoSort<UsersDto> sort() => UsersDtoSort();
}
