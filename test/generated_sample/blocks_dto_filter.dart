import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'blocks_dto.dart';
import 'users_dto_comparison_builder.dart';

class BlocksDtoFilter extends DtoFilter<BlocksDto> {
  UsersDtoComparisonBuilder<BlocksDto> blocker() =>
      UsersDtoComparisonBuilder(SoloFieldPath(BlocksDtoFieldEnum.blocker), add);
  UsersDtoComparisonBuilder<BlocksDto> blocked() =>
      UsersDtoComparisonBuilder(SoloFieldPath(BlocksDtoFieldEnum.blocked), add);
  ComparisonBuilder<BlocksDto, BlocksTypeEnum> type() =>
      ComparisonBuilder.field(BlocksDtoFieldEnum.type, add);
  ComparisonBuilder<BlocksDto, String> id() =>
      ComparisonBuilder.field(BlocksDtoFieldEnum.id, add);

  // Back relations
}
