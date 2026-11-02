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
mixin _$DepartmentsAndJobsState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsAndJobsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DepartmentsAndJobsState()';
}


}

/// @nodoc
class $DepartmentsAndJobsStateCopyWith<$Res>  {
$DepartmentsAndJobsStateCopyWith(DepartmentsAndJobsState _, $Res Function(DepartmentsAndJobsState) __);
}


/// Adds pattern-matching-related methods to [DepartmentsAndJobsState].
extension DepartmentsAndJobsStatePatterns on DepartmentsAndJobsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DepartmentsInitialState value)?  initial,TResult Function( DepartmentsLoadingState value)?  loading,TResult Function( DepartmentsLoadedState value)?  loaded,TResult Function( DepartmentsModifiedState value)?  modified,TResult Function( DepartmentsErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DepartmentsInitialState() when initial != null:
return initial(_that);case DepartmentsLoadingState() when loading != null:
return loading(_that);case DepartmentsLoadedState() when loaded != null:
return loaded(_that);case DepartmentsModifiedState() when modified != null:
return modified(_that);case DepartmentsErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DepartmentsInitialState value)  initial,required TResult Function( DepartmentsLoadingState value)  loading,required TResult Function( DepartmentsLoadedState value)  loaded,required TResult Function( DepartmentsModifiedState value)  modified,required TResult Function( DepartmentsErrorState value)  error,}){
final _that = this;
switch (_that) {
case DepartmentsInitialState():
return initial(_that);case DepartmentsLoadingState():
return loading(_that);case DepartmentsLoadedState():
return loaded(_that);case DepartmentsModifiedState():
return modified(_that);case DepartmentsErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DepartmentsInitialState value)?  initial,TResult? Function( DepartmentsLoadingState value)?  loading,TResult? Function( DepartmentsLoadedState value)?  loaded,TResult? Function( DepartmentsModifiedState value)?  modified,TResult? Function( DepartmentsErrorState value)?  error,}){
final _that = this;
switch (_that) {
case DepartmentsInitialState() when initial != null:
return initial(_that);case DepartmentsLoadingState() when loading != null:
return loading(_that);case DepartmentsLoadedState() when loaded != null:
return loaded(_that);case DepartmentsModifiedState() when modified != null:
return modified(_that);case DepartmentsErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DepartmentsEntity departments)?  loaded,TResult Function( String? message)?  modified,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DepartmentsInitialState() when initial != null:
return initial();case DepartmentsLoadingState() when loading != null:
return loading();case DepartmentsLoadedState() when loaded != null:
return loaded(_that.departments);case DepartmentsModifiedState() when modified != null:
return modified(_that.message);case DepartmentsErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DepartmentsEntity departments)  loaded,required TResult Function( String? message)  modified,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DepartmentsInitialState():
return initial();case DepartmentsLoadingState():
return loading();case DepartmentsLoadedState():
return loaded(_that.departments);case DepartmentsModifiedState():
return modified(_that.message);case DepartmentsErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DepartmentsEntity departments)?  loaded,TResult? Function( String? message)?  modified,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DepartmentsInitialState() when initial != null:
return initial();case DepartmentsLoadingState() when loading != null:
return loading();case DepartmentsLoadedState() when loaded != null:
return loaded(_that.departments);case DepartmentsModifiedState() when modified != null:
return modified(_that.message);case DepartmentsErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DepartmentsInitialState implements DepartmentsAndJobsState {
  const DepartmentsInitialState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DepartmentsAndJobsState.initial()';
}


}




/// @nodoc


class DepartmentsLoadingState implements DepartmentsAndJobsState {
  const DepartmentsLoadingState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DepartmentsAndJobsState.loading()';
}


}




/// @nodoc


class DepartmentsLoadedState implements DepartmentsAndJobsState {
  const DepartmentsLoadedState({required this.departments});
  

