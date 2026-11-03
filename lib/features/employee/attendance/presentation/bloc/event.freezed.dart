// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AttendanceEvent()';
}


}

/// @nodoc
class $AttendanceEventCopyWith<$Res>  {
$AttendanceEventCopyWith(AttendanceEvent _, $Res Function(AttendanceEvent) __);
}


/// Adds pattern-matching-related methods to [AttendanceEvent].
extension AttendanceEventPatterns on AttendanceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetAttendanceEvent value)?  getAttendance,TResult Function( SignEvent value)?  sign,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetAttendanceEvent() when getAttendance != null:
return getAttendance(_that);case SignEvent() when sign != null:
return sign(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetAttendanceEvent value)  getAttendance,required TResult Function( SignEvent value)  sign,}){
final _that = this;
switch (_that) {
case GetAttendanceEvent():
return getAttendance(_that);case SignEvent():
return sign(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetAttendanceEvent value)?  getAttendance,TResult? Function( SignEvent value)?  sign,}){
final _that = this;
switch (_that) {
case GetAttendanceEvent() when getAttendance != null:
return getAttendance(_that);case SignEvent() when sign != null:
return sign(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getAttendance,TResult Function( bool isAttend,  int? attendanceId,  String? date)?  sign,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetAttendanceEvent() when getAttendance != null:
return getAttendance();case SignEvent() when sign != null:
return sign(_that.isAttend,_that.attendanceId,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getAttendance,required TResult Function( bool isAttend,  int? attendanceId,  String? date)  sign,}) {final _that = this;
switch (_that) {
case GetAttendanceEvent():
return getAttendance();case SignEvent():
return sign(_that.isAttend,_that.attendanceId,_that.date);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getAttendance,TResult? Function( bool isAttend,  int? attendanceId,  String? date)?  sign,}) {final _that = this;
switch (_that) {
case GetAttendanceEvent() when getAttendance != null:
return getAttendance();case SignEvent() when sign != null:
return sign(_that.isAttend,_that.attendanceId,_that.date);case _:
  return null;

}
}

}

/// @nodoc


class GetAttendanceEvent implements AttendanceEvent {
  const GetAttendanceEvent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAttendanceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AttendanceEvent.getAttendance()';
}


}




/// @nodoc


class SignEvent implements AttendanceEvent {
  const SignEvent({required this.isAttend, this.attendanceId, this.date});
  

 final  bool isAttend;
 final  int? attendanceId;
 final  String? date;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignEventCopyWith<SignEvent> get copyWith => _$SignEventCopyWithImpl<SignEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SignEvent&&(identical(other.isAttend, isAttend) || other.isAttend == isAttend)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isAttend,attendanceId,date);
}

@override
String toString() {
    return 'AttendanceEvent.sign(isAttend: $isAttend, attendanceId: $attendanceId, date: $date)';
}


}

/// @nodoc
abstract mixin class $SignEventCopyWith<$Res> implements $AttendanceEventCopyWith<$Res> {
  factory $SignEventCopyWith(SignEvent value, $Res Function(SignEvent) _then) = _$SignEventCopyWithImpl;
@useResult
$Res call({
 bool isAttend, int? attendanceId, String? date
});




}
/// @nodoc
class _$SignEventCopyWithImpl<$Res>
    implements $SignEventCopyWith<$Res> {
  _$SignEventCopyWithImpl(this._self, this._then);

  final SignEvent _self;
  final $Res Function(SignEvent) _then;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isAttend = null,Object? attendanceId = freezed,Object? date = freezed,}) {
  return _then(SignEvent(
isAttend: null == isAttend ? _self.isAttend : isAttend // ignore: cast_nullable_to_non_nullable
as bool,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
