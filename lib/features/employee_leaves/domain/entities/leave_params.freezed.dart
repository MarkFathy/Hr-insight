// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveParams {

 String? get notes; DateTime? get from; DateTime? get to;@JsonKey(name: 'leave_type') String? get leaveType;
/// Create a copy of LeaveParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveParamsCopyWith<LeaveParams> get copyWith => _$LeaveParamsCopyWithImpl<LeaveParams>(this as LeaveParams, _$identity);

  /// Serializes this LeaveParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeaveParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveParams&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.to, _this.to) || other.to == _this.to)&&(identical(other.leaveType, _this.leaveType) || other.leaveType == _this.leaveType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeaveParams;
  return Object.hash(runtimeType,_this.notes,_this.from,_this.to,_this.leaveType);
}

@override
String toString() {
  final _this = this as LeaveParams;
  return 'LeaveParams(notes: ${_this.notes}, from: ${_this.from}, to: ${_this.to}, leaveType: ${_this.leaveType})';
}


}

/// @nodoc
abstract mixin class $LeaveParamsCopyWith<$Res>  {
  factory $LeaveParamsCopyWith(LeaveParams value, $Res Function(LeaveParams) _then) = _$LeaveParamsCopyWithImpl;
@useResult
$Res call({
 String? notes, DateTime? from, DateTime? to,@JsonKey(name: 'leave_type') String? leaveType
});




}
/// @nodoc
class _$LeaveParamsCopyWithImpl<$Res>
    implements $LeaveParamsCopyWith<$Res> {
  _$LeaveParamsCopyWithImpl(this._self, this._then);

  final LeaveParams _self;
  final $Res Function(LeaveParams) _then;

/// Create a copy of LeaveParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notes = freezed,Object? from = freezed,Object? to = freezed,Object? leaveType = freezed,}) {
  return _then(LeaveParams(
notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,leaveType: freezed == leaveType ? _self.leaveType : leaveType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaveParams].
extension LeaveParamsPatterns on LeaveParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaveParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaveParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaveParams value)  $default,){
final _that = this;
switch (_that) {
case _LeaveParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaveParams value)?  $default,){
final _that = this;
switch (_that) {
case _LeaveParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? notes,  DateTime? from,  DateTime? to, @JsonKey(name: 'leave_type')  String? leaveType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaveParams() when $default != null:
return $default(_that.notes,_that.from,_that.to,_that.leaveType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? notes,  DateTime? from,  DateTime? to, @JsonKey(name: 'leave_type')  String? leaveType)  $default,) {final _that = this;
switch (_that) {
case _LeaveParams():
return $default(_that.notes,_that.from,_that.to,_that.leaveType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? notes,  DateTime? from,  DateTime? to, @JsonKey(name: 'leave_type')  String? leaveType)?  $default,) {final _that = this;
switch (_that) {
case _LeaveParams() when $default != null:
return $default(_that.notes,_that.from,_that.to,_that.leaveType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaveParams extends LeaveParams {
  const _LeaveParams({required this.notes, required this.from, required this.to, @JsonKey(name: 'leave_type') required this.leaveType}): super._();
  factory _LeaveParams.fromJson(Map<String, dynamic> json) => _$LeaveParamsFromJson(json);

@override final  String? notes;
@override final  DateTime? from;
@override final  DateTime? to;
@override@JsonKey(name: 'leave_type') final  String? leaveType;

/// Create a copy of LeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveParamsCopyWith<_LeaveParams> get copyWith => __$LeaveParamsCopyWithImpl<_LeaveParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveParams&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.leaveType, leaveType) || other.leaveType == leaveType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,notes,from,to,leaveType);
}

@override
String toString() {
    return 'LeaveParams(notes: $notes, from: $from, to: $to, leaveType: $leaveType)';
}


}

/// @nodoc
abstract mixin class _$LeaveParamsCopyWith<$Res> implements $LeaveParamsCopyWith<$Res> {
  factory _$LeaveParamsCopyWith(_LeaveParams value, $Res Function(_LeaveParams) _then) = __$LeaveParamsCopyWithImpl;
@override @useResult
$Res call({
 String? notes, DateTime? from, DateTime? to,@JsonKey(name: 'leave_type') String? leaveType
});




}
/// @nodoc
class __$LeaveParamsCopyWithImpl<$Res>
    implements _$LeaveParamsCopyWith<$Res> {
  __$LeaveParamsCopyWithImpl(this._self, this._then);

  final _LeaveParams _self;
  final $Res Function(_LeaveParams) _then;

/// Create a copy of LeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notes = freezed,Object? from = freezed,Object? to = freezed,Object? leaveType = freezed,}) {
  return _then(_LeaveParams(
notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,leaveType: freezed == leaveType ? _self.leaveType : leaveType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