 final  DepartmentsEntity departments;

/// Create a copy of DepartmentsAndJobsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentsLoadedStateCopyWith<DepartmentsLoadedState> get copyWith => _$DepartmentsLoadedStateCopyWithImpl<DepartmentsLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsLoadedState&&(identical(other.departments, departments) || other.departments == departments));
}


@override
int get hashCode {
    return Object.hash(runtimeType,departments);
}

@override
String toString() {
    return 'DepartmentsAndJobsState.loaded(departments: $departments)';
}


}

/// @nodoc
abstract mixin class $DepartmentsLoadedStateCopyWith<$Res> implements $DepartmentsAndJobsStateCopyWith<$Res> {
  factory $DepartmentsLoadedStateCopyWith(DepartmentsLoadedState value, $Res Function(DepartmentsLoadedState) _then) = _$DepartmentsLoadedStateCopyWithImpl;
@useResult
$Res call({
 DepartmentsEntity departments
});


$DepartmentsEntityCopyWith<$Res> get departments;

}
/// @nodoc
class _$DepartmentsLoadedStateCopyWithImpl<$Res>
    implements $DepartmentsLoadedStateCopyWith<$Res> {
  _$DepartmentsLoadedStateCopyWithImpl(this._self, this._then);

  final DepartmentsLoadedState _self;
  final $Res Function(DepartmentsLoadedState) _then;

/// Create a copy of DepartmentsAndJobsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? departments = null,}) {
  return _then(DepartmentsLoadedState(
departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as DepartmentsEntity,
  ));
}

/// Create a copy of DepartmentsAndJobsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartmentsEntityCopyWith<$Res> get departments {
  
  return $DepartmentsEntityCopyWith<$Res>(_self.departments, (value) {
    return _then(_self.copyWith(departments: value));
  });
}
}

/// @nodoc


class DepartmentsModifiedState implements DepartmentsAndJobsState {
  const DepartmentsModifiedState({this.message});
  

 final  String? message;

/// Create a copy of DepartmentsAndJobsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentsModifiedStateCopyWith<DepartmentsModifiedState> get copyWith => _$DepartmentsModifiedStateCopyWithImpl<DepartmentsModifiedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsModifiedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'DepartmentsAndJobsState.modified(message: $message)';
}


}

/// @nodoc
abstract mixin class $DepartmentsModifiedStateCopyWith<$Res> implements $DepartmentsAndJobsStateCopyWith<$Res> {
  factory $DepartmentsModifiedStateCopyWith(DepartmentsModifiedState value, $Res Function(DepartmentsModifiedState) _then) = _$DepartmentsModifiedStateCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$DepartmentsModifiedStateCopyWithImpl<$Res>
    implements $DepartmentsModifiedStateCopyWith<$Res> {
  _$DepartmentsModifiedStateCopyWithImpl(this._self, this._then);

  final DepartmentsModifiedState _self;
  final $Res Function(DepartmentsModifiedState) _then;

/// Create a copy of DepartmentsAndJobsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(DepartmentsModifiedState(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DepartmentsErrorState implements DepartmentsAndJobsState {
  const DepartmentsErrorState({required this.message});
  

 final  String message;

/// Create a copy of DepartmentsAndJobsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentsErrorStateCopyWith<DepartmentsErrorState> get copyWith => _$DepartmentsErrorStateCopyWithImpl<DepartmentsErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'DepartmentsAndJobsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DepartmentsErrorStateCopyWith<$Res> implements $DepartmentsAndJobsStateCopyWith<$Res> {
  factory $DepartmentsErrorStateCopyWith(DepartmentsErrorState value, $Res Function(DepartmentsErrorState) _then) = _$DepartmentsErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DepartmentsErrorStateCopyWithImpl<$Res>
    implements $DepartmentsErrorStateCopyWith<$Res> {
  _$DepartmentsErrorStateCopyWithImpl(this._self, this._then);

  final DepartmentsErrorState _self;
  final $Res Function(DepartmentsErrorState) _then;

/// Create a copy of DepartmentsAndJobsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DepartmentsErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
