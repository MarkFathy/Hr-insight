// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_delete_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountDeleteParams {

 String get password; bool get isEmployee;
/// Create a copy of AccountDeleteParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDeleteParamsCopyWith<AccountDeleteParams> get copyWith => _$AccountDeleteParamsCopyWithImpl<AccountDeleteParams>(this as AccountDeleteParams, _$identity);

  /// Serializes this AccountDeleteParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AccountDeleteParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDeleteParams&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.isEmployee, _this.isEmployee) || other.isEmployee == _this.isEmployee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AccountDeleteParams;
  return Object.hash(runtimeType,_this.password,_this.isEmployee);
}

@override
String toString() {
  final _this = this as AccountDeleteParams;
  return 'AccountDeleteParams(password: ${_this.password}, isEmployee: ${_this.isEmployee})';
}


}

/// @nodoc
abstract mixin class $AccountDeleteParamsCopyWith<$Res>  {
  factory $AccountDeleteParamsCopyWith(AccountDeleteParams value, $Res Function(AccountDeleteParams) _then) = _$AccountDeleteParamsCopyWithImpl;
@useResult
$Res call({
 String password, bool isEmployee
});




}
/// @nodoc
class _$AccountDeleteParamsCopyWithImpl<$Res>
    implements $AccountDeleteParamsCopyWith<$Res> {
  _$AccountDeleteParamsCopyWithImpl(this._self, this._then);

  final AccountDeleteParams _self;
  final $Res Function(AccountDeleteParams) _then;

/// Create a copy of AccountDeleteParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? password = null,Object? isEmployee = null,}) {
  return _then(AccountDeleteParams(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isEmployee: null == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountDeleteParams].
extension AccountDeleteParamsPatterns on AccountDeleteParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountDeleteParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountDeleteParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountDeleteParams value)  $default,){
final _that = this;
switch (_that) {
case _AccountDeleteParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountDeleteParams value)?  $default,){
final _that = this;
switch (_that) {
case _AccountDeleteParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String password,  bool isEmployee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountDeleteParams() when $default != null:
return $default(_that.password,_that.isEmployee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String password,  bool isEmployee)  $default,) {final _that = this;
switch (_that) {
case _AccountDeleteParams():
return $default(_that.password,_that.isEmployee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String password,  bool isEmployee)?  $default,) {final _that = this;
switch (_that) {
case _AccountDeleteParams() when $default != null:
return $default(_that.password,_that.isEmployee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountDeleteParams implements AccountDeleteParams {
  const _AccountDeleteParams({required this.password, this.isEmployee = true});
  factory _AccountDeleteParams.fromJson(Map<String, dynamic> json) => _$AccountDeleteParamsFromJson(json);

@override final  String password;
@override@JsonKey() final  bool isEmployee;

/// Create a copy of AccountDeleteParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountDeleteParamsCopyWith<_AccountDeleteParams> get copyWith => __$AccountDeleteParamsCopyWithImpl<_AccountDeleteParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountDeleteParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountDeleteParams&&(identical(other.password, password) || other.password == password)&&(identical(other.isEmployee, isEmployee) || other.isEmployee == isEmployee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,password,isEmployee);
}

@override
String toString() {
    return 'AccountDeleteParams(password: $password, isEmployee: $isEmployee)';
}


}

/// @nodoc
abstract mixin class _$AccountDeleteParamsCopyWith<$Res> implements $AccountDeleteParamsCopyWith<$Res> {
  factory _$AccountDeleteParamsCopyWith(_AccountDeleteParams value, $Res Function(_AccountDeleteParams) _then) = __$AccountDeleteParamsCopyWithImpl;
@override @useResult
$Res call({
 String password, bool isEmployee
});




}
/// @nodoc
class __$AccountDeleteParamsCopyWithImpl<$Res>
    implements _$AccountDeleteParamsCopyWith<$Res> {
  __$AccountDeleteParamsCopyWithImpl(this._self, this._then);

  final _AccountDeleteParams _self;
  final $Res Function(_AccountDeleteParams) _then;

/// Create a copy of AccountDeleteParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? password = null,Object? isEmployee = null,}) {
  return _then(_AccountDeleteParams(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isEmployee: null == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
