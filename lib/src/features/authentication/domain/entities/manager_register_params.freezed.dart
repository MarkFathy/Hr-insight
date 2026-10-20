// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_register_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManagerRegisterParams {

 String get name; String get email; String get password; String get passwordConfirmation; String get phone; String get companyName; File get image;
/// Create a copy of ManagerRegisterParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerRegisterParamsCopyWith<ManagerRegisterParams> get copyWith => _$ManagerRegisterParamsCopyWithImpl<ManagerRegisterParams>(this as ManagerRegisterParams, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ManagerRegisterParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerRegisterParams&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.passwordConfirmation, _this.passwordConfirmation) || other.passwordConfirmation == _this.passwordConfirmation)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.companyName, _this.companyName) || other.companyName == _this.companyName)&&(identical(other.image, _this.image) || other.image == _this.image));
}


@override
int get hashCode {
  final _this = this as ManagerRegisterParams;
  return Object.hash(runtimeType,_this.name,_this.email,_this.password,_this.passwordConfirmation,_this.phone,_this.companyName,_this.image);
}

@override
String toString() {
  final _this = this as ManagerRegisterParams;
  return 'ManagerRegisterParams(name: ${_this.name}, email: ${_this.email}, password: ${_this.password}, passwordConfirmation: ${_this.passwordConfirmation}, phone: ${_this.phone}, companyName: ${_this.companyName}, image: ${_this.image})';
}


}

/// @nodoc
abstract mixin class $ManagerRegisterParamsCopyWith<$Res>  {
  factory $ManagerRegisterParamsCopyWith(ManagerRegisterParams value, $Res Function(ManagerRegisterParams) _then) = _$ManagerRegisterParamsCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password, String passwordConfirmation, String phone, String companyName, File image
});




}
/// @nodoc
class _$ManagerRegisterParamsCopyWithImpl<$Res>
    implements $ManagerRegisterParamsCopyWith<$Res> {
  _$ManagerRegisterParamsCopyWithImpl(this._self, this._then);

  final ManagerRegisterParams _self;
  final $Res Function(ManagerRegisterParams) _then;

/// Create a copy of ManagerRegisterParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? password = null,Object? passwordConfirmation = null,Object? phone = null,Object? companyName = null,Object? image = null,}) {
  return _then(ManagerRegisterParams(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagerRegisterParams].
extension ManagerRegisterParamsPatterns on ManagerRegisterParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagerRegisterParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagerRegisterParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagerRegisterParams value)  $default,){
final _that = this;
switch (_that) {
case _ManagerRegisterParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagerRegisterParams value)?  $default,){
final _that = this;
switch (_that) {
case _ManagerRegisterParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String passwordConfirmation,  String phone,  String companyName,  File image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagerRegisterParams() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.passwordConfirmation,_that.phone,_that.companyName,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String passwordConfirmation,  String phone,  String companyName,  File image)  $default,) {final _that = this;
switch (_that) {
case _ManagerRegisterParams():
return $default(_that.name,_that.email,_that.password,_that.passwordConfirmation,_that.phone,_that.companyName,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String password,  String passwordConfirmation,  String phone,  String companyName,  File image)?  $default,) {final _that = this;
switch (_that) {
case _ManagerRegisterParams() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.passwordConfirmation,_that.phone,_that.companyName,_that.image);case _:
  return null;

}
}

}

/// @nodoc


class _ManagerRegisterParams extends ManagerRegisterParams {
  const _ManagerRegisterParams({required this.name, required this.email, required this.password, required this.passwordConfirmation, required this.phone, required this.companyName, required this.image}): super._();
  

@override final  String name;
@override final  String email;
@override final  String password;
@override final  String passwordConfirmation;
@override final  String phone;
@override final  String companyName;
@override final  File image;

/// Create a copy of ManagerRegisterParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerRegisterParamsCopyWith<_ManagerRegisterParams> get copyWith => __$ManagerRegisterParamsCopyWithImpl<_ManagerRegisterParams>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagerRegisterParams&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,email,password,passwordConfirmation,phone,companyName,image);
}

@override
String toString() {
    return 'ManagerRegisterParams(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, phone: $phone, companyName: $companyName, image: $image)';
}


}

/// @nodoc
abstract mixin class _$ManagerRegisterParamsCopyWith<$Res> implements $ManagerRegisterParamsCopyWith<$Res> {
  factory _$ManagerRegisterParamsCopyWith(_ManagerRegisterParams value, $Res Function(_ManagerRegisterParams) _then) = __$ManagerRegisterParamsCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String password, String passwordConfirmation, String phone, String companyName, File image
});




}
/// @nodoc
class __$ManagerRegisterParamsCopyWithImpl<$Res>
    implements _$ManagerRegisterParamsCopyWith<$Res> {
  __$ManagerRegisterParamsCopyWithImpl(this._self, this._then);

  final _ManagerRegisterParams _self;
  final $Res Function(_ManagerRegisterParams) _then;

/// Create a copy of ManagerRegisterParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,Object? passwordConfirmation = null,Object? phone = null,Object? companyName = null,Object? image = null,}) {
  return _then(_ManagerRegisterParams(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

// dart format on
