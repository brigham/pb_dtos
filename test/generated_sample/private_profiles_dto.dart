import 'package:freezed_annotation/freezed_annotation.dart';
import "package:pocketbase/pocketbase.dart" show RecordModel;
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'users_dto.dart';
import 'private_profiles_dto_field_select.dart';
import 'private_profiles_dto_filter.dart';
import 'private_profiles_dto_meta.dart';
import 'private_profiles_dto_sort.dart';
import 'private_profiles_patch_dto.dart';
import 'private_profiles_dto_expand.dart';
import 'package:http/http.dart' as http;

part 'private_profiles_dto.freezed.dart';
part 'private_profiles_dto.g.dart';

enum PrivateProfilesDtoFieldEnum<V>
    implements DtoTypedField<PrivateProfilesDto, V> {
  id<String>(
    'id',
    DtoTextFieldSettings(
      required: true,
      autogeneratePattern: "[a-z0-9]{15}",
      min: 15,
      max: 15,
      pattern: r"^[a-z0-9]+$",
    ),
  ),
  user<RelationDto<UsersDto>>(
    'user',
    DtoRelationFieldSettings(
      required: true,
      collectionId: "_pb_users_auth_",
      cascadeDelete: true,
      minSelect: 1,
      maxSelect: 1,
    ),
  ),
  note<String>(
    'note',
    DtoTextFieldSettings(
      required: false,
      autogeneratePattern: "",
      min: 0,
      max: 0,
      pattern: "",
    ),
  );

  const PrivateProfilesDtoFieldEnum(this.pbName, this.settings);

  @override
  V get(PrivateProfilesDto dto) {
    switch (this) {
      case .id:
        return dto.id as V;
      case .user:
        return dto.user as V;
      case .note:
        return dto.note as V;
    }
  }

  @override
  final String pbName;

  @override
  final DtoFieldSettings settings;
}

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class PrivateProfilesDto
    with _$PrivateProfilesDto
    implements Dto<PrivateProfilesDto> {
  static PrivateProfilesDtoMeta meta() => const PrivateProfilesDtoMeta();

  static PrivateProfilesDtoSort<PrivateProfilesDto> sort(
    void Function(PrivateProfilesDtoSort<PrivateProfilesDto>) builder,
  ) {
    var sort = PrivateProfilesDtoSort<PrivateProfilesDto>();
    builder(sort);
    return sort;
  }

  static PrivateProfilesDtoFilter filter(
    void Function(PrivateProfilesDtoFilter) builder,
  ) {
    var filter = PrivateProfilesDtoFilter();
    builder(filter);
    return filter;
  }

  static PrivateProfilesDtoFilter filterByUniqueUser(
    RelationDto<UsersDto> user,
  ) {
    final f = PrivateProfilesDtoFilter();
    f.user.equal(.val(user));
    return f;
  }

  static PrivateProfilesDtoSort<PrivateProfilesDto> sortByUniqueUser() {
    final s = PrivateProfilesDtoSort<PrivateProfilesDto>();
    s.user();
    return s;
  }

  static PrivateProfilesPatchDto patch(
    void Function(PrivateProfilesPatchDto) builder,
  ) {
    var patch = PrivateProfilesPatchDto();
    builder(patch);
    return patch;
  }

  @override
  PrivateProfilesPatchDto asPatch() => PrivateProfilesPatchDto()
    ..user = user
    ..note = note;

  @override
  PrivateProfilesPatchDto diff(PrivateProfilesDto newValue) =>
      PrivateProfilesPatchDto()
        ..user = user != newValue.user ? newValue.user : null
        ..note = note != newValue.note ? newValue.note : null;

  static PrivateProfilesDtoExpand<PrivateProfilesDto> expansions(
    void Function(PrivateProfilesDtoExpand) builder,
  ) {
    var expansions = PrivateProfilesDtoExpand<PrivateProfilesDto>();
    builder(expansions);
    return expansions;
  }

  static PrivateProfilesDtoFieldSelect<PrivateProfilesDto> fields(
    void Function(PrivateProfilesDtoFieldSelect<PrivateProfilesDto>) builder,
  ) {
    var select = PrivateProfilesDtoFieldSelect<PrivateProfilesDto>();
    builder(select);
    return select;
  }

  PrivateProfilesDto({
    this.id = "",
    this.user = const RelationDto<UsersDto>(""),
    this.note = "",
    this.expand,
  });

  @JsonKey(toJson: Dto.optionalStringToJson)
  @override
  final String id;
  @override
  final RelationDto<UsersDto> user;
  @JsonKey(toJson: Dto.optionalStringToJson)
  @override
  final String note;
  @JsonKey(includeToJson: false)
  @override
  final PrivateProfilesExpandDto? expand;

  factory PrivateProfilesDto.fromRecord(RecordModel record) =>
      PrivateProfilesDto.fromJson(record.toJson());

  factory PrivateProfilesDto.fromJson(Map<String, dynamic> json) =>
      _$PrivateProfilesDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PrivateProfilesDtoToJson(this);

  @override
  List<Future<http.MultipartFile>> toFiles() => const [];

  @override
  RelationDto<PrivateProfilesDto> asRelation() => RelationDto(id);
}
