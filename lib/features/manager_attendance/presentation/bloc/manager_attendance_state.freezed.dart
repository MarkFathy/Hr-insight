// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_attendance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManagerAttendanceState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerAttendanceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ManagerAttendanceState()';
}


}

/// @nodoc
class $ManagerAttendanceStateCopyWith<$Res>  {
$ManagerAttendanceStateCopyWith(ManagerAttendanceState _, $Res Function(ManagerAttendanceState) __);
}


/// Adds pattern-matching-related methods to [ManagerAttendanceState].
extension ManagerAttendanceStatePatterns on ManagerAttendanceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ManagerAttendanceStateInitial value)?  initial,TResult Function( ManagerAttendanceStateLoading value)?  loading,TResult Function( ManagerAttendanceStateLoaded value)?  loaded,TResult Function( ManagerAttendanceStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ManagerAttendanceStateInitial() when initial != null:
return initial(_that);case ManagerAttendanceStateLoading() when loading != null:
return loading(_that);case ManagerAttendanceStateLoaded() when loaded != null:
return loaded(_that);case ManagerAttendanceStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ManagerAttendanceStateInitial value)  initial,required TResult Function( ManagerAttendanceStateLoading value)  loading,required TResult Function( ManagerAttendanceStateLoaded value)  loaded,required TResult Function( ManagerAttendanceStateError value)  error,}){
final _that = this;
switch (_that) {
case ManagerAttendanceStateInitial():
return initial(_that);case ManagerAttendanceStateLoading():
return loading(_that);case ManagerAttendanceStateLoaded():
return loaded(_that);case ManagerAttendanceStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ManagerAttendanceStateInitial value)?  initial,TResult? Function( ManagerAttendanceStateLoading value)?  loading,TResult? Function( ManagerAttendanceStateLoaded value)?  loaded,TResult? Function( ManagerAttendanceStateError value)?  error,}){
final _that = this;
switch (_that) {
case ManagerAttendanceStateInitial() when initial != null:
return initial(_that);case ManagerAttendanceStateLoading() when loading != null:
return loading(_that);case ManagerAttendanceStateLoaded() when loaded != null:
return loaded(_that);case ManagerAttendanceStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ManagerAttendanceEntity? attendance)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ManagerAttendanceStateInitial() when initial != null:
return initial();case ManagerAttendanceStateLoading() when loading != null:
return loading();case ManagerAttendanceStateLoaded() when loaded != null:
return loaded(_that.attendance);case ManagerAttendanceStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ManagerAttendanceEntity? attendance)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ManagerAttendanceStateInitial():
return initial();case ManagerAttendanceStateLoading():
return loading();case ManagerAttendanceStateLoaded():
return loaded(_that.attendance);case ManagerAttendanceStateError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ManagerAttendanceEntity? attendance)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ManagerAttendanceStateInitial() when initial != null:
return initial();case ManagerAttendanceStateLoading() when loading != null:
return loading();case ManagerAttendanceStateLoaded() when loaded != null:
return loaded(_that.attendance);case ManagerAttendanceStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ManagerAttendanceStateInitial implements ManagerAttendanceState {
  const ManagerAttendanceStateInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerAttendanceStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ManagerAttendanceState.initial()';
}


}




/// @nodoc


class ManagerAttendanceStateLoading implements ManagerAttendanceState {
  const ManagerAttendanceStateLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerAttendanceStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ManagerAttendanceState.loading()';
}


}




/// @nodoc


class ManagerAttendanceStateLoaded implements ManagerAttendanceState {
  const ManagerAttendanceStateLoaded({required this.attendance});
  

 final  ManagerAttendanceEntity? attendance;

/// Create a copy of ManagerAttendanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerAttendanceStateLoadedCopyWith<ManagerAttendanceStateLoaded> get copyWith => _$ManagerAttendanceStateLoadedCopyWithImpl<ManagerAttendanceStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerAttendanceStateLoaded&&(identical(other.attendance, attendance) || other.attendance == attendance));
}


@override
int get hashCode {
    return Object.hash(runtimeType,attendance);
}

@override
String toString() {
    return 'ManagerAttendanceState.loaded(attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class $ManagerAttendanceStateLoadedCopyWith<$Res> implements $ManagerAttendanceStateCopyWith<$Res> {
  factory $ManagerAttendanceStateLoadedCopyWith(ManagerAttendanceStateLoaded value, $Res Function(ManagerAttendanceStateLoaded) _then) = _$ManagerAttendanceStateLoadedCopyWithImpl;
@useResult
$Res call({
 ManagerAttendanceEntity? attendance
});


$ManagerAttendanceEntityCopyWith<$Res>? get attendance;

}
/// @nodoc
class _$ManagerAttendanceStateLoadedCopyWithImpl<$Res>
    implements $ManagerAttendanceStateLoadedCopyWith<$Res> {
  _$ManagerAttendanceStateLoadedCopyWithImpl(this._self, this._then);

  final ManagerAttendanceStateLoaded _self;
  final $Res Function(ManagerAttendanceStateLoaded) _then;

/// Create a copy of ManagerAttendanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attendance = freezed,}) {
  return _then(ManagerAttendanceStateLoaded(
attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as ManagerAttendanceEntity?,
  ));
}

/// Create a copy of ManagerAttendanceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerAttendanceEntityCopyWith<$Res>? get attendance {
    if (_self.attendance == null) {
    return null;
  }

  return $ManagerAttendanceEntityCopyWith<$Res>(_self.attendance!, (value) {
    return _then(_self.copyWith(attendance: value));
  });
}
}

/// @nodoc


class ManagerAttendanceStateError implements ManagerAttendanceState {
  const ManagerAttendanceStateError(this.message);
  

 final  String message;

/// Create a copy of ManagerAttendanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerAttendanceStateErrorCopyWith<ManagerAttendanceStateError> get copyWith => _$ManagerAttendanceStateErrorCopyWithImpl<ManagerAttendanceStateError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerAttendanceStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'ManagerAttendanceState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ManagerAttendanceStateErrorCopyWith<$Res> implements $ManagerAttendanceStateCopyWith<$Res> {
  factory $ManagerAttendanceStateErrorCopyWith(ManagerAttendanceStateError value, $Res Function(ManagerAttendanceStateError) _then) = _$ManagerAttendanceStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ManagerAttendanceStateErrorCopyWithImpl<$Res>
    implements $ManagerAttendanceStateErrorCopyWith<$Res> {
  _$ManagerAttendanceStateErrorCopyWithImpl(this._self, this._then);

  final ManagerAttendanceStateError _self;
  final $Res Function(ManagerAttendanceStateError) _then;

/// Create a copy of ManagerAttendanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ManagerAttendanceStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
