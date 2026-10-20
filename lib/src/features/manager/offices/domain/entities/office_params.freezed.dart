// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'office_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfficeParams {

 String? get name; double? get radius; double? get lat; double? get lng; int? get id;
/// Create a copy of OfficeParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficeParamsCopyWith<OfficeParams> get copyWith => _$OfficeParamsCopyWithImpl<OfficeParams>(this as OfficeParams, _$identity);

  /// Serializes this OfficeParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfficeParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficeParams&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng)&&(identical(other.id, _this.id) || other.id == _this.id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfficeParams;
  return Object.hash(runtimeType,_this.name,_this.radius,_this.lat,_this.lng,_this.id);
}

@override
String toString() {
  final _this = this as OfficeParams;
  return 'OfficeParams(name: ${_this.name}, radius: ${_this.radius}, lat: ${_this.lat}, lng: ${_this.lng}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $OfficeParamsCopyWith<$Res>  {
  factory $OfficeParamsCopyWith(OfficeParams value, $Res Function(OfficeParams) _then) = _$OfficeParamsCopyWithImpl;
@useResult
$Res call({
 String? name, double? radius, double? lat, double? lng, int? id
});




}
/// @nodoc
class _$OfficeParamsCopyWithImpl<$Res>
    implements $OfficeParamsCopyWith<$Res> {
  _$OfficeParamsCopyWithImpl(this._self, this._then);

  final OfficeParams _self;
  final $Res Function(OfficeParams) _then;

/// Create a copy of OfficeParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? radius = freezed,Object? lat = freezed,Object? lng = freezed,Object? id = freezed,}) {
  return _then(OfficeParams(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,radius: freezed == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfficeParams].
extension OfficeParamsPatterns on OfficeParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfficeParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfficeParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfficeParams value)  $default,){
final _that = this;
switch (_that) {
case _OfficeParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfficeParams value)?  $default,){
final _that = this;
switch (_that) {
case _OfficeParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  double? radius,  double? lat,  double? lng,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfficeParams() when $default != null:
return $default(_that.name,_that.radius,_that.lat,_that.lng,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  double? radius,  double? lat,  double? lng,  int? id)  $default,) {final _that = this;
switch (_that) {
case _OfficeParams():
return $default(_that.name,_that.radius,_that.lat,_that.lng,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  double? radius,  double? lat,  double? lng,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _OfficeParams() when $default != null:
return $default(_that.name,_that.radius,_that.lat,_that.lng,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfficeParams extends OfficeParams {
  const _OfficeParams({required this.name, required this.radius, required this.lat, required this.lng, this.id}): super._();
  factory _OfficeParams.fromJson(Map<String, dynamic> json) => _$OfficeParamsFromJson(json);

@override final  String? name;
@override final  double? radius;
@override final  double? lat;
@override final  double? lng;
@override final  int? id;

/// Create a copy of OfficeParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfficeParamsCopyWith<_OfficeParams> get copyWith => __$OfficeParamsCopyWithImpl<_OfficeParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfficeParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfficeParams&&(identical(other.name, name) || other.name == name)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,radius,lat,lng,id);
}

@override
String toString() {
    return 'OfficeParams(name: $name, radius: $radius, lat: $lat, lng: $lng, id: $id)';
}


}

/// @nodoc
abstract mixin class _$OfficeParamsCopyWith<$Res> implements $OfficeParamsCopyWith<$Res> {
  factory _$OfficeParamsCopyWith(_OfficeParams value, $Res Function(_OfficeParams) _then) = __$OfficeParamsCopyWithImpl;
@override @useResult
$Res call({
 String? name, double? radius, double? lat, double? lng, int? id
});




}
/// @nodoc
class __$OfficeParamsCopyWithImpl<$Res>
    implements _$OfficeParamsCopyWith<$Res> {
  __$OfficeParamsCopyWithImpl(this._self, this._then);

  final _OfficeParams _self;
  final $Res Function(_OfficeParams) _then;

/// Create a copy of OfficeParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? radius = freezed,Object? lat = freezed,Object? lng = freezed,Object? id = freezed,}) {
  return _then(_OfficeParams(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,radius: freezed == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
