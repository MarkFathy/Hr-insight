// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AttendanceState()';
}


}

/// @nodoc
class $AttendanceStateCopyWith<$Res>  {
$AttendanceStateCopyWith(AttendanceState _, $Res Function(AttendanceState) __);
}


/// Adds pattern-matching-related methods to [AttendanceState].
extension AttendanceStatePatterns on AttendanceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AttendanceInitialState value)?  initial,TResult Function( AttendanceLoadingState value)?  loading,TResult Function( AttendanceLoadedState value)?  loaded,TResult Function( AttendanceSignedState value)?  signed,TResult Function( AttendanceErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AttendanceInitialState() when initial != null:
return initial(_that);case AttendanceLoadingState() when loading != null:
return loading(_that);case AttendanceLoadedState() when loaded != null:
return loaded(_that);case AttendanceSignedState() when signed != null:
return signed(_that);case AttendanceErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AttendanceInitialState value)  initial,required TResult Function( AttendanceLoadingState value)  loading,required TResult Function( AttendanceLoadedState value)  loaded,required TResult Function( AttendanceSignedState value)  signed,required TResult Function( AttendanceErrorState value)  error,}){
final _that = this;
switch (_that) {
case AttendanceInitialState():
return initial(_that);case AttendanceLoadingState():
return loading(_that);case AttendanceLoadedState():
return loaded(_that);case AttendanceSignedState():
return signed(_that);case AttendanceErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AttendanceInitialState value)?  initial,TResult? Function( AttendanceLoadingState value)?  loading,TResult? Function( AttendanceLoadedState value)?  loaded,TResult? Function( AttendanceSignedState value)?  signed,TResult? Function( AttendanceErrorState value)?  error,}){
final _that = this;
switch (_that) {
case AttendanceInitialState() when initial != null:
return initial(_that);case AttendanceLoadingState() when loading != null:
return loading(_that);case AttendanceLoadedState() when loaded != null:
return loaded(_that);case AttendanceSignedState() when signed != null:
return signed(_that);case AttendanceErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AttendanceEntity attendance)?  loaded,TResult Function( String message)?  signed,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AttendanceInitialState() when initial != null:
return initial();case AttendanceLoadingState() when loading != null:
return loading();case AttendanceLoadedState() when loaded != null:
return loaded(_that.attendance);case AttendanceSignedState() when signed != null:
return signed(_that.message);case AttendanceErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AttendanceEntity attendance)  loaded,required TResult Function( String message)  signed,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AttendanceInitialState():
return initial();case AttendanceLoadingState():
return loading();case AttendanceLoadedState():
return loaded(_that.attendance);case AttendanceSignedState():
return signed(_that.message);case AttendanceErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AttendanceEntity attendance)?  loaded,TResult? Function( String message)?  signed,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AttendanceInitialState() when initial != null:
return initial();case AttendanceLoadingState() when loading != null:
return loading();case AttendanceLoadedState() when loaded != null:
return loaded(_that.attendance);case AttendanceSignedState() when signed != null:
return signed(_that.message);case AttendanceErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AttendanceInitialState implements AttendanceState {
  const AttendanceInitialState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AttendanceState.initial()';
}


}




/// @nodoc


class AttendanceLoadingState implements AttendanceState {
  const AttendanceLoadingState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AttendanceState.loading()';
}


}




/// @nodoc


class AttendanceLoadedState implements AttendanceState {
  const AttendanceLoadedState({required this.attendance});
  

 final  AttendanceEntity attendance;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceLoadedStateCopyWith<AttendanceLoadedState> get copyWith => _$AttendanceLoadedStateCopyWithImpl<AttendanceLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceLoadedState&&(identical(other.attendance, attendance) || other.attendance == attendance));
}


@override
int get hashCode {
    return Object.hash(runtimeType,attendance);
}

@override
String toString() {
    return 'AttendanceState.loaded(attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class $AttendanceLoadedStateCopyWith<$Res> implements $AttendanceStateCopyWith<$Res> {
  factory $AttendanceLoadedStateCopyWith(AttendanceLoadedState value, $Res Function(AttendanceLoadedState) _then) = _$AttendanceLoadedStateCopyWithImpl;
@useResult
$Res call({
 AttendanceEntity attendance
});


$AttendanceEntityCopyWith<$Res> get attendance;

}
/// @nodoc
class _$AttendanceLoadedStateCopyWithImpl<$Res>
    implements $AttendanceLoadedStateCopyWith<$Res> {
  _$AttendanceLoadedStateCopyWithImpl(this._self, this._then);

  final AttendanceLoadedState _self;
  final $Res Function(AttendanceLoadedState) _then;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attendance = null,}) {
  return _then(AttendanceLoadedState(
attendance: null == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as AttendanceEntity,
  ));
}

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceEntityCopyWith<$Res> get attendance {
  
  return $AttendanceEntityCopyWith<$Res>(_self.attendance, (value) {
    return _then(_self.copyWith(attendance: value));
  });
}
}

/// @nodoc


class AttendanceSignedState implements AttendanceState {
  const AttendanceSignedState({required this.message});
  

 final  String message;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceSignedStateCopyWith<AttendanceSignedState> get copyWith => _$AttendanceSignedStateCopyWithImpl<AttendanceSignedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceSignedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AttendanceState.signed(message: $message)';
}


}

/// @nodoc
abstract mixin class $AttendanceSignedStateCopyWith<$Res> implements $AttendanceStateCopyWith<$Res> {
  factory $AttendanceSignedStateCopyWith(AttendanceSignedState value, $Res Function(AttendanceSignedState) _then) = _$AttendanceSignedStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AttendanceSignedStateCopyWithImpl<$Res>
    implements $AttendanceSignedStateCopyWith<$Res> {
  _$AttendanceSignedStateCopyWithImpl(this._self, this._then);

  final AttendanceSignedState _self;
  final $Res Function(AttendanceSignedState) _then;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AttendanceSignedState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AttendanceErrorState implements AttendanceState {
  const AttendanceErrorState({required this.message});
  

 final  String message;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceErrorStateCopyWith<AttendanceErrorState> get copyWith => _$AttendanceErrorStateCopyWithImpl<AttendanceErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AttendanceState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AttendanceErrorStateCopyWith<$Res> implements $AttendanceStateCopyWith<$Res> {
  factory $AttendanceErrorStateCopyWith(AttendanceErrorState value, $Res Function(AttendanceErrorState) _then) = _$AttendanceErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AttendanceErrorStateCopyWithImpl<$Res>
    implements $AttendanceErrorStateCopyWith<$Res> {
  _$AttendanceErrorStateCopyWithImpl(this._self, this._then);

  final AttendanceErrorState _self;
  final $Res Function(AttendanceErrorState) _then;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AttendanceErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
