import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'follows_dto.dart';

class FollowsDtoMeta extends DtoMeta<FollowsDto> {
  const FollowsDtoMeta();

  @override
  final String collectionName = 'follows';

  @override
  FollowsDto fromRecord(RecordModel model) => FollowsDto.fromRecord(model);
}
