// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignParams {

 bool get isAttend; double get lat; double get lng;
/// Create a copy of SignParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignParamsCopyWith<SignParams> get copyWith => _$SignParamsCopyWithImpl<SignParams>(this as SignParams, _$identity);

  /// Serializes this SignParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SignParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignParams&&(identical(other.isAttend, _this.isAttend) || other.isAttend == _this.isAttend)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SignParams;
  return Object.hash(runtimeType,_this.isAttend,_this.lat,_this.lng);
}

@override
String toString() {
  final _this = this as SignParams;
  return 'SignParams(isAttend: ${_this.isAttend}, lat: ${_this.lat}, lng: ${_this.lng})';
}


}

/// @nodoc
abstract mixin class $SignParamsCopyWith<$Res>  {
  factory $SignParamsCopyWith(SignParams value, $Res Function(SignParams) _then) = _$SignParamsCopyWithImpl;
@useResult
$Res call({
 bool isAttend, double lat, double lng
});




}
/// @nodoc
class _$SignParamsCopyWithImpl<$Res>
    implements $SignParamsCopyWith<$Res> {
  _$SignParamsCopyWithImpl(this._self, this._then);

  final SignParams _self;
  final $Res Function(SignParams) _then;

/// Create a copy of SignParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAttend = null,Object? lat = null,Object? lng = null,}) {
  return _then(SignParams(
isAttend: null == isAttend ? _self.isAttend : isAttend // ignore: cast_nullable_to_non_nullable
as bool,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SignParams].
extension SignParamsPatterns on SignParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignParams value)  $default,){
final _that = this;
switch (_that) {
case _SignParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignParams value)?  $default,){
final _that = this;
switch (_that) {
case _SignParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAttend,  double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignParams() when $default != null:
return $default(_that.isAttend,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAttend,  double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _SignParams():
return $default(_that.isAttend,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAttend,  double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _SignParams() when $default != null:
return $default(_that.isAttend,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignParams extends SignParams {
  const _SignParams({required this.isAttend, required this.lat, required this.lng}): super._();
  factory _SignParams.fromJson(Map<String, dynamic> json) => _$SignParamsFromJson(json);

@override final  bool isAttend;
@override final  double lat;
@override final  double lng;

/// Create a copy of SignParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignParamsCopyWith<_SignParams> get copyWith => __$SignParamsCopyWithImpl<_SignParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignParams&&(identical(other.isAttend, isAttend) || other.isAttend == isAttend)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,isAttend,lat,lng);
}

@override
String toString() {
    return 'SignParams(isAttend: $isAttend, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$SignParamsCopyWith<$Res> implements $SignParamsCopyWith<$Res> {
  factory _$SignParamsCopyWith(_SignParams value, $Res Function(_SignParams) _then) = __$SignParamsCopyWithImpl;
@override @useResult
$Res call({
 bool isAttend, double lat, double lng
});




}
/// @nodoc
class __$SignParamsCopyWithImpl<$Res>
    implements _$SignParamsCopyWith<$Res> {
  __$SignParamsCopyWithImpl(this._self, this._then);

  final _SignParams _self;
  final $Res Function(_SignParams) _then;

/// Create a copy of SignParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAttend = null,Object? lat = null,Object? lng = null,}) {
  return _then(_SignParams(
isAttend: null == isAttend ? _self.isAttend : isAttend // ignore: cast_nullable_to_non_nullable
as bool,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
