// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employees_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeesState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmployeesState()';
}


}

/// @nodoc
class $EmployeesStateCopyWith<$Res>  {
$EmployeesStateCopyWith(EmployeesState _, $Res Function(EmployeesState) __);
}


/// Adds pattern-matching-related methods to [EmployeesState].
extension EmployeesStatePatterns on EmployeesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EmployeesInitialState value)?  initial,TResult Function( EmployeesLoadingState value)?  loading,TResult Function( EmployeesLoadedState value)?  loaded,TResult Function( EmployeesModifiedState value)?  modified,TResult Function( EmployeesErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EmployeesInitialState() when initial != null:
return initial(_that);case EmployeesLoadingState() when loading != null:
return loading(_that);case EmployeesLoadedState() when loaded != null:
return loaded(_that);case EmployeesModifiedState() when modified != null:
return modified(_that);case EmployeesErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EmployeesInitialState value)  initial,required TResult Function( EmployeesLoadingState value)  loading,required TResult Function( EmployeesLoadedState value)  loaded,required TResult Function( EmployeesModifiedState value)  modified,required TResult Function( EmployeesErrorState value)  error,}){
final _that = this;
switch (_that) {
case EmployeesInitialState():
return initial(_that);case EmployeesLoadingState():
return loading(_that);case EmployeesLoadedState():
return loaded(_that);case EmployeesModifiedState():
return modified(_that);case EmployeesErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EmployeesInitialState value)?  initial,TResult? Function( EmployeesLoadingState value)?  loading,TResult? Function( EmployeesLoadedState value)?  loaded,TResult? Function( EmployeesModifiedState value)?  modified,TResult? Function( EmployeesErrorState value)?  error,}){
final _that = this;
switch (_that) {
case EmployeesInitialState() when initial != null:
return initial(_that);case EmployeesLoadingState() when loading != null:
return loading(_that);case EmployeesLoadedState() when loaded != null:
return loaded(_that);case EmployeesModifiedState() when modified != null:
return modified(_that);case EmployeesErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( EmployeesEntity employees)?  loaded,TResult Function( String? message)?  modified,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EmployeesInitialState() when initial != null:
return initial();case EmployeesLoadingState() when loading != null:
return loading();case EmployeesLoadedState() when loaded != null:
return loaded(_that.employees);case EmployeesModifiedState() when modified != null:
return modified(_that.message);case EmployeesErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( EmployeesEntity employees)  loaded,required TResult Function( String? message)  modified,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case EmployeesInitialState():
return initial();case EmployeesLoadingState():
return loading();case EmployeesLoadedState():
return loaded(_that.employees);case EmployeesModifiedState():
return modified(_that.message);case EmployeesErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( EmployeesEntity employees)?  loaded,TResult? Function( String? message)?  modified,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case EmployeesInitialState() when initial != null:
return initial();case EmployeesLoadingState() when loading != null:
return loading();case EmployeesLoadedState() when loaded != null:
return loaded(_that.employees);case EmployeesModifiedState() when modified != null:
return modified(_that.message);case EmployeesErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class EmployeesInitialState implements EmployeesState {
  const EmployeesInitialState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeesInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmployeesState.initial()';
}


}




/// @nodoc


class EmployeesLoadingState implements EmployeesState {
  const EmployeesLoadingState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeesLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmployeesState.loading()';
}


}




/// @nodoc


class EmployeesLoadedState implements EmployeesState {
  const EmployeesLoadedState({required this.employees});
  

 final  EmployeesEntity employees;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeesLoadedStateCopyWith<EmployeesLoadedState> get copyWith => _$EmployeesLoadedStateCopyWithImpl<EmployeesLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeesLoadedState&&(identical(other.employees, employees) || other.employees == employees));
}


@override
int get hashCode {
    return Object.hash(runtimeType,employees);
}

@override
String toString() {
    return 'EmployeesState.loaded(employees: $employees)';
}


}

/// @nodoc
abstract mixin class $EmployeesLoadedStateCopyWith<$Res> implements $EmployeesStateCopyWith<$Res> {
  factory $EmployeesLoadedStateCopyWith(EmployeesLoadedState value, $Res Function(EmployeesLoadedState) _then) = _$EmployeesLoadedStateCopyWithImpl;
@useResult
$Res call({
 EmployeesEntity employees
});


$EmployeesEntityCopyWith<$Res> get employees;

}
/// @nodoc
class _$EmployeesLoadedStateCopyWithImpl<$Res>
    implements $EmployeesLoadedStateCopyWith<$Res> {
  _$EmployeesLoadedStateCopyWithImpl(this._self, this._then);

  final EmployeesLoadedState _self;
  final $Res Function(EmployeesLoadedState) _then;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employees = null,}) {
  return _then(EmployeesLoadedState(
employees: null == employees ? _self.employees : employees // ignore: cast_nullable_to_non_nullable
as EmployeesEntity,
  ));
}

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeesEntityCopyWith<$Res> get employees {
  
  return $EmployeesEntityCopyWith<$Res>(_self.employees, (value) {
    return _then(_self.copyWith(employees: value));
  });
}
}

/// @nodoc


class EmployeesModifiedState implements EmployeesState {
  const EmployeesModifiedState({this.message});
  

 final  String? message;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeesModifiedStateCopyWith<EmployeesModifiedState> get copyWith => _$EmployeesModifiedStateCopyWithImpl<EmployeesModifiedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeesModifiedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'EmployeesState.modified(message: $message)';
}


}

/// @nodoc
abstract mixin class $EmployeesModifiedStateCopyWith<$Res> implements $EmployeesStateCopyWith<$Res> {
  factory $EmployeesModifiedStateCopyWith(EmployeesModifiedState value, $Res Function(EmployeesModifiedState) _then) = _$EmployeesModifiedStateCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$EmployeesModifiedStateCopyWithImpl<$Res>
    implements $EmployeesModifiedStateCopyWith<$Res> {
  _$EmployeesModifiedStateCopyWithImpl(this._self, this._then);

  final EmployeesModifiedState _self;
  final $Res Function(EmployeesModifiedState) _then;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(EmployeesModifiedState(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class EmployeesErrorState implements EmployeesState {
  const EmployeesErrorState({required this.message});
  

 final  String message;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeesErrorStateCopyWith<EmployeesErrorState> get copyWith => _$EmployeesErrorStateCopyWithImpl<EmployeesErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeesErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'EmployeesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $EmployeesErrorStateCopyWith<$Res> implements $EmployeesStateCopyWith<$Res> {
  factory $EmployeesErrorStateCopyWith(EmployeesErrorState value, $Res Function(EmployeesErrorState) _then) = _$EmployeesErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$EmployeesErrorStateCopyWithImpl<$Res>
    implements $EmployeesErrorStateCopyWith<$Res> {
  _$EmployeesErrorStateCopyWithImpl(this._self, this._then);

  final EmployeesErrorState _self;
  final $Res Function(EmployeesErrorState) _then;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(EmployeesErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
