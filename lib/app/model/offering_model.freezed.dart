// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offering_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfferingModel _$OfferingModelFromJson(Map<String, dynamic> json) {
  return _OfferingModel.fromJson(json);
}

/// @nodoc
mixin _$OfferingModel {
  @HiveField(0)
  @JsonKey(name: "practitionerName")
  String? get practitionerName => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "price")
  int? get price => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "category")
  String? get category => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "duration")
  String? get duration => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this OfferingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferingModelCopyWith<OfferingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferingModelCopyWith<$Res> {
  factory $OfferingModelCopyWith(
          OfferingModel value, $Res Function(OfferingModel) then) =
      _$OfferingModelCopyWithImpl<$Res, OfferingModel>;
  @useResult
  $Res call(
      {@HiveField(0)
      @JsonKey(name: "practitionerName")
      String? practitionerName,
      @HiveField(1) @JsonKey(name: "title") String? title,
      @HiveField(2) @JsonKey(name: "price") int? price,
      @HiveField(3) @JsonKey(name: "description") String? description,
      @HiveField(4) @JsonKey(name: "category") String? category,
      @HiveField(5) @JsonKey(name: "duration") String? duration,
      @HiveField(6) @JsonKey(name: "type") String? type});
}

/// @nodoc
class _$OfferingModelCopyWithImpl<$Res, $Val extends OfferingModel>
    implements $OfferingModelCopyWith<$Res> {
  _$OfferingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? practitionerName = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? duration = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      practitionerName: freezed == practitionerName
          ? _value.practitionerName
          : practitionerName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferingModelImplCopyWith<$Res>
    implements $OfferingModelCopyWith<$Res> {
  factory _$$OfferingModelImplCopyWith(
          _$OfferingModelImpl value, $Res Function(_$OfferingModelImpl) then) =
      __$$OfferingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0)
      @JsonKey(name: "practitionerName")
      String? practitionerName,
      @HiveField(1) @JsonKey(name: "title") String? title,
      @HiveField(2) @JsonKey(name: "price") int? price,
      @HiveField(3) @JsonKey(name: "description") String? description,
      @HiveField(4) @JsonKey(name: "category") String? category,
      @HiveField(5) @JsonKey(name: "duration") String? duration,
      @HiveField(6) @JsonKey(name: "type") String? type});
}

/// @nodoc
class __$$OfferingModelImplCopyWithImpl<$Res>
    extends _$OfferingModelCopyWithImpl<$Res, _$OfferingModelImpl>
    implements _$$OfferingModelImplCopyWith<$Res> {
  __$$OfferingModelImplCopyWithImpl(
      _$OfferingModelImpl _value, $Res Function(_$OfferingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? practitionerName = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? duration = freezed,
    Object? type = freezed,
  }) {
    return _then(_$OfferingModelImpl(
      practitionerName: freezed == practitionerName
          ? _value.practitionerName
          : practitionerName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'OfferingModelAdapter')
class _$OfferingModelImpl implements _OfferingModel {
  const _$OfferingModelImpl(
      {@HiveField(0) @JsonKey(name: "practitionerName") this.practitionerName,
      @HiveField(1) @JsonKey(name: "title") this.title,
      @HiveField(2) @JsonKey(name: "price") this.price,
      @HiveField(3) @JsonKey(name: "description") this.description,
      @HiveField(4) @JsonKey(name: "category") this.category,
      @HiveField(5) @JsonKey(name: "duration") this.duration,
      @HiveField(6) @JsonKey(name: "type") this.type});

  factory _$OfferingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferingModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "practitionerName")
  final String? practitionerName;
  @override
  @HiveField(1)
  @JsonKey(name: "title")
  final String? title;
  @override
  @HiveField(2)
  @JsonKey(name: "price")
  final int? price;
  @override
  @HiveField(3)
  @JsonKey(name: "description")
  final String? description;
  @override
  @HiveField(4)
  @JsonKey(name: "category")
  final String? category;
  @override
  @HiveField(5)
  @JsonKey(name: "duration")
  final String? duration;
  @override
  @HiveField(6)
  @JsonKey(name: "type")
  final String? type;

  @override
  String toString() {
    return 'OfferingModel(practitionerName: $practitionerName, title: $title, price: $price, description: $description, category: $category, duration: $duration, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferingModelImpl &&
            (identical(other.practitionerName, practitionerName) ||
                other.practitionerName == practitionerName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, practitionerName, title, price,
      description, category, duration, type);

  /// Create a copy of OfferingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferingModelImplCopyWith<_$OfferingModelImpl> get copyWith =>
      __$$OfferingModelImplCopyWithImpl<_$OfferingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferingModelImplToJson(
      this,
    );
  }
}

abstract class _OfferingModel implements OfferingModel {
  const factory _OfferingModel(
          {@HiveField(0)
          @JsonKey(name: "practitionerName")
          final String? practitionerName,
          @HiveField(1) @JsonKey(name: "title") final String? title,
          @HiveField(2) @JsonKey(name: "price") final int? price,
          @HiveField(3) @JsonKey(name: "description") final String? description,
          @HiveField(4) @JsonKey(name: "category") final String? category,
          @HiveField(5) @JsonKey(name: "duration") final String? duration,
          @HiveField(6) @JsonKey(name: "type") final String? type}) =
      _$OfferingModelImpl;

  factory _OfferingModel.fromJson(Map<String, dynamic> json) =
      _$OfferingModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "practitionerName")
  String? get practitionerName;
  @override
  @HiveField(1)
  @JsonKey(name: "title")
  String? get title;
  @override
  @HiveField(2)
  @JsonKey(name: "price")
  int? get price;
  @override
  @HiveField(3)
  @JsonKey(name: "description")
  String? get description;
  @override
  @HiveField(4)
  @JsonKey(name: "category")
  String? get category;
  @override
  @HiveField(5)
  @JsonKey(name: "duration")
  String? get duration;
  @override
  @HiveField(6)
  @JsonKey(name: "type")
  String? get type;

  /// Create a copy of OfferingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferingModelImplCopyWith<_$OfferingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
