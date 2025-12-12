import 'package:freezed_annotation/freezed_annotation.dart';
import "package:pocketbase/pocketbase.dart" show RecordModel;
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/geopoint_dto.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'roles_dto.dart';
import 'users_dto_field_select.dart';
import 'users_dto_filter.dart';
import 'users_dto_meta.dart';
import 'users_dto_sort.dart';
import 'users_patch_dto.dart';
import 'users_dto_expand.dart';
import 'package:http/http.dart' as http;

part 'users_dto.freezed.dart';
part 'users_dto.g.dart';

enum UsersZodiacEnum {
  aries("aries"),
  taurus("taurus"),
  gemini("gemini"),
  cancer("cancer"),
  $unset("");

  final String value;
  const UsersZodiacEnum(this.value);
  @override
  String toString() => value;
}

enum UsersDtoFieldEnum<V> implements DtoTypedField<UsersDto, V> {
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
  password<String>(
    'password',
    DtoPasswordFieldSettings(required: true, pattern: "", min: 8, max: 0),
  ),
  email<String>(
    'email',
    DtoEmailFieldSettings(
      required: true,
      exceptDomains: [],
      onlyDomains: [],
    ),
  ),
  emailVisibility<bool>(
    'emailVisibility',
    DtoBoolFieldSettings(required: false),
  ),
  verified<bool>('verified', DtoBoolFieldSettings(required: false)),
  name_<String>(
    'name',
    DtoTextFieldSettings(
      required: false,
      autogeneratePattern: "",
      min: 0,
      max: 255,
      pattern: "",
    ),
  ),
  avatar<FileDto>(
    'avatar',
    DtoFileFieldSettings(
      required: false,
      maxSize: 0,
      maxSelect: 1,
      mimeTypes: [
        "image/jpeg",
        "image/png",
        "image/svg+xml",
        "image/gif",
        "image/webp",
      ],
      thumbs: [],
      protected: false,
    ),
  ),
  roles<RelationDto<RolesDto>>(
    'roles',
    DtoRelationFieldSettings(
      required: false,
      collectionId: "pbc_2105053228",
      cascadeDelete: false,
      minSelect: 0,
      maxSelect: 999,
    ),
  ),
  birthday<DateTime>(
    'birthday',
    DtoDateFieldSettings(required: false, min: null, max: null),
  ),
  homepage<String>(
    'homepage',
    DtoURLFieldSettings(
      required: false,
      exceptDomains: [],
      onlyDomains: [],
    ),
  ),
  metadata<dynamic>(
    'metadata',
    DtoJSONFieldSettings(required: false, maxSize: 0),
  ),
  biography<dynamic>(
    'biography',
    DtoJSONFieldSettings(required: false, maxSize: 0),
  ),
  hometown<GeopointDto>(
    'hometown',
    DtoGeoPointFieldSettings(required: false),
  ),
  zodiac<UsersZodiacEnum>(
    'zodiac',
    DtoSelectFieldSettings(
      required: false,
      values: ["aries", "taurus", "gemini", "cancer"],
      maxSelect: 0,
    ),
  ),
  created<DateTime>(
    'created',
    DtoAutodateFieldSettings(onCreate: true, onUpdate: false),
  ),
  updated<DateTime>(
    'updated',
    DtoAutodateFieldSettings(onCreate: true, onUpdate: true),
  );

  const UsersDtoFieldEnum(this.pbName, this.settings);

  @override
  final String pbName;

