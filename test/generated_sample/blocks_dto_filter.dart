import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'blocks_dto.dart';
import 'users_dto_comparison_builder.dart';

class BlocksDtoFilter extends DtoFilterBase<BlocksDto, BlocksDtoFilter> {
  @override
  BlocksDtoFilter empty() => BlocksDtoFilter();

  UsersDtoComparisonBuilder<BlocksDto> get blocker =>
      UsersDtoComparisonBuilder(SoloFieldPath(BlocksDtoFieldEnum.blocker), add);
  UsersDtoComparisonBuilder<BlocksDto> get blocked =>
      UsersDtoComparisonBuilder(SoloFieldPath(BlocksDtoFieldEnum.blocked), add);
  ComparisonBuilder<BlocksDto, BlocksTypeEnum> get type =>
      ComparisonBuilder.field(BlocksDtoFieldEnum.type, add);
  ComparisonBuilder<BlocksDto, String> get id =>
      ComparisonBuilder.field(BlocksDtoFieldEnum.id, add);

  // Back relations
}
