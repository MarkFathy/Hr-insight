// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPasswordParams {

 String get password;@JsonKey(name: 'password_confirmation') String get passwordConfirmation; String? get token; bool get isEmployee;
/// Create a copy of ResetPasswordParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordParamsCopyWith<ResetPasswordParams> get copyWith => _$ResetPasswordParamsCopyWithImpl<ResetPasswordParams>(this as ResetPasswordParams, _$identity);

  /// Serializes this ResetPasswordParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResetPasswordParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordParams&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.passwordConfirmation, _this.passwordConfirmation) || other.passwordConfirmation == _this.passwordConfirmation)&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.isEmployee, _this.isEmployee) || other.isEmployee == _this.isEmployee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResetPasswordParams;
  return Object.hash(runtimeType,_this.password,_this.passwordConfirmation,_this.token,_this.isEmployee);
}

@override
String toString() {
  final _this = this as ResetPasswordParams;
  return 'ResetPasswordParams(password: ${_this.password}, passwordConfirmation: ${_this.passwordConfirmation}, token: ${_this.token}, isEmployee: ${_this.isEmployee})';
}


}

/// @nodoc
abstract mixin class $ResetPasswordParamsCopyWith<$Res>  {
  factory $ResetPasswordParamsCopyWith(ResetPasswordParams value, $Res Function(ResetPasswordParams) _then) = _$ResetPasswordParamsCopyWithImpl;
@useResult
$Res call({
 String password,@JsonKey(name: 'password_confirmation') String passwordConfirmation, String? token, bool isEmployee
});




}
/// @nodoc
class _$ResetPasswordParamsCopyWithImpl<$Res>
    implements $ResetPasswordParamsCopyWith<$Res> {
  _$ResetPasswordParamsCopyWithImpl(this._self, this._then);

  final ResetPasswordParams _self;
  final $Res Function(ResetPasswordParams) _then;

/// Create a copy of ResetPasswordParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? password = null,Object? passwordConfirmation = null,Object? token = freezed,Object? isEmployee = null,}) {
  return _then(ResetPasswordParams(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,isEmployee: null == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPasswordParams].
extension ResetPasswordParamsPatterns on ResetPasswordParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPasswordParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPasswordParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPasswordParams value)  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPasswordParams value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation,  String? token,  bool isEmployee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPasswordParams() when $default != null:
return $default(_that.password,_that.passwordConfirmation,_that.token,_that.isEmployee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation,  String? token,  bool isEmployee)  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordParams():
return $default(_that.password,_that.passwordConfirmation,_that.token,_that.isEmployee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation,  String? token,  bool isEmployee)?  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordParams() when $default != null:
return $default(_that.password,_that.passwordConfirmation,_that.token,_that.isEmployee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResetPasswordParams extends ResetPasswordParams {
  const _ResetPasswordParams({required this.password, @JsonKey(name: 'password_confirmation') required this.passwordConfirmation, this.token, this.isEmployee = true}): super._();
  factory _ResetPasswordParams.fromJson(Map<String, dynamic> json) => _$ResetPasswordParamsFromJson(json);

@override final  String password;
@override@JsonKey(name: 'password_confirmation') final  String passwordConfirmation;
@override final  String? token;
@override@JsonKey() final  bool isEmployee;

/// Create a copy of ResetPasswordParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordParamsCopyWith<_ResetPasswordParams> get copyWith => __$ResetPasswordParamsCopyWithImpl<_ResetPasswordParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordParams&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation)&&(identical(other.token, token) || other.token == token)&&(identical(other.isEmployee, isEmployee) || other.isEmployee == isEmployee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,password,passwordConfirmation,token,isEmployee);
}

@override
String toString() {
    return 'ResetPasswordParams(password: $password, passwordConfirmation: $passwordConfirmation, token: $token, isEmployee: $isEmployee)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordParamsCopyWith<$Res> implements $ResetPasswordParamsCopyWith<$Res> {
  factory _$ResetPasswordParamsCopyWith(_ResetPasswordParams value, $Res Function(_ResetPasswordParams) _then) = __$ResetPasswordParamsCopyWithImpl;
@override @useResult
$Res call({
 String password,@JsonKey(name: 'password_confirmation') String passwordConfirmation, String? token, bool isEmployee
});




}
/// @nodoc
class __$ResetPasswordParamsCopyWithImpl<$Res>
    implements _$ResetPasswordParamsCopyWith<$Res> {
  __$ResetPasswordParamsCopyWithImpl(this._self, this._then);

  final _ResetPasswordParams _self;
  final $Res Function(_ResetPasswordParams) _then;

/// Create a copy of ResetPasswordParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? password = null,Object? passwordConfirmation = null,Object? token = freezed,Object? isEmployee = null,}) {
  return _then(_ResetPasswordParams(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,isEmployee: null == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
