import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'private_profiles_dto.dart';
import 'private_profiles_dto_filter.dart';
import 'private_profiles_dto_expand.dart';
import 'private_profiles_dto_sort.dart';
import 'private_profiles_dto_field_select.dart';

class PrivateProfilesDtoMeta
    extends
        DtoMeta<
          PrivateProfilesDto,
          PrivateProfilesDtoFilter,
          PrivateProfilesDtoExpand<PrivateProfilesDto>,
          PrivateProfilesDtoSort<PrivateProfilesDto>,
          PrivateProfilesDtoFieldSelect<PrivateProfilesDto>
        > {
  const PrivateProfilesDtoMeta();

  @override
  final String collectionName = 'private_profiles';

  @override
  PrivateProfilesDto fromRecord(RecordModel model) =>
      PrivateProfilesDto.fromRecord(model);

  @override
  PrivateProfilesDtoExpand<PrivateProfilesDto> expansions() =>
      PrivateProfilesDtoExpand();

  @override
  PrivateProfilesDtoFieldSelect<PrivateProfilesDto> fields() =>
      PrivateProfilesDtoFieldSelect();

  @override
  PrivateProfilesDtoFilter filter() => PrivateProfilesDtoFilter();

  @override
  PrivateProfilesDtoSort<PrivateProfilesDto> sort() => PrivateProfilesDtoSort();
}
