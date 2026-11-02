// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'departments_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepartmentsParams {

 String? get name; int? get id;
/// Create a copy of DepartmentsParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentsParamsCopyWith<DepartmentsParams> get copyWith => _$DepartmentsParamsCopyWithImpl<DepartmentsParams>(this as DepartmentsParams, _$identity);

  /// Serializes this DepartmentsParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DepartmentsParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsParams&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.id, _this.id) || other.id == _this.id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DepartmentsParams;
  return Object.hash(runtimeType,_this.name,_this.id);
}

@override
String toString() {
  final _this = this as DepartmentsParams;
  return 'DepartmentsParams(name: ${_this.name}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $DepartmentsParamsCopyWith<$Res>  {
  factory $DepartmentsParamsCopyWith(DepartmentsParams value, $Res Function(DepartmentsParams) _then) = _$DepartmentsParamsCopyWithImpl;
@useResult
$Res call({
 String? name, int? id
});




}
/// @nodoc
class _$DepartmentsParamsCopyWithImpl<$Res>
    implements $DepartmentsParamsCopyWith<$Res> {
  _$DepartmentsParamsCopyWithImpl(this._self, this._then);

  final DepartmentsParams _self;
  final $Res Function(DepartmentsParams) _then;

/// Create a copy of DepartmentsParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? id = freezed,}) {
  return _then(DepartmentsParams(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentsParams].
extension DepartmentsParamsPatterns on DepartmentsParams {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentsParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentsParams() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentsParams value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentsParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentsParams value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentsParams() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentsParams() when $default != null:
return $default(_that.name,_that.id);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  int? id)  $default,) {final _that = this;
switch (_that) {
case _DepartmentsParams():
return $default(_that.name,_that.id);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentsParams() when $default != null:
return $default(_that.name,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentsParams extends DepartmentsParams {
  const _DepartmentsParams({required this.name, this.id}): super._();
  factory _DepartmentsParams.fromJson(Map<String, dynamic> json) => _$DepartmentsParamsFromJson(json);

@override final  String? name;
@override final  int? id;

/// Create a copy of DepartmentsParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentsParamsCopyWith<_DepartmentsParams> get copyWith => __$DepartmentsParamsCopyWithImpl<_DepartmentsParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentsParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentsParams&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,id);
}

@override
String toString() {
    return 'DepartmentsParams(name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class _$DepartmentsParamsCopyWith<$Res> implements $DepartmentsParamsCopyWith<$Res> {
  factory _$DepartmentsParamsCopyWith(_DepartmentsParams value, $Res Function(_DepartmentsParams) _then) = __$DepartmentsParamsCopyWithImpl;
@override @useResult
$Res call({
 String? name, int? id
});




}
/// @nodoc
class __$DepartmentsParamsCopyWithImpl<$Res>
    implements _$DepartmentsParamsCopyWith<$Res> {
  __$DepartmentsParamsCopyWithImpl(this._self, this._then);

  final _DepartmentsParams _self;
  final $Res Function(_DepartmentsParams) _then;

/// Create a copy of DepartmentsParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? id = freezed,}) {
  return _then(_DepartmentsParams(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
