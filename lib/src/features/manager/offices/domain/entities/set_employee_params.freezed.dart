// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_employee_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetEmployeeParams {

@JsonKey(name: 'employee_id') int get employeeId;@JsonKey(name: 'office_id') int? get officeId;@JsonKey(name: 'job_id') int? get jobId;
/// Create a copy of SetEmployeeParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetEmployeeParamsCopyWith<SetEmployeeParams> get copyWith => _$SetEmployeeParamsCopyWithImpl<SetEmployeeParams>(this as SetEmployeeParams, _$identity);

  /// Serializes this SetEmployeeParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SetEmployeeParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetEmployeeParams&&(identical(other.employeeId, _this.employeeId) || other.employeeId == _this.employeeId)&&(identical(other.officeId, _this.officeId) || other.officeId == _this.officeId)&&(identical(other.jobId, _this.jobId) || other.jobId == _this.jobId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SetEmployeeParams;
  return Object.hash(runtimeType,_this.employeeId,_this.officeId,_this.jobId);
}

@override
String toString() {
  final _this = this as SetEmployeeParams;
  return 'SetEmployeeParams(employeeId: ${_this.employeeId}, officeId: ${_this.officeId}, jobId: ${_this.jobId})';
}


}

/// @nodoc
abstract mixin class $SetEmployeeParamsCopyWith<$Res>  {
  factory $SetEmployeeParamsCopyWith(SetEmployeeParams value, $Res Function(SetEmployeeParams) _then) = _$SetEmployeeParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'employee_id') int employeeId,@JsonKey(name: 'office_id') int? officeId,@JsonKey(name: 'job_id') int? jobId
});




}
/// @nodoc
class _$SetEmployeeParamsCopyWithImpl<$Res>
    implements $SetEmployeeParamsCopyWith<$Res> {
  _$SetEmployeeParamsCopyWithImpl(this._self, this._then);

  final SetEmployeeParams _self;
  final $Res Function(SetEmployeeParams) _then;

/// Create a copy of SetEmployeeParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? employeeId = null,Object? officeId = freezed,Object? jobId = freezed,}) {
  return _then(SetEmployeeParams(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int,officeId: freezed == officeId ? _self.officeId : officeId // ignore: cast_nullable_to_non_nullable
as int?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SetEmployeeParams].
extension SetEmployeeParamsPatterns on SetEmployeeParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetEmployeeParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetEmployeeParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetEmployeeParams value)  $default,){
final _that = this;
switch (_that) {
case _SetEmployeeParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetEmployeeParams value)?  $default,){
final _that = this;
switch (_that) {
case _SetEmployeeParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'employee_id')  int employeeId, @JsonKey(name: 'office_id')  int? officeId, @JsonKey(name: 'job_id')  int? jobId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetEmployeeParams() when $default != null:
return $default(_that.employeeId,_that.officeId,_that.jobId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'employee_id')  int employeeId, @JsonKey(name: 'office_id')  int? officeId, @JsonKey(name: 'job_id')  int? jobId)  $default,) {final _that = this;
switch (_that) {
case _SetEmployeeParams():
return $default(_that.employeeId,_that.officeId,_that.jobId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'employee_id')  int employeeId, @JsonKey(name: 'office_id')  int? officeId, @JsonKey(name: 'job_id')  int? jobId)?  $default,) {final _that = this;
switch (_that) {
case _SetEmployeeParams() when $default != null:
return $default(_that.employeeId,_that.officeId,_that.jobId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetEmployeeParams extends SetEmployeeParams {
  const _SetEmployeeParams({@JsonKey(name: 'employee_id') required this.employeeId, @JsonKey(name: 'office_id') this.officeId, @JsonKey(name: 'job_id') this.jobId}): super._();
  factory _SetEmployeeParams.fromJson(Map<String, dynamic> json) => _$SetEmployeeParamsFromJson(json);

@override@JsonKey(name: 'employee_id') final  int employeeId;
@override@JsonKey(name: 'office_id') final  int? officeId;
@override@JsonKey(name: 'job_id') final  int? jobId;

/// Create a copy of SetEmployeeParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetEmployeeParamsCopyWith<_SetEmployeeParams> get copyWith => __$SetEmployeeParamsCopyWithImpl<_SetEmployeeParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetEmployeeParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetEmployeeParams&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.officeId, officeId) || other.officeId == officeId)&&(identical(other.jobId, jobId) || other.jobId == jobId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,employeeId,officeId,jobId);
}

@override
String toString() {
    return 'SetEmployeeParams(employeeId: $employeeId, officeId: $officeId, jobId: $jobId)';
}


}

/// @nodoc
abstract mixin class _$SetEmployeeParamsCopyWith<$Res> implements $SetEmployeeParamsCopyWith<$Res> {
  factory _$SetEmployeeParamsCopyWith(_SetEmployeeParams value, $Res Function(_SetEmployeeParams) _then) = __$SetEmployeeParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'employee_id') int employeeId,@JsonKey(name: 'office_id') int? officeId,@JsonKey(name: 'job_id') int? jobId
});




}
/// @nodoc
class __$SetEmployeeParamsCopyWithImpl<$Res>
    implements _$SetEmployeeParamsCopyWith<$Res> {
  __$SetEmployeeParamsCopyWithImpl(this._self, this._then);

  final _SetEmployeeParams _self;
  final $Res Function(_SetEmployeeParams) _then;

/// Create a copy of SetEmployeeParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? employeeId = null,Object? officeId = freezed,Object? jobId = freezed,}) {
  return _then(_SetEmployeeParams(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int,officeId: freezed == officeId ? _self.officeId : officeId // ignore: cast_nullable_to_non_nullable
as int?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
