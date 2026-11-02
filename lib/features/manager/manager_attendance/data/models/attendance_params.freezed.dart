// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagerAttendanceParams {

@JsonKey(name: 'employee_id') String get employeeId; DateTime get date;
/// Create a copy of ManagerAttendanceParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerAttendanceParamsCopyWith<ManagerAttendanceParams> get copyWith => _$ManagerAttendanceParamsCopyWithImpl<ManagerAttendanceParams>(this as ManagerAttendanceParams, _$identity);

  /// Serializes this ManagerAttendanceParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManagerAttendanceParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerAttendanceParams&&(identical(other.employeeId, _this.employeeId) || other.employeeId == _this.employeeId)&&(identical(other.date, _this.date) || other.date == _this.date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManagerAttendanceParams;
  return Object.hash(runtimeType,_this.employeeId,_this.date);
}

@override
String toString() {
  final _this = this as ManagerAttendanceParams;
  return 'ManagerAttendanceParams(employeeId: ${_this.employeeId}, date: ${_this.date})';
}


}

/// @nodoc
abstract mixin class $ManagerAttendanceParamsCopyWith<$Res>  {
  factory $ManagerAttendanceParamsCopyWith(ManagerAttendanceParams value, $Res Function(ManagerAttendanceParams) _then) = _$ManagerAttendanceParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'employee_id') String employeeId, DateTime date
});




}
/// @nodoc
class _$ManagerAttendanceParamsCopyWithImpl<$Res>
    implements $ManagerAttendanceParamsCopyWith<$Res> {
  _$ManagerAttendanceParamsCopyWithImpl(this._self, this._then);

  final ManagerAttendanceParams _self;
  final $Res Function(ManagerAttendanceParams) _then;

/// Create a copy of ManagerAttendanceParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? employeeId = null,Object? date = null,}) {
  return _then(ManagerAttendanceParams(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagerAttendanceParams].
extension ManagerAttendanceParamsPatterns on ManagerAttendanceParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagerAttendanceParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagerAttendanceParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagerAttendanceParams value)  $default,){
final _that = this;
switch (_that) {
case _ManagerAttendanceParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagerAttendanceParams value)?  $default,){
final _that = this;
switch (_that) {
case _ManagerAttendanceParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'employee_id')  String employeeId,  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagerAttendanceParams() when $default != null:
return $default(_that.employeeId,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'employee_id')  String employeeId,  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _ManagerAttendanceParams():
return $default(_that.employeeId,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'employee_id')  String employeeId,  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _ManagerAttendanceParams() when $default != null:
return $default(_that.employeeId,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagerAttendanceParams extends ManagerAttendanceParams {
  const _ManagerAttendanceParams({@JsonKey(name: 'employee_id') required this.employeeId, required this.date}): super._();
  factory _ManagerAttendanceParams.fromJson(Map<String, dynamic> json) => _$ManagerAttendanceParamsFromJson(json);

@override@JsonKey(name: 'employee_id') final  String employeeId;
@override final  DateTime date;

/// Create a copy of ManagerAttendanceParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerAttendanceParamsCopyWith<_ManagerAttendanceParams> get copyWith => __$ManagerAttendanceParamsCopyWithImpl<_ManagerAttendanceParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagerAttendanceParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagerAttendanceParams&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,employeeId,date);
}

@override
String toString() {
    return 'ManagerAttendanceParams(employeeId: $employeeId, date: $date)';
}


}

/// @nodoc
abstract mixin class _$ManagerAttendanceParamsCopyWith<$Res> implements $ManagerAttendanceParamsCopyWith<$Res> {
  factory _$ManagerAttendanceParamsCopyWith(_ManagerAttendanceParams value, $Res Function(_ManagerAttendanceParams) _then) = __$ManagerAttendanceParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'employee_id') String employeeId, DateTime date
});




}
/// @nodoc
class __$ManagerAttendanceParamsCopyWithImpl<$Res>
    implements _$ManagerAttendanceParamsCopyWith<$Res> {
  __$ManagerAttendanceParamsCopyWithImpl(this._self, this._then);

  final _ManagerAttendanceParams _self;
  final $Res Function(_ManagerAttendanceParams) _then;

/// Create a copy of ManagerAttendanceParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? employeeId = null,Object? date = null,}) {
  return _then(_ManagerAttendanceParams(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
