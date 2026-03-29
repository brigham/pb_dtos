import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocketbase/pocketbase.dart' show RecordModel;
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'autogen_posts_dto_field_select.dart';
import 'autogen_posts_dto_filter.dart';
import 'autogen_posts_dto_meta.dart';
import 'autogen_posts_dto_sort.dart';
import 'autogen_posts_patch_dto.dart';
import 'package:http/http.dart' as http;

part 'autogen_posts_dto.freezed.dart';
part 'autogen_posts_dto.g.dart';

enum AutogenPostsDtoFieldEnum<V, A>
    implements DtoTypedField<AutogenPostsDto, V, A> {
  slug<String, String>(
    'slug',
    DtoTextFieldSettings(
      required: true,
      autogeneratePattern: '[a-z0-9]{15}',
      min: 0,
      max: 0,
      pattern: r'^[a-z0-9-]+$',
    ),
  ),
  title<String, String>(
    'title',
    DtoTextFieldSettings(
      required: true,
      autogeneratePattern: '',
      min: 0,
      max: 0,
      pattern: '',
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

  const AutogenPostsDtoFieldEnum(this.pbName, this.settings);

  @override
  A get(AutogenPostsDto dto) {
    switch (this) {
      case .slug:
        return dto.slug as A;
      case .title:
        return dto.title as A;
      case .id:
        return dto.id as A;
    }
  }

  @override
  AutogenPostsDto copyWith(AutogenPostsDto dto, A value) {
    switch (this) {
      case .slug:
        return dto.copyWith(slug: value as String);
      case .title:
        return dto.copyWith(title: value as String);
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
class AutogenPostsDto with _$AutogenPostsDto implements Dto<AutogenPostsDto> {
  static AutogenPostsDtoMeta meta() => const AutogenPostsDtoMeta();

  static AutogenPostsDtoSort<AutogenPostsDto> sort(
    void Function(AutogenPostsDtoSort<AutogenPostsDto>) builder,
  ) {
    var sort = AutogenPostsDtoSort<AutogenPostsDto>();
    builder(sort);
    return sort;
  }

  static AutogenPostsDtoFilter filter(
    void Function(AutogenPostsDtoFilter) builder,
  ) {
    var filter = AutogenPostsDtoFilter();
    builder(filter);
    return filter;
  }

  static AutogenPostsPatchDto patch(
    void Function(AutogenPostsPatchDto) builder,
  ) {
    var patch = AutogenPostsPatchDto();
    builder(patch);
    return patch;
  }

  @override
  AutogenPostsPatchDto asPatch() => AutogenPostsPatchDto()
    ..slug = slug
    ..title = title;

  @override
  AutogenPostsPatchDto diff(AutogenPostsDto newValue) => AutogenPostsPatchDto()
    ..slug = slug != newValue.slug ? newValue.slug : null
    ..title = title != newValue.title ? newValue.title : null;

  static AutogenPostsDtoFieldSelect<AutogenPostsDto> fields(
    void Function(AutogenPostsDtoFieldSelect<AutogenPostsDto>) builder,
  ) {
    var select = AutogenPostsDtoFieldSelect<AutogenPostsDto>();
    builder(select);
    return select;
  }

  AutogenPostsDto({this.slug = '', required this.title, this.id = ''});

  @JsonKey(toJson: Dto.optionalStringToJson)
  @override
  final String slug;
  @JsonKey(toJson: Dto.optionalStringToJson, defaultValue: '')
  @override
  final String title;
  @JsonKey(toJson: Dto.optionalStringToJson)
  @override
  final String id;

  factory AutogenPostsDto.fromRecord(RecordModel record) =>
      AutogenPostsDto.fromJson(record.toJson());

  factory AutogenPostsDto.fromJson(Map<String, dynamic> json) =>
      _$AutogenPostsDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final json = _$AutogenPostsDtoToJson(this);
    if (_slugAutogenerate != null) {
      json['slug:autogenerate'] = _slugAutogenerate;
    }
    if (_idAutogenerate != null) {
      json['id:autogenerate'] = _idAutogenerate;
    }
    return json;
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? _slugAutogenerate;

  set slugAutogenerate(String? value) => _slugAutogenerate = value;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? _idAutogenerate;

  set idAutogenerate(String? value) => _idAutogenerate = value;

  @override
  List<Future<http.MultipartFile>> toFiles() => const [];

  @override
  RelationDto<AutogenPostsDto> asRelation() => RelationDto(id);
}
