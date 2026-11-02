// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobParams {

 String? get title;@JsonKey(name: 'job_id') int? get jobId;@JsonKey(name: 'department_id') int? get departmentId;
/// Create a copy of JobParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobParamsCopyWith<JobParams> get copyWith => _$JobParamsCopyWithImpl<JobParams>(this as JobParams, _$identity);

  /// Serializes this JobParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JobParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobParams&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.jobId, _this.jobId) || other.jobId == _this.jobId)&&(identical(other.departmentId, _this.departmentId) || other.departmentId == _this.departmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JobParams;
  return Object.hash(runtimeType,_this.title,_this.jobId,_this.departmentId);
}

@override
String toString() {
  final _this = this as JobParams;
  return 'JobParams(title: ${_this.title}, jobId: ${_this.jobId}, departmentId: ${_this.departmentId})';
}


}

/// @nodoc
abstract mixin class $JobParamsCopyWith<$Res>  {
  factory $JobParamsCopyWith(JobParams value, $Res Function(JobParams) _then) = _$JobParamsCopyWithImpl;
@useResult
$Res call({
 String? title,@JsonKey(name: 'job_id') int? jobId,@JsonKey(name: 'department_id') int? departmentId
});




}
/// @nodoc
class _$JobParamsCopyWithImpl<$Res>
    implements $JobParamsCopyWith<$Res> {
  _$JobParamsCopyWithImpl(this._self, this._then);

  final JobParams _self;
  final $Res Function(JobParams) _then;

/// Create a copy of JobParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? jobId = freezed,Object? departmentId = freezed,}) {
  return _then(JobParams(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobParams].
extension JobParamsPatterns on JobParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobParams value)  $default,){
final _that = this;
switch (_that) {
case _JobParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobParams value)?  $default,){
final _that = this;
switch (_that) {
case _JobParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title, @JsonKey(name: 'job_id')  int? jobId, @JsonKey(name: 'department_id')  int? departmentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobParams() when $default != null:
return $default(_that.title,_that.jobId,_that.departmentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title, @JsonKey(name: 'job_id')  int? jobId, @JsonKey(name: 'department_id')  int? departmentId)  $default,) {final _that = this;
switch (_that) {
case _JobParams():
return $default(_that.title,_that.jobId,_that.departmentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title, @JsonKey(name: 'job_id')  int? jobId, @JsonKey(name: 'department_id')  int? departmentId)?  $default,) {final _that = this;
switch (_that) {
case _JobParams() when $default != null:
return $default(_that.title,_that.jobId,_that.departmentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobParams extends JobParams {
  const _JobParams({required this.title, @JsonKey(name: 'job_id') this.jobId, @JsonKey(name: 'department_id') this.departmentId}): super._();
  factory _JobParams.fromJson(Map<String, dynamic> json) => _$JobParamsFromJson(json);

@override final  String? title;
@override@JsonKey(name: 'job_id') final  int? jobId;
@override@JsonKey(name: 'department_id') final  int? departmentId;

/// Create a copy of JobParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobParamsCopyWith<_JobParams> get copyWith => __$JobParamsCopyWithImpl<_JobParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobParams&&(identical(other.title, title) || other.title == title)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,jobId,departmentId);
}

@override
String toString() {
    return 'JobParams(title: $title, jobId: $jobId, departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class _$JobParamsCopyWith<$Res> implements $JobParamsCopyWith<$Res> {
  factory _$JobParamsCopyWith(_JobParams value, $Res Function(_JobParams) _then) = __$JobParamsCopyWithImpl;
@override @useResult
$Res call({
 String? title,@JsonKey(name: 'job_id') int? jobId,@JsonKey(name: 'department_id') int? departmentId
});




}
/// @nodoc
class __$JobParamsCopyWithImpl<$Res>
    implements _$JobParamsCopyWith<$Res> {
  __$JobParamsCopyWithImpl(this._self, this._then);

  final _JobParams _self;
  final $Res Function(_JobParams) _then;

/// Create a copy of JobParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? jobId = freezed,Object? departmentId = freezed,}) {
  return _then(_JobParams(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
