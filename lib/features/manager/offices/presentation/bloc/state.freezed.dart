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
mixin _$OfficesState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OfficesState()';
}


}

/// @nodoc
class $OfficesStateCopyWith<$Res>  {
$OfficesStateCopyWith(OfficesState _, $Res Function(OfficesState) __);
}


/// Adds pattern-matching-related methods to [OfficesState].
extension OfficesStatePatterns on OfficesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OfficesInitialState value)?  initial,TResult Function( OfficesLoadingState value)?  loading,TResult Function( OfficesLoadedState value)?  loaded,TResult Function( OfficeDetailsLoadedState value)?  officeDetailsLoaded,TResult Function( OfficesModifiedState value)?  modified,TResult Function( OfficesErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OfficesInitialState() when initial != null:
return initial(_that);case OfficesLoadingState() when loading != null:
return loading(_that);case OfficesLoadedState() when loaded != null:
return loaded(_that);case OfficeDetailsLoadedState() when officeDetailsLoaded != null:
return officeDetailsLoaded(_that);case OfficesModifiedState() when modified != null:
return modified(_that);case OfficesErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OfficesInitialState value)  initial,required TResult Function( OfficesLoadingState value)  loading,required TResult Function( OfficesLoadedState value)  loaded,required TResult Function( OfficeDetailsLoadedState value)  officeDetailsLoaded,required TResult Function( OfficesModifiedState value)  modified,required TResult Function( OfficesErrorState value)  error,}){
final _that = this;
switch (_that) {
case OfficesInitialState():
return initial(_that);case OfficesLoadingState():
return loading(_that);case OfficesLoadedState():
return loaded(_that);case OfficeDetailsLoadedState():
return officeDetailsLoaded(_that);case OfficesModifiedState():
return modified(_that);case OfficesErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OfficesInitialState value)?  initial,TResult? Function( OfficesLoadingState value)?  loading,TResult? Function( OfficesLoadedState value)?  loaded,TResult? Function( OfficeDetailsLoadedState value)?  officeDetailsLoaded,TResult? Function( OfficesModifiedState value)?  modified,TResult? Function( OfficesErrorState value)?  error,}){
final _that = this;
switch (_that) {
case OfficesInitialState() when initial != null:
return initial(_that);case OfficesLoadingState() when loading != null:
return loading(_that);case OfficesLoadedState() when loaded != null:
return loaded(_that);case OfficeDetailsLoadedState() when officeDetailsLoaded != null:
return officeDetailsLoaded(_that);case OfficesModifiedState() when modified != null:
return modified(_that);case OfficesErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( OfficesEntity offices)?  loaded,TResult Function( OfficeDetailsEntity details)?  officeDetailsLoaded,TResult Function( String? message)?  modified,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OfficesInitialState() when initial != null:
return initial();case OfficesLoadingState() when loading != null:
return loading();case OfficesLoadedState() when loaded != null:
return loaded(_that.offices);case OfficeDetailsLoadedState() when officeDetailsLoaded != null:
return officeDetailsLoaded(_that.details);case OfficesModifiedState() when modified != null:
return modified(_that.message);case OfficesErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( OfficesEntity offices)  loaded,required TResult Function( OfficeDetailsEntity details)  officeDetailsLoaded,required TResult Function( String? message)  modified,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case OfficesInitialState():
return initial();case OfficesLoadingState():
return loading();case OfficesLoadedState():
return loaded(_that.offices);case OfficeDetailsLoadedState():
return officeDetailsLoaded(_that.details);case OfficesModifiedState():
return modified(_that.message);case OfficesErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( OfficesEntity offices)?  loaded,TResult? Function( OfficeDetailsEntity details)?  officeDetailsLoaded,TResult? Function( String? message)?  modified,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case OfficesInitialState() when initial != null:
return initial();case OfficesLoadingState() when loading != null:
return loading();case OfficesLoadedState() when loaded != null:
return loaded(_that.offices);case OfficeDetailsLoadedState() when officeDetailsLoaded != null:
return officeDetailsLoaded(_that.details);case OfficesModifiedState() when modified != null:
return modified(_that.message);case OfficesErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class OfficesInitialState implements OfficesState {
  const OfficesInitialState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficesInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OfficesState.initial()';
}


}




/// @nodoc


class OfficesLoadingState implements OfficesState {
  const OfficesLoadingState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficesLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OfficesState.loading()';
}


}




/// @nodoc


class OfficesLoadedState implements OfficesState {
  const OfficesLoadedState({required this.offices});
  

 final  OfficesEntity offices;

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficesLoadedStateCopyWith<OfficesLoadedState> get copyWith => _$OfficesLoadedStateCopyWithImpl<OfficesLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficesLoadedState&&(identical(other.offices, offices) || other.offices == offices));
}


@override
int get hashCode {
    return Object.hash(runtimeType,offices);
}

