// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaves_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeavesEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesEvent()';
}


}

/// @nodoc
class $LeavesEventCopyWith<$Res>  {
$LeavesEventCopyWith(LeavesEvent _, $Res Function(LeavesEvent) __);
}


/// Adds pattern-matching-related methods to [LeavesEvent].
extension LeavesEventPatterns on LeavesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetLeavesEvent value)?  getLeaves,TResult Function( RequestLeaveEvent value)?  requestLeave,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetLeavesEvent() when getLeaves != null:
return getLeaves(_that);case RequestLeaveEvent() when requestLeave != null:
return requestLeave(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetLeavesEvent value)  getLeaves,required TResult Function( RequestLeaveEvent value)  requestLeave,}){
final _that = this;
switch (_that) {
case GetLeavesEvent():
return getLeaves(_that);case RequestLeaveEvent():
return requestLeave(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetLeavesEvent value)?  getLeaves,TResult? Function( RequestLeaveEvent value)?  requestLeave,}){
final _that = this;
switch (_that) {
case GetLeavesEvent() when getLeaves != null:
return getLeaves(_that);case RequestLeaveEvent() when requestLeave != null:
return requestLeave(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getLeaves,TResult Function( LeaveParams? params)?  requestLeave,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetLeavesEvent() when getLeaves != null:
return getLeaves();case RequestLeaveEvent() when requestLeave != null:
return requestLeave(_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getLeaves,required TResult Function( LeaveParams? params)  requestLeave,}) {final _that = this;
switch (_that) {
case GetLeavesEvent():
return getLeaves();case RequestLeaveEvent():
return requestLeave(_that.params);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getLeaves,TResult? Function( LeaveParams? params)?  requestLeave,}) {final _that = this;
switch (_that) {
case GetLeavesEvent() when getLeaves != null:
return getLeaves();case RequestLeaveEvent() when requestLeave != null:
return requestLeave(_that.params);case _:
  return null;

}
}

}

/// @nodoc


class GetLeavesEvent implements LeavesEvent {
  const GetLeavesEvent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GetLeavesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesEvent.getLeaves()';
}


}




/// @nodoc


class RequestLeaveEvent implements LeavesEvent {
  const RequestLeaveEvent({this.params});
  

 final  LeaveParams? params;

/// Create a copy of LeavesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestLeaveEventCopyWith<RequestLeaveEvent> get copyWith => _$RequestLeaveEventCopyWithImpl<RequestLeaveEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestLeaveEvent&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode {
    return Object.hash(runtimeType,params);
}

@override
String toString() {
    return 'LeavesEvent.requestLeave(params: $params)';
}


}

/// @nodoc
abstract mixin class $RequestLeaveEventCopyWith<$Res> implements $LeavesEventCopyWith<$Res> {
  factory $RequestLeaveEventCopyWith(RequestLeaveEvent value, $Res Function(RequestLeaveEvent) _then) = _$RequestLeaveEventCopyWithImpl;
@useResult
$Res call({
 LeaveParams? params
});


$LeaveParamsCopyWith<$Res>? get params;

}
/// @nodoc
class _$RequestLeaveEventCopyWithImpl<$Res>
    implements $RequestLeaveEventCopyWith<$Res> {
  _$RequestLeaveEventCopyWithImpl(this._self, this._then);

  final RequestLeaveEvent _self;
  final $Res Function(RequestLeaveEvent) _then;

/// Create a copy of LeavesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = freezed,}) {
  return _then(RequestLeaveEvent(
params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as LeaveParams?,
  ));
}

/// Create a copy of LeavesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeaveParamsCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $LeaveParamsCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

// dart format on