  @override
  final DtoFieldSettings settings;
}

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UsersDto with _$UsersDto implements Dto<UsersDto> {
  static UsersDtoMeta meta() => const UsersDtoMeta();

  static UsersDtoSort<UsersDto> sort(
    void Function(UsersDtoSort<UsersDto>) builder,
  ) {
    var sort = UsersDtoSort<UsersDto>();
    builder(sort);
    return sort;
  }

  static UsersDtoFilter filter(void Function(UsersDtoFilter) builder) {
    var filter = UsersDtoFilter();
    builder(filter);
    return filter;
  }

  static UsersDtoFilter filterByIdxEmailPbUsersAuth(String email) {
    final f = UsersDtoFilter();
    f.email().equal(.val(email));
    return f;
  }

  static UsersDtoSort<UsersDto> sortByIdxEmailPbUsersAuth() {
    final s = UsersDtoSort<UsersDto>();
    s.email();
    return s;
  }

  static UsersPatchDto patch(void Function(UsersPatchDto) builder) {
    var patch = UsersPatchDto();
    builder(patch);
    return patch;
  }

  @override
  UsersPatchDto asPatch() => UsersPatchDto()
    ..password = password
    ..email = email
    ..emailVisibility = emailVisibility
    ..verified = verified
    ..name = name
    ..avatar = avatar
    ..roles = roles
    ..birthday = birthday
    ..homepage = homepage
    ..metadata = metadata
    ..biography = biography
    ..hometown = hometown
    ..zodiac = zodiac;

  @override
  UsersPatchDto diff(UsersDto newValue) => UsersPatchDto()
    ..password = password != newValue.password ? newValue.password : null
    ..email = email != newValue.email ? newValue.email : null
    ..emailVisibility = emailVisibility != newValue.emailVisibility
        ? newValue.emailVisibility
        : null
    ..verified = verified != newValue.verified ? newValue.verified : null
    ..name = name != newValue.name ? newValue.name : null
    ..avatar = avatar != newValue.avatar ? newValue.avatar : null
    ..roles = roles != newValue.roles ? newValue.roles : null
    ..birthday = birthday != newValue.birthday ? newValue.birthday : null
    ..homepage = homepage != newValue.homepage ? newValue.homepage : null
    ..metadata = metadata != newValue.metadata ? newValue.metadata : null
    ..biography = biography != newValue.biography ? newValue.biography : null
    ..hometown = hometown != newValue.hometown ? newValue.hometown : null
    ..zodiac = zodiac != newValue.zodiac ? newValue.zodiac : null;

  static UsersDtoExpand<UsersDto> expansions(
    void Function(UsersDtoExpand) builder,
  ) {
    var expansions = UsersDtoExpand<UsersDto>();
    builder(expansions);
    return expansions;
  }

  static UsersDtoFieldSelect<UsersDto> fields(
    void Function(UsersDtoFieldSelect<UsersDto>) builder,
  ) {
    var select = UsersDtoFieldSelect<UsersDto>();
    builder(select);
    return select;
  }

  UsersDto({
    this.id = "",
    this.password = "",
    required this.email,
    this.emailVisibility = false,
    this.verified = false,
    this.name = "",
    this.avatar,
    this.roles = const [],
    this.birthday,
    this.homepage = "",
    this.metadata,
    this.biography,
    this.hometown = const GeopointDto(lat: 0, lon: 0),
    this.zodiac,
    this.created,
    this.updated,
    this.expand,
    this.passwordConfirm,
  });

  @JsonKey(toJson: Dto.optionalStringToJson)
  @override
  final String id;
  @JsonKey(toJson: Dto.optionalStringToJson)
  @override
  final String password;
  @JsonKey(toJson: Dto.optionalStringToJson, defaultValue: "")
  @override
  final String email;
  @JsonKey(toJson: Dto.optionalBoolToJson)
  @override
  final bool emailVisibility;
  @JsonKey(toJson: Dto.optionalBoolToJson)
  @override
  final bool verified;
  @JsonKey(toJson: Dto.optionalStringToJson)
  @override
  final String name;
  @override
  final FileDto? avatar;
  @override
  final List<RelationDto<RolesDto>> roles;
  @override
  final DateTime? birthday;
  @JsonKey(toJson: Dto.optionalStringToJson)
  @override
  final String homepage;
  @override
  final dynamic metadata;
  @override
  final dynamic biography;
  @override
  final GeopointDto hometown;
  @JsonKey(unknownEnumValue: UsersZodiacEnum.$unset)
  @override
  final UsersZodiacEnum? zodiac;
  @override
  final DateTime? created;
  @override
  final DateTime? updated;
  @JsonKey(includeToJson: false)
  @override
  final UsersExpandDto? expand;
  @override
  final String? passwordConfirm;

  factory UsersDto.fromRecord(RecordModel record) =>
      UsersDto.fromJson(record.toJson());

  factory UsersDto.fromJson(Map<String, dynamic> json) =>
      _$UsersDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UsersDtoToJson(this);

  @override
  List<Future<http.MultipartFile>> toFiles() => [
    avatar?.toFile('avatar'),
  ].whereType<Future<http.MultipartFile>>().toList();

  @override
  RelationDto<UsersDto> asRelation() => RelationDto(id);
}