@override
String toString() {
    return 'OfficesState.loaded(offices: $offices)';
}


}

/// @nodoc
abstract mixin class $OfficesLoadedStateCopyWith<$Res> implements $OfficesStateCopyWith<$Res> {
  factory $OfficesLoadedStateCopyWith(OfficesLoadedState value, $Res Function(OfficesLoadedState) _then) = _$OfficesLoadedStateCopyWithImpl;
@useResult
$Res call({
 OfficesEntity offices
});


$OfficesEntityCopyWith<$Res> get offices;

}
/// @nodoc
class _$OfficesLoadedStateCopyWithImpl<$Res>
    implements $OfficesLoadedStateCopyWith<$Res> {
  _$OfficesLoadedStateCopyWithImpl(this._self, this._then);

  final OfficesLoadedState _self;
  final $Res Function(OfficesLoadedState) _then;

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offices = null,}) {
  return _then(OfficesLoadedState(
offices: null == offices ? _self.offices : offices // ignore: cast_nullable_to_non_nullable
as OfficesEntity,
  ));
}

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficesEntityCopyWith<$Res> get offices {
  
  return $OfficesEntityCopyWith<$Res>(_self.offices, (value) {
    return _then(_self.copyWith(offices: value));
  });
}
}

/// @nodoc


class OfficeDetailsLoadedState implements OfficesState {
  const OfficeDetailsLoadedState({required this.details});
  

 final  OfficeDetailsEntity details;

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficeDetailsLoadedStateCopyWith<OfficeDetailsLoadedState> get copyWith => _$OfficeDetailsLoadedStateCopyWithImpl<OfficeDetailsLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficeDetailsLoadedState&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode {
    return Object.hash(runtimeType,details);
}

@override
String toString() {
    return 'OfficesState.officeDetailsLoaded(details: $details)';
}


}

/// @nodoc
abstract mixin class $OfficeDetailsLoadedStateCopyWith<$Res> implements $OfficesStateCopyWith<$Res> {
  factory $OfficeDetailsLoadedStateCopyWith(OfficeDetailsLoadedState value, $Res Function(OfficeDetailsLoadedState) _then) = _$OfficeDetailsLoadedStateCopyWithImpl;
@useResult
$Res call({
 OfficeDetailsEntity details
});


$OfficeDetailsEntityCopyWith<$Res> get details;

}
/// @nodoc
class _$OfficeDetailsLoadedStateCopyWithImpl<$Res>
    implements $OfficeDetailsLoadedStateCopyWith<$Res> {
  _$OfficeDetailsLoadedStateCopyWithImpl(this._self, this._then);

  final OfficeDetailsLoadedState _self;
  final $Res Function(OfficeDetailsLoadedState) _then;

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? details = null,}) {
  return _then(OfficeDetailsLoadedState(
details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as OfficeDetailsEntity,
  ));
}

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficeDetailsEntityCopyWith<$Res> get details {
  
  return $OfficeDetailsEntityCopyWith<$Res>(_self.details, (value) {
    return _then(_self.copyWith(details: value));
  });
}
}

/// @nodoc


class OfficesModifiedState implements OfficesState {
  const OfficesModifiedState({this.message});
  

 final  String? message;

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficesModifiedStateCopyWith<OfficesModifiedState> get copyWith => _$OfficesModifiedStateCopyWithImpl<OfficesModifiedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficesModifiedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'OfficesState.modified(message: $message)';
}


}

/// @nodoc
abstract mixin class $OfficesModifiedStateCopyWith<$Res> implements $OfficesStateCopyWith<$Res> {
  factory $OfficesModifiedStateCopyWith(OfficesModifiedState value, $Res Function(OfficesModifiedState) _then) = _$OfficesModifiedStateCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$OfficesModifiedStateCopyWithImpl<$Res>
    implements $OfficesModifiedStateCopyWith<$Res> {
  _$OfficesModifiedStateCopyWithImpl(this._self, this._then);

  final OfficesModifiedState _self;
  final $Res Function(OfficesModifiedState) _then;

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(OfficesModifiedState(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OfficesErrorState implements OfficesState {
  const OfficesErrorState({required this.message});
  

 final  String message;

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficesErrorStateCopyWith<OfficesErrorState> get copyWith => _$OfficesErrorStateCopyWithImpl<OfficesErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficesErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'OfficesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $OfficesErrorStateCopyWith<$Res> implements $OfficesStateCopyWith<$Res> {
  factory $OfficesErrorStateCopyWith(OfficesErrorState value, $Res Function(OfficesErrorState) _then) = _$OfficesErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OfficesErrorStateCopyWithImpl<$Res>
    implements $OfficesErrorStateCopyWith<$Res> {
  _$OfficesErrorStateCopyWithImpl(this._self, this._then);

  final OfficesErrorState _self;
  final $Res Function(OfficesErrorState) _then;

/// Create a copy of OfficesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OfficesErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
