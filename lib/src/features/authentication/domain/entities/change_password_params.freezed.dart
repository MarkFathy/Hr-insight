// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangePasswordParams {

@JsonKey(name: 'old_password') String get oldPassword; String get password;@JsonKey(name: 'password_confirmation') String get passwordConfirmation; bool? get isEmployee; String? get token;
/// Create a copy of ChangePasswordParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordParamsCopyWith<ChangePasswordParams> get copyWith => _$ChangePasswordParamsCopyWithImpl<ChangePasswordParams>(this as ChangePasswordParams, _$identity);

  /// Serializes this ChangePasswordParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChangePasswordParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordParams&&(identical(other.oldPassword, _this.oldPassword) || other.oldPassword == _this.oldPassword)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.passwordConfirmation, _this.passwordConfirmation) || other.passwordConfirmation == _this.passwordConfirmation)&&(identical(other.isEmployee, _this.isEmployee) || other.isEmployee == _this.isEmployee)&&(identical(other.token, _this.token) || other.token == _this.token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChangePasswordParams;
  return Object.hash(runtimeType,_this.oldPassword,_this.password,_this.passwordConfirmation,_this.isEmployee,_this.token);
}

@override
String toString() {
  final _this = this as ChangePasswordParams;
  return 'ChangePasswordParams(oldPassword: ${_this.oldPassword}, password: ${_this.password}, passwordConfirmation: ${_this.passwordConfirmation}, isEmployee: ${_this.isEmployee}, token: ${_this.token})';
}


}

/// @nodoc
abstract mixin class $ChangePasswordParamsCopyWith<$Res>  {
  factory $ChangePasswordParamsCopyWith(ChangePasswordParams value, $Res Function(ChangePasswordParams) _then) = _$ChangePasswordParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'old_password') String oldPassword, String password,@JsonKey(name: 'password_confirmation') String passwordConfirmation, bool? isEmployee, String? token
});




}
/// @nodoc
class _$ChangePasswordParamsCopyWithImpl<$Res>
    implements $ChangePasswordParamsCopyWith<$Res> {
  _$ChangePasswordParamsCopyWithImpl(this._self, this._then);

  final ChangePasswordParams _self;
  final $Res Function(ChangePasswordParams) _then;

/// Create a copy of ChangePasswordParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? oldPassword = null,Object? password = null,Object? passwordConfirmation = null,Object? isEmployee = freezed,Object? token = freezed,}) {
  return _then(ChangePasswordParams(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,isEmployee: freezed == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePasswordParams].
extension ChangePasswordParamsPatterns on ChangePasswordParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangePasswordParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePasswordParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangePasswordParams value)  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangePasswordParams value)?  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'old_password')  String oldPassword,  String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation,  bool? isEmployee,  String? token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangePasswordParams() when $default != null:
return $default(_that.oldPassword,_that.password,_that.passwordConfirmation,_that.isEmployee,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'old_password')  String oldPassword,  String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation,  bool? isEmployee,  String? token)  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordParams():
return $default(_that.oldPassword,_that.password,_that.passwordConfirmation,_that.isEmployee,_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'old_password')  String oldPassword,  String password, @JsonKey(name: 'password_confirmation')  String passwordConfirmation,  bool? isEmployee,  String? token)?  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordParams() when $default != null:
return $default(_that.oldPassword,_that.password,_that.passwordConfirmation,_that.isEmployee,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangePasswordParams extends ChangePasswordParams {
  const _ChangePasswordParams({@JsonKey(name: 'old_password') required this.oldPassword, required this.password, @JsonKey(name: 'password_confirmation') required this.passwordConfirmation, this.isEmployee, this.token}): super._();
  factory _ChangePasswordParams.fromJson(Map<String, dynamic> json) => _$ChangePasswordParamsFromJson(json);

@override@JsonKey(name: 'old_password') final  String oldPassword;
@override final  String password;
@override@JsonKey(name: 'password_confirmation') final  String passwordConfirmation;
@override final  bool? isEmployee;
@override final  String? token;

/// Create a copy of ChangePasswordParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordParamsCopyWith<_ChangePasswordParams> get copyWith => __$ChangePasswordParamsCopyWithImpl<_ChangePasswordParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangePasswordParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePasswordParams&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation)&&(identical(other.isEmployee, isEmployee) || other.isEmployee == isEmployee)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,oldPassword,password,passwordConfirmation,isEmployee,token);
}

@override
String toString() {
    return 'ChangePasswordParams(oldPassword: $oldPassword, password: $password, passwordConfirmation: $passwordConfirmation, isEmployee: $isEmployee, token: $token)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordParamsCopyWith<$Res> implements $ChangePasswordParamsCopyWith<$Res> {
  factory _$ChangePasswordParamsCopyWith(_ChangePasswordParams value, $Res Function(_ChangePasswordParams) _then) = __$ChangePasswordParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'old_password') String oldPassword, String password,@JsonKey(name: 'password_confirmation') String passwordConfirmation, bool? isEmployee, String? token
});




}
/// @nodoc
class __$ChangePasswordParamsCopyWithImpl<$Res>
    implements _$ChangePasswordParamsCopyWith<$Res> {
  __$ChangePasswordParamsCopyWithImpl(this._self, this._then);

  final _ChangePasswordParams _self;
  final $Res Function(_ChangePasswordParams) _then;

/// Create a copy of ChangePasswordParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldPassword = null,Object? password = null,Object? passwordConfirmation = null,Object? isEmployee = freezed,Object? token = freezed,}) {
  return _then(_ChangePasswordParams(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,isEmployee: freezed == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
