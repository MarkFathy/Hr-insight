// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyParams {

 String get otp; String get email; bool get isEmployee;
/// Create a copy of VerifyParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyParamsCopyWith<VerifyParams> get copyWith => _$VerifyParamsCopyWithImpl<VerifyParams>(this as VerifyParams, _$identity);

  /// Serializes this VerifyParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VerifyParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyParams&&(identical(other.otp, _this.otp) || other.otp == _this.otp)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.isEmployee, _this.isEmployee) || other.isEmployee == _this.isEmployee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VerifyParams;
  return Object.hash(runtimeType,_this.otp,_this.email,_this.isEmployee);
}

@override
String toString() {
  final _this = this as VerifyParams;
  return 'VerifyParams(otp: ${_this.otp}, email: ${_this.email}, isEmployee: ${_this.isEmployee})';
}


}

/// @nodoc
abstract mixin class $VerifyParamsCopyWith<$Res>  {
  factory $VerifyParamsCopyWith(VerifyParams value, $Res Function(VerifyParams) _then) = _$VerifyParamsCopyWithImpl;
@useResult
$Res call({
 String otp, String email, bool isEmployee
});




}
/// @nodoc
class _$VerifyParamsCopyWithImpl<$Res>
    implements $VerifyParamsCopyWith<$Res> {
  _$VerifyParamsCopyWithImpl(this._self, this._then);

  final VerifyParams _self;
  final $Res Function(VerifyParams) _then;

/// Create a copy of VerifyParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otp = null,Object? email = null,Object? isEmployee = null,}) {
  return _then(VerifyParams(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isEmployee: null == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyParams].
extension VerifyParamsPatterns on VerifyParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyParams value)  $default,){
final _that = this;
switch (_that) {
case _VerifyParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyParams value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String otp,  String email,  bool isEmployee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyParams() when $default != null:
return $default(_that.otp,_that.email,_that.isEmployee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String otp,  String email,  bool isEmployee)  $default,) {final _that = this;
switch (_that) {
case _VerifyParams():
return $default(_that.otp,_that.email,_that.isEmployee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String otp,  String email,  bool isEmployee)?  $default,) {final _that = this;
switch (_that) {
case _VerifyParams() when $default != null:
return $default(_that.otp,_that.email,_that.isEmployee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyParams extends VerifyParams {
  const _VerifyParams({required this.otp, required this.email, required this.isEmployee}): super._();
  factory _VerifyParams.fromJson(Map<String, dynamic> json) => _$VerifyParamsFromJson(json);

@override final  String otp;
@override final  String email;
@override final  bool isEmployee;

/// Create a copy of VerifyParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyParamsCopyWith<_VerifyParams> get copyWith => __$VerifyParamsCopyWithImpl<_VerifyParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyParams&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.email, email) || other.email == email)&&(identical(other.isEmployee, isEmployee) || other.isEmployee == isEmployee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,otp,email,isEmployee);
}

@override
String toString() {
    return 'VerifyParams(otp: $otp, email: $email, isEmployee: $isEmployee)';
}


}

/// @nodoc
abstract mixin class _$VerifyParamsCopyWith<$Res> implements $VerifyParamsCopyWith<$Res> {
  factory _$VerifyParamsCopyWith(_VerifyParams value, $Res Function(_VerifyParams) _then) = __$VerifyParamsCopyWithImpl;
@override @useResult
$Res call({
 String otp, String email, bool isEmployee
});




}
/// @nodoc
class __$VerifyParamsCopyWithImpl<$Res>
    implements _$VerifyParamsCopyWith<$Res> {
  __$VerifyParamsCopyWithImpl(this._self, this._then);

  final _VerifyParams _self;
  final $Res Function(_VerifyParams) _then;

/// Create a copy of VerifyParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otp = null,Object? email = null,Object? isEmployee = null,}) {
  return _then(_VerifyParams(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isEmployee: null == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
