// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_register_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeRegisterParams {

 String get name; String get email; String get password; String get confirmPassword; String get phone; String get address; File get image; String get managerPin; int get departmentId; int get jobId; int get officeId;
/// Create a copy of EmployeeRegisterParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeRegisterParamsCopyWith<EmployeeRegisterParams> get copyWith => _$EmployeeRegisterParamsCopyWithImpl<EmployeeRegisterParams>(this as EmployeeRegisterParams, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EmployeeRegisterParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeRegisterParams&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.confirmPassword, _this.confirmPassword) || other.confirmPassword == _this.confirmPassword)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.managerPin, _this.managerPin) || other.managerPin == _this.managerPin)&&(identical(other.departmentId, _this.departmentId) || other.departmentId == _this.departmentId)&&(identical(other.jobId, _this.jobId) || other.jobId == _this.jobId)&&(identical(other.officeId, _this.officeId) || other.officeId == _this.officeId));
}


@override
int get hashCode {
  final _this = this as EmployeeRegisterParams;
  return Object.hash(runtimeType,_this.name,_this.email,_this.password,_this.confirmPassword,_this.phone,_this.address,_this.image,_this.managerPin,_this.departmentId,_this.jobId,_this.officeId);
}

@override
String toString() {
  final _this = this as EmployeeRegisterParams;
  return 'EmployeeRegisterParams(name: ${_this.name}, email: ${_this.email}, password: ${_this.password}, confirmPassword: ${_this.confirmPassword}, phone: ${_this.phone}, address: ${_this.address}, image: ${_this.image}, managerPin: ${_this.managerPin}, departmentId: ${_this.departmentId}, jobId: ${_this.jobId}, officeId: ${_this.officeId})';
}


}

/// @nodoc
abstract mixin class $EmployeeRegisterParamsCopyWith<$Res>  {
  factory $EmployeeRegisterParamsCopyWith(EmployeeRegisterParams value, $Res Function(EmployeeRegisterParams) _then) = _$EmployeeRegisterParamsCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password, String confirmPassword, String phone, String address, File image, String managerPin, int departmentId, int jobId, int officeId
});




}
/// @nodoc
class _$EmployeeRegisterParamsCopyWithImpl<$Res>
    implements $EmployeeRegisterParamsCopyWith<$Res> {
  _$EmployeeRegisterParamsCopyWithImpl(this._self, this._then);

  final EmployeeRegisterParams _self;
  final $Res Function(EmployeeRegisterParams) _then;

/// Create a copy of EmployeeRegisterParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? phone = null,Object? address = null,Object? image = null,Object? managerPin = null,Object? departmentId = null,Object? jobId = null,Object? officeId = null,}) {
  return _then(EmployeeRegisterParams(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,managerPin: null == managerPin ? _self.managerPin : managerPin // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,officeId: null == officeId ? _self.officeId : officeId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeeRegisterParams].
extension EmployeeRegisterParamsPatterns on EmployeeRegisterParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeRegisterParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeRegisterParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeRegisterParams value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeRegisterParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeRegisterParams value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeRegisterParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String confirmPassword,  String phone,  String address,  File image,  String managerPin,  int departmentId,  int jobId,  int officeId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeRegisterParams() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.confirmPassword,_that.phone,_that.address,_that.image,_that.managerPin,_that.departmentId,_that.jobId,_that.officeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String confirmPassword,  String phone,  String address,  File image,  String managerPin,  int departmentId,  int jobId,  int officeId)  $default,) {final _that = this;
switch (_that) {
case _EmployeeRegisterParams():
return $default(_that.name,_that.email,_that.password,_that.confirmPassword,_that.phone,_that.address,_that.image,_that.managerPin,_that.departmentId,_that.jobId,_that.officeId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String password,  String confirmPassword,  String phone,  String address,  File image,  String managerPin,  int departmentId,  int jobId,  int officeId)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeRegisterParams() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.confirmPassword,_that.phone,_that.address,_that.image,_that.managerPin,_that.departmentId,_that.jobId,_that.officeId);case _:
  return null;

}
}

}

/// @nodoc


class _EmployeeRegisterParams extends EmployeeRegisterParams {
  const _EmployeeRegisterParams({required this.name, required this.email, required this.password, required this.confirmPassword, required this.phone, required this.address, required this.image, required this.managerPin, required this.departmentId, required this.jobId, required this.officeId}): super._();
  

@override final  String name;
@override final  String email;
@override final  String password;
@override final  String confirmPassword;
@override final  String phone;
@override final  String address;
@override final  File image;
@override final  String managerPin;
@override final  int departmentId;
@override final  int jobId;
@override final  int officeId;

/// Create a copy of EmployeeRegisterParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeRegisterParamsCopyWith<_EmployeeRegisterParams> get copyWith => __$EmployeeRegisterParamsCopyWithImpl<_EmployeeRegisterParams>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeRegisterParams&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.image, image) || other.image == image)&&(identical(other.managerPin, managerPin) || other.managerPin == managerPin)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.officeId, officeId) || other.officeId == officeId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,email,password,confirmPassword,phone,address,image,managerPin,departmentId,jobId,officeId);
}

@override
String toString() {
    return 'EmployeeRegisterParams(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, phone: $phone, address: $address, image: $image, managerPin: $managerPin, departmentId: $departmentId, jobId: $jobId, officeId: $officeId)';
}


}

/// @nodoc
abstract mixin class _$EmployeeRegisterParamsCopyWith<$Res> implements $EmployeeRegisterParamsCopyWith<$Res> {
  factory _$EmployeeRegisterParamsCopyWith(_EmployeeRegisterParams value, $Res Function(_EmployeeRegisterParams) _then) = __$EmployeeRegisterParamsCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String password, String confirmPassword, String phone, String address, File image, String managerPin, int departmentId, int jobId, int officeId
});




}
/// @nodoc
class __$EmployeeRegisterParamsCopyWithImpl<$Res>
    implements _$EmployeeRegisterParamsCopyWith<$Res> {
  __$EmployeeRegisterParamsCopyWithImpl(this._self, this._then);

  final _EmployeeRegisterParams _self;
  final $Res Function(_EmployeeRegisterParams) _then;

/// Create a copy of EmployeeRegisterParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? phone = null,Object? address = null,Object? image = null,Object? managerPin = null,Object? departmentId = null,Object? jobId = null,Object? officeId = null,}) {
  return _then(_EmployeeRegisterParams(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,managerPin: null == managerPin ? _self.managerPin : managerPin // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,officeId: null == officeId ? _self.officeId : officeId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
