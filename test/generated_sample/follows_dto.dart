import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocketbase/pocketbase.dart' show RecordModel;
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'users_dto.dart';
import 'follows_dto_field_select.dart';
import 'follows_dto_filter.dart';
import 'follows_dto_meta.dart';
import 'follows_dto_sort.dart';
import 'follows_patch_dto.dart';
import 'follows_dto_expand.dart';
import 'package:http/http.dart' as http;

part 'follows_dto.freezed.dart';
part 'follows_dto.g.dart';

enum FollowsDtoFieldEnum<V, A> implements DtoTypedField<FollowsDto, V, A> {
  follower<RelationDto<UsersDto>, RelationDto<UsersDto>>(
    'follower',
    DtoRelationFieldSettings(
      required: true,
      collectionId: '_pb_users_auth_',
      cascadeDelete: false,
      minSelect: 1,
      maxSelect: 1,
    ),
  ),
  following<RelationDto<UsersDto>, RelationDto<UsersDto>>(
    'following',
    DtoRelationFieldSettings(
      required: true,
      collectionId: '_pb_users_auth_',
      cascadeDelete: false,
      minSelect: 1,
      maxSelect: 1,
    ),
  ),
  id<String, String>(
    'id',
    DtoTextFieldSettings(
      required: true,
      autogeneratePattern: '[a-z0-9]{15}',
      min: 15,
      max: 15,
      pattern: r'^[a-z0-9]+$',
    ),
  );

  const FollowsDtoFieldEnum(this.pbName, this.settings);

  @override
  A get(FollowsDto dto) {
    switch (this) {
      case .follower:
        return dto.follower as A;
      case .following:
        return dto.following as A;
      case .id:
        return dto.id as A;
    }
  }

  @override
  FollowsDto copyWith(FollowsDto dto, A value) {
    switch (this) {
      case .follower:
        return dto.copyWith(follower: value as RelationDto<UsersDto>);
      case .following:
        return dto.copyWith(following: value as RelationDto<UsersDto>);
      case .id:
        return dto.copyWith(id: value as String);
    }
  }

  @override
  final String pbName;

  @override
  final DtoFieldSettings settings;
}

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class FollowsDto with _$FollowsDto implements Dto<FollowsDto> {
  static FollowsDtoMeta meta() => const FollowsDtoMeta();

  static FollowsDtoSort<FollowsDto> sort(
    void Function(FollowsDtoSort<FollowsDto>) builder,
  ) {
    var sort = FollowsDtoSort<FollowsDto>();
    builder(sort);
    return sort;
  }

  static FollowsDtoFilter filter(void Function(FollowsDtoFilter) builder) {
    var filter = FollowsDtoFilter();
    builder(filter);
    return filter;
  }

  static FollowsDtoFilter filterByIdxFollowsFollowerFollowing(
    RelationDto<UsersDto> follower, [
    RelationDto<UsersDto>? following,
  ]) {
    final f = FollowsDtoFilter();
    f.follower.equal(.val(follower));
    if (following != null) f.following.equal(.val(following));
    return f;
  }

  static FollowsDtoSort<FollowsDto> sortByIdxFollowsFollowerFollowing() {
    final s = FollowsDtoSort<FollowsDto>();
    s.follower();
    s.following();
    return s;
  }

  static FollowsPatchDto patch(void Function(FollowsPatchDto) builder) {
    var patch = FollowsPatchDto();
    builder(patch);
    return patch;
  }

  @override
  FollowsPatchDto asPatch() => FollowsPatchDto()
    ..follower = follower
    ..following = following;

  @override
  FollowsPatchDto diff(FollowsDto newValue) => FollowsPatchDto()
    ..follower = follower != newValue.follower ? newValue.follower : null
    ..following = following != newValue.following ? newValue.following : null;

  static FollowsDtoExpand<FollowsDto> expansions(
    void Function(FollowsDtoExpand) builder,
  ) {
    var expansions = FollowsDtoExpand<FollowsDto>();
    builder(expansions);
    return expansions;
  }

  static FollowsDtoFieldSelect<FollowsDto> fields(
    void Function(FollowsDtoFieldSelect<FollowsDto>) builder,
  ) {
    var select = FollowsDtoFieldSelect<FollowsDto>();
    builder(select);
    return select;
  }

  FollowsDto({
    this.follower = const RelationDto<UsersDto>(''),
    this.following = const RelationDto<UsersDto>(''),
    this.id = '',
    this.expand,
  });

  @override
  final RelationDto<UsersDto> follower;
  @override
  final RelationDto<UsersDto> following;
  @JsonKey(toJson: Dto.optionalStringToJson)
  @override
  final String id;
  @JsonKey(includeToJson: false)
  @override
  final FollowsExpandDto? expand;

  factory FollowsDto.fromRecord(RecordModel record) =>
      FollowsDto.fromJson(record.toJson());

  factory FollowsDto.fromJson(Map<String, dynamic> json) =>
      _$FollowsDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FollowsDtoToJson(this);

  @override
  List<Future<http.MultipartFile>> toFiles() => const [];

  @override
  RelationDto<FollowsDto> asRelation() => RelationDto(id);
}
