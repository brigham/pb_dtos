import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'posts_dto.dart';

class PostsDtoMeta extends DtoMeta<PostsDto> {
  const PostsDtoMeta();

  @override
  final String collectionName = 'posts';

  @override
  PostsDto fromRecord(RecordModel model) => PostsDto.fromRecord(model);
}
