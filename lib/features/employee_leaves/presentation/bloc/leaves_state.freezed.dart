// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaves_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeavesState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesState()';
}


}

/// @nodoc
class $LeavesStateCopyWith<$Res>  {
$LeavesStateCopyWith(LeavesState _, $Res Function(LeavesState) __);
}


/// Adds pattern-matching-related methods to [LeavesState].
extension LeavesStatePatterns on LeavesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LeavesInitialState value)?  initial,TResult Function( LeavesLoadingState value)?  loading,TResult Function( LeavesLoadedState value)?  loaded,TResult Function( LeaveSentState value)?  sent,TResult Function( LeavesErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LeavesInitialState() when initial != null:
return initial(_that);case LeavesLoadingState() when loading != null:
return loading(_that);case LeavesLoadedState() when loaded != null:
return loaded(_that);case LeaveSentState() when sent != null:
return sent(_that);case LeavesErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LeavesInitialState value)  initial,required TResult Function( LeavesLoadingState value)  loading,required TResult Function( LeavesLoadedState value)  loaded,required TResult Function( LeaveSentState value)  sent,required TResult Function( LeavesErrorState value)  error,}){
final _that = this;
switch (_that) {
case LeavesInitialState():
return initial(_that);case LeavesLoadingState():
return loading(_that);case LeavesLoadedState():
return loaded(_that);case LeaveSentState():
return sent(_that);case LeavesErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LeavesInitialState value)?  initial,TResult? Function( LeavesLoadingState value)?  loading,TResult? Function( LeavesLoadedState value)?  loaded,TResult? Function( LeaveSentState value)?  sent,TResult? Function( LeavesErrorState value)?  error,}){
final _that = this;
switch (_that) {
case LeavesInitialState() when initial != null:
return initial(_that);case LeavesLoadingState() when loading != null:
return loading(_that);case LeavesLoadedState() when loaded != null:
return loaded(_that);case LeaveSentState() when sent != null:
return sent(_that);case LeavesErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( LeavesEntity leaves)?  loaded,TResult Function()?  sent,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LeavesInitialState() when initial != null:
return initial();case LeavesLoadingState() when loading != null:
return loading();case LeavesLoadedState() when loaded != null:
return loaded(_that.leaves);case LeaveSentState() when sent != null:
return sent();case LeavesErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( LeavesEntity leaves)  loaded,required TResult Function()  sent,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LeavesInitialState():
return initial();case LeavesLoadingState():
return loading();case LeavesLoadedState():
return loaded(_that.leaves);case LeaveSentState():
return sent();case LeavesErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( LeavesEntity leaves)?  loaded,TResult? Function()?  sent,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LeavesInitialState() when initial != null:
return initial();case LeavesLoadingState() when loading != null:
return loading();case LeavesLoadedState() when loaded != null:
return loaded(_that.leaves);case LeaveSentState() when sent != null:
return sent();case LeavesErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LeavesInitialState implements LeavesState {
  const LeavesInitialState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesState.initial()';
}


}




/// @nodoc


class LeavesLoadingState implements LeavesState {
  const LeavesLoadingState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesState.loading()';
}


}




/// @nodoc


class LeavesLoadedState implements LeavesState {
  const LeavesLoadedState({required this.leaves});
  

 final  LeavesEntity leaves;

/// Create a copy of LeavesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeavesLoadedStateCopyWith<LeavesLoadedState> get copyWith => _$LeavesLoadedStateCopyWithImpl<LeavesLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesLoadedState&&(identical(other.leaves, leaves) || other.leaves == leaves));
}


@override
int get hashCode {
    return Object.hash(runtimeType,leaves);
}

@override
String toString() {
    return 'LeavesState.loaded(leaves: $leaves)';
}


}

/// @nodoc
abstract mixin class $LeavesLoadedStateCopyWith<$Res> implements $LeavesStateCopyWith<$Res> {
  factory $LeavesLoadedStateCopyWith(LeavesLoadedState value, $Res Function(LeavesLoadedState) _then) = _$LeavesLoadedStateCopyWithImpl;
@useResult
$Res call({
 LeavesEntity leaves
});


$LeavesEntityCopyWith<$Res> get leaves;

}
/// @nodoc
class _$LeavesLoadedStateCopyWithImpl<$Res>
    implements $LeavesLoadedStateCopyWith<$Res> {
  _$LeavesLoadedStateCopyWithImpl(this._self, this._then);

  final LeavesLoadedState _self;
  final $Res Function(LeavesLoadedState) _then;

/// Create a copy of LeavesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? leaves = null,}) {
  return _then(LeavesLoadedState(
leaves: null == leaves ? _self.leaves : leaves // ignore: cast_nullable_to_non_nullable
as LeavesEntity,
  ));
}

/// Create a copy of LeavesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeavesEntityCopyWith<$Res> get leaves {
  
  return $LeavesEntityCopyWith<$Res>(_self.leaves, (value) {
    return _then(_self.copyWith(leaves: value));
  });
}
}

/// @nodoc


class LeaveSentState implements LeavesState {
  const LeaveSentState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveSentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesState.sent()';
}


}




/// @nodoc


class LeavesErrorState implements LeavesState {
  const LeavesErrorState({required this.message});
  

 final  String message;

/// Create a copy of LeavesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeavesErrorStateCopyWith<LeavesErrorState> get copyWith => _$LeavesErrorStateCopyWithImpl<LeavesErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'LeavesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LeavesErrorStateCopyWith<$Res> implements $LeavesStateCopyWith<$Res> {
  factory $LeavesErrorStateCopyWith(LeavesErrorState value, $Res Function(LeavesErrorState) _then) = _$LeavesErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LeavesErrorStateCopyWithImpl<$Res>
    implements $LeavesErrorStateCopyWith<$Res> {
  _$LeavesErrorStateCopyWithImpl(this._self, this._then);

  final LeavesErrorState _self;
  final $Res Function(LeavesErrorState) _then;

/// Create a copy of LeavesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LeavesErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
