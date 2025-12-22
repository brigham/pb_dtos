import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'private_profiles_dto.dart';
import 'users_dto_comparison_builder.dart';

class PrivateProfilesDtoFilter
    extends DtoFilterBase<PrivateProfilesDto, PrivateProfilesDtoFilter> {
  @override
  PrivateProfilesDtoFilter empty() => PrivateProfilesDtoFilter();

  ComparisonBuilder<PrivateProfilesDto, String> get id =>
      ComparisonBuilder.field(PrivateProfilesDtoFieldEnum.id, add);
  UsersDtoComparisonBuilder<PrivateProfilesDto> get user =>
      UsersDtoComparisonBuilder(
        SoloFieldPath(PrivateProfilesDtoFieldEnum.user),
        add,
      );
  ComparisonBuilder<PrivateProfilesDto, String> get note =>
      ComparisonBuilder.field(PrivateProfilesDtoFieldEnum.note, add);

  // Back relations
}
