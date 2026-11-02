// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManagerAttendanceEvent {

 ManagerAttendanceParams get params;
/// Create a copy of ManagerAttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerAttendanceEventCopyWith<ManagerAttendanceEvent> get copyWith => _$ManagerAttendanceEventCopyWithImpl<ManagerAttendanceEvent>(this as ManagerAttendanceEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ManagerAttendanceEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerAttendanceEvent&&(identical(other.params, _this.params) || other.params == _this.params));
}


@override
int get hashCode {
  final _this = this as ManagerAttendanceEvent;
  return Object.hash(runtimeType,_this.params);
}

@override
String toString() {
  final _this = this as ManagerAttendanceEvent;
  return 'ManagerAttendanceEvent(params: ${_this.params})';
}


}

/// @nodoc
abstract mixin class $ManagerAttendanceEventCopyWith<$Res>  {
  factory $ManagerAttendanceEventCopyWith(ManagerAttendanceEvent value, $Res Function(ManagerAttendanceEvent) _then) = _$ManagerAttendanceEventCopyWithImpl;
@useResult
$Res call({
 ManagerAttendanceParams params
});


$ManagerAttendanceParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$ManagerAttendanceEventCopyWithImpl<$Res>
    implements $ManagerAttendanceEventCopyWith<$Res> {
  _$ManagerAttendanceEventCopyWithImpl(this._self, this._then);

  final ManagerAttendanceEvent _self;
  final $Res Function(ManagerAttendanceEvent) _then;

/// Create a copy of ManagerAttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? params = null,}) {
  return _then(ManagerAttendanceEvent.load(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as ManagerAttendanceParams,
  ));
}
/// Create a copy of ManagerAttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerAttendanceParamsCopyWith<$Res> get params {
  
  return $ManagerAttendanceParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManagerAttendanceEvent].
extension ManagerAttendanceEventPatterns on ManagerAttendanceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadManagerAttendanceEvent value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadManagerAttendanceEvent() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadManagerAttendanceEvent value)  load,}){
final _that = this;
switch (_that) {
case LoadManagerAttendanceEvent():
return load(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadManagerAttendanceEvent value)?  load,}){
final _that = this;
switch (_that) {
case LoadManagerAttendanceEvent() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ManagerAttendanceParams params)?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadManagerAttendanceEvent() when load != null:
return load(_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ManagerAttendanceParams params)  load,}) {final _that = this;
switch (_that) {
case LoadManagerAttendanceEvent():
return load(_that.params);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ManagerAttendanceParams params)?  load,}) {final _that = this;
switch (_that) {
case LoadManagerAttendanceEvent() when load != null:
return load(_that.params);case _:
  return null;

}
}

}

/// @nodoc


class LoadManagerAttendanceEvent implements ManagerAttendanceEvent {
  const LoadManagerAttendanceEvent(this.params);
  

@override final  ManagerAttendanceParams params;

/// Create a copy of ManagerAttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadManagerAttendanceEventCopyWith<LoadManagerAttendanceEvent> get copyWith => _$LoadManagerAttendanceEventCopyWithImpl<LoadManagerAttendanceEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadManagerAttendanceEvent&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode {
    return Object.hash(runtimeType,params);
}

@override
String toString() {
    return 'ManagerAttendanceEvent.load(params: $params)';
}


}

/// @nodoc
abstract mixin class $LoadManagerAttendanceEventCopyWith<$Res> implements $ManagerAttendanceEventCopyWith<$Res> {
  factory $LoadManagerAttendanceEventCopyWith(LoadManagerAttendanceEvent value, $Res Function(LoadManagerAttendanceEvent) _then) = _$LoadManagerAttendanceEventCopyWithImpl;
@override @useResult
$Res call({
 ManagerAttendanceParams params
});


@override $ManagerAttendanceParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$LoadManagerAttendanceEventCopyWithImpl<$Res>
    implements $LoadManagerAttendanceEventCopyWith<$Res> {
  _$LoadManagerAttendanceEventCopyWithImpl(this._self, this._then);

  final LoadManagerAttendanceEvent _self;
  final $Res Function(LoadManagerAttendanceEvent) _then;

/// Create a copy of ManagerAttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(LoadManagerAttendanceEvent(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as ManagerAttendanceParams,
  ));
}

/// Create a copy of ManagerAttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerAttendanceParamsCopyWith<$Res> get params {
  
  return $ManagerAttendanceParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

// dart format on
