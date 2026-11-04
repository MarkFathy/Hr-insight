// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_leaves_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManagerLeavesState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerLeavesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ManagerLeavesState()';
}


}

/// @nodoc
class $ManagerLeavesStateCopyWith<$Res>  {
$ManagerLeavesStateCopyWith(ManagerLeavesState _, $Res Function(ManagerLeavesState) __);
}


/// Adds pattern-matching-related methods to [ManagerLeavesState].
extension ManagerLeavesStatePatterns on ManagerLeavesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ManagerLeavesInitialState value)?  initial,TResult Function( ManagerLeavesLoadingState value)?  loading,TResult Function( ManagerLeavesLoadedState value)?  loaded,TResult Function( ManagerLeaveSentState value)?  sent,TResult Function( LeavesErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ManagerLeavesInitialState() when initial != null:
return initial(_that);case ManagerLeavesLoadingState() when loading != null:
return loading(_that);case ManagerLeavesLoadedState() when loaded != null:
return loaded(_that);case ManagerLeaveSentState() when sent != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ManagerLeavesInitialState value)  initial,required TResult Function( ManagerLeavesLoadingState value)  loading,required TResult Function( ManagerLeavesLoadedState value)  loaded,required TResult Function( ManagerLeaveSentState value)  sent,required TResult Function( LeavesErrorState value)  error,}){
final _that = this;
switch (_that) {
case ManagerLeavesInitialState():
return initial(_that);case ManagerLeavesLoadingState():
return loading(_that);case ManagerLeavesLoadedState():
return loaded(_that);case ManagerLeaveSentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ManagerLeavesInitialState value)?  initial,TResult? Function( ManagerLeavesLoadingState value)?  loading,TResult? Function( ManagerLeavesLoadedState value)?  loaded,TResult? Function( ManagerLeaveSentState value)?  sent,TResult? Function( LeavesErrorState value)?  error,}){
final _that = this;
switch (_that) {
case ManagerLeavesInitialState() when initial != null:
return initial(_that);case ManagerLeavesLoadingState() when loading != null:
return loading(_that);case ManagerLeavesLoadedState() when loaded != null:
return loaded(_that);case ManagerLeaveSentState() when sent != null:
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
case ManagerLeavesInitialState() when initial != null:
return initial();case ManagerLeavesLoadingState() when loading != null:
return loading();case ManagerLeavesLoadedState() when loaded != null:
return loaded(_that.leaves);case ManagerLeaveSentState() when sent != null:
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
case ManagerLeavesInitialState():
return initial();case ManagerLeavesLoadingState():
return loading();case ManagerLeavesLoadedState():
return loaded(_that.leaves);case ManagerLeaveSentState():
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
case ManagerLeavesInitialState() when initial != null:
return initial();case ManagerLeavesLoadingState() when loading != null:
return loading();case ManagerLeavesLoadedState() when loaded != null:
return loaded(_that.leaves);case ManagerLeaveSentState() when sent != null:
return sent();case LeavesErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ManagerLeavesInitialState implements ManagerLeavesState {
  const ManagerLeavesInitialState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerLeavesInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ManagerLeavesState.initial()';
}


}




/// @nodoc


class ManagerLeavesLoadingState implements ManagerLeavesState {
  const ManagerLeavesLoadingState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerLeavesLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ManagerLeavesState.loading()';
}


}




/// @nodoc


class ManagerLeavesLoadedState implements ManagerLeavesState {
  const ManagerLeavesLoadedState({required this.leaves});
  

 final  LeavesEntity leaves;

/// Create a copy of ManagerLeavesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerLeavesLoadedStateCopyWith<ManagerLeavesLoadedState> get copyWith => _$ManagerLeavesLoadedStateCopyWithImpl<ManagerLeavesLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerLeavesLoadedState&&(identical(other.leaves, leaves) || other.leaves == leaves));
}


@override
int get hashCode {
    return Object.hash(runtimeType,leaves);
}

@override
String toString() {
    return 'ManagerLeavesState.loaded(leaves: $leaves)';
}


}

/// @nodoc
abstract mixin class $ManagerLeavesLoadedStateCopyWith<$Res> implements $ManagerLeavesStateCopyWith<$Res> {
  factory $ManagerLeavesLoadedStateCopyWith(ManagerLeavesLoadedState value, $Res Function(ManagerLeavesLoadedState) _then) = _$ManagerLeavesLoadedStateCopyWithImpl;
@useResult
$Res call({
 LeavesEntity leaves
});


$LeavesEntityCopyWith<$Res> get leaves;

}
/// @nodoc
class _$ManagerLeavesLoadedStateCopyWithImpl<$Res>
    implements $ManagerLeavesLoadedStateCopyWith<$Res> {
  _$ManagerLeavesLoadedStateCopyWithImpl(this._self, this._then);

  final ManagerLeavesLoadedState _self;
  final $Res Function(ManagerLeavesLoadedState) _then;

/// Create a copy of ManagerLeavesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? leaves = null,}) {
  return _then(ManagerLeavesLoadedState(
leaves: null == leaves ? _self.leaves : leaves // ignore: cast_nullable_to_non_nullable
as LeavesEntity,
  ));
}

/// Create a copy of ManagerLeavesState
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


class ManagerLeaveSentState implements ManagerLeavesState {
  const ManagerLeaveSentState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerLeaveSentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ManagerLeavesState.sent()';
}


}




/// @nodoc


class LeavesErrorState implements ManagerLeavesState {
  const LeavesErrorState({required this.message});
  

 final  String message;

/// Create a copy of ManagerLeavesState
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
    return 'ManagerLeavesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LeavesErrorStateCopyWith<$Res> implements $ManagerLeavesStateCopyWith<$Res> {
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

/// Create a copy of ManagerLeavesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LeavesErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
