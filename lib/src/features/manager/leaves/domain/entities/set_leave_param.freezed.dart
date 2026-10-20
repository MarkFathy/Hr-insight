// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_leave_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetLeaveParams {

@JsonKey(name: 'leave_id') int? get id; String? get status;
/// Create a copy of SetLeaveParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetLeaveParamsCopyWith<SetLeaveParams> get copyWith => _$SetLeaveParamsCopyWithImpl<SetLeaveParams>(this as SetLeaveParams, _$identity);

  /// Serializes this SetLeaveParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SetLeaveParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetLeaveParams&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SetLeaveParams;
  return Object.hash(runtimeType,_this.id,_this.status);
}

@override
String toString() {
  final _this = this as SetLeaveParams;
  return 'SetLeaveParams(id: ${_this.id}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $SetLeaveParamsCopyWith<$Res>  {
  factory $SetLeaveParamsCopyWith(SetLeaveParams value, $Res Function(SetLeaveParams) _then) = _$SetLeaveParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'leave_id') int? id, String? status
});




}
/// @nodoc
class _$SetLeaveParamsCopyWithImpl<$Res>
    implements $SetLeaveParamsCopyWith<$Res> {
  _$SetLeaveParamsCopyWithImpl(this._self, this._then);

  final SetLeaveParams _self;
  final $Res Function(SetLeaveParams) _then;

/// Create a copy of SetLeaveParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? status = freezed,}) {
  return _then(SetLeaveParams(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SetLeaveParams].
extension SetLeaveParamsPatterns on SetLeaveParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetLeaveParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetLeaveParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetLeaveParams value)  $default,){
final _that = this;
switch (_that) {
case _SetLeaveParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetLeaveParams value)?  $default,){
final _that = this;
switch (_that) {
case _SetLeaveParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'leave_id')  int? id,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetLeaveParams() when $default != null:
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'leave_id')  int? id,  String? status)  $default,) {final _that = this;
switch (_that) {
case _SetLeaveParams():
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'leave_id')  int? id,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _SetLeaveParams() when $default != null:
return $default(_that.id,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetLeaveParams extends SetLeaveParams {
  const _SetLeaveParams({@JsonKey(name: 'leave_id') required this.id, required this.status}): super._();
  factory _SetLeaveParams.fromJson(Map<String, dynamic> json) => _$SetLeaveParamsFromJson(json);

@override@JsonKey(name: 'leave_id') final  int? id;
@override final  String? status;

/// Create a copy of SetLeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLeaveParamsCopyWith<_SetLeaveParams> get copyWith => __$SetLeaveParamsCopyWithImpl<_SetLeaveParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetLeaveParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLeaveParams&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,status);
}

@override
String toString() {
    return 'SetLeaveParams(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SetLeaveParamsCopyWith<$Res> implements $SetLeaveParamsCopyWith<$Res> {
  factory _$SetLeaveParamsCopyWith(_SetLeaveParams value, $Res Function(_SetLeaveParams) _then) = __$SetLeaveParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'leave_id') int? id, String? status
});




}
/// @nodoc
class __$SetLeaveParamsCopyWithImpl<$Res>
    implements _$SetLeaveParamsCopyWith<$Res> {
  __$SetLeaveParamsCopyWithImpl(this._self, this._then);

  final _SetLeaveParams _self;
  final $Res Function(_SetLeaveParams) _then;

/// Create a copy of SetLeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? status = freezed,}) {
  return _then(_SetLeaveParams(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
