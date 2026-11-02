// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgetPasswordParams {

 String get email; bool get isEmployee;
/// Create a copy of ForgetPasswordParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordParamsCopyWith<ForgetPasswordParams> get copyWith => _$ForgetPasswordParamsCopyWithImpl<ForgetPasswordParams>(this as ForgetPasswordParams, _$identity);

  /// Serializes this ForgetPasswordParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForgetPasswordParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordParams&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.isEmployee, _this.isEmployee) || other.isEmployee == _this.isEmployee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForgetPasswordParams;
  return Object.hash(runtimeType,_this.email,_this.isEmployee);
}

@override
String toString() {
  final _this = this as ForgetPasswordParams;
  return 'ForgetPasswordParams(email: ${_this.email}, isEmployee: ${_this.isEmployee})';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordParamsCopyWith<$Res>  {
  factory $ForgetPasswordParamsCopyWith(ForgetPasswordParams value, $Res Function(ForgetPasswordParams) _then) = _$ForgetPasswordParamsCopyWithImpl;
@useResult
$Res call({
 String email, bool isEmployee
});




}
/// @nodoc
class _$ForgetPasswordParamsCopyWithImpl<$Res>
    implements $ForgetPasswordParamsCopyWith<$Res> {
  _$ForgetPasswordParamsCopyWithImpl(this._self, this._then);

  final ForgetPasswordParams _self;
  final $Res Function(ForgetPasswordParams) _then;

/// Create a copy of ForgetPasswordParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? isEmployee = null,}) {
  return _then(ForgetPasswordParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isEmployee: null == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgetPasswordParams].
extension ForgetPasswordParamsPatterns on ForgetPasswordParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgetPasswordParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgetPasswordParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgetPasswordParams value)  $default,){
final _that = this;
switch (_that) {
case _ForgetPasswordParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgetPasswordParams value)?  $default,){
final _that = this;
switch (_that) {
case _ForgetPasswordParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  bool isEmployee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgetPasswordParams() when $default != null:
return $default(_that.email,_that.isEmployee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  bool isEmployee)  $default,) {final _that = this;
switch (_that) {
case _ForgetPasswordParams():
return $default(_that.email,_that.isEmployee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  bool isEmployee)?  $default,) {final _that = this;
switch (_that) {
case _ForgetPasswordParams() when $default != null:
return $default(_that.email,_that.isEmployee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForgetPasswordParams implements ForgetPasswordParams {
  const _ForgetPasswordParams({required this.email, required this.isEmployee});
  factory _ForgetPasswordParams.fromJson(Map<String, dynamic> json) => _$ForgetPasswordParamsFromJson(json);

@override final  String email;
@override final  bool isEmployee;

/// Create a copy of ForgetPasswordParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgetPasswordParamsCopyWith<_ForgetPasswordParams> get copyWith => __$ForgetPasswordParamsCopyWithImpl<_ForgetPasswordParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgetPasswordParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgetPasswordParams&&(identical(other.email, email) || other.email == email)&&(identical(other.isEmployee, isEmployee) || other.isEmployee == isEmployee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,email,isEmployee);
}

@override
String toString() {
    return 'ForgetPasswordParams(email: $email, isEmployee: $isEmployee)';
}


}

/// @nodoc
abstract mixin class _$ForgetPasswordParamsCopyWith<$Res> implements $ForgetPasswordParamsCopyWith<$Res> {
  factory _$ForgetPasswordParamsCopyWith(_ForgetPasswordParams value, $Res Function(_ForgetPasswordParams) _then) = __$ForgetPasswordParamsCopyWithImpl;
@override @useResult
$Res call({
 String email, bool isEmployee
});




}
/// @nodoc
class __$ForgetPasswordParamsCopyWithImpl<$Res>
    implements _$ForgetPasswordParamsCopyWith<$Res> {
  __$ForgetPasswordParamsCopyWithImpl(this._self, this._then);

  final _ForgetPasswordParams _self;
  final $Res Function(_ForgetPasswordParams) _then;

/// Create a copy of ForgetPasswordParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? isEmployee = null,}) {
  return _then(_ForgetPasswordParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isEmployee: null == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
