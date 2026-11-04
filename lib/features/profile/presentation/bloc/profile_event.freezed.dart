// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetProfileEvent value)?  getProfile,TResult Function( UpdateProfileEvent value)?  updateProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetProfileEvent() when getProfile != null:
return getProfile(_that);case UpdateProfileEvent() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetProfileEvent value)  getProfile,required TResult Function( UpdateProfileEvent value)  updateProfile,}){
final _that = this;
switch (_that) {
case GetProfileEvent():
return getProfile(_that);case UpdateProfileEvent():
return updateProfile(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetProfileEvent value)?  getProfile,TResult? Function( UpdateProfileEvent value)?  updateProfile,}){
final _that = this;
switch (_that) {
case GetProfileEvent() when getProfile != null:
return getProfile(_that);case UpdateProfileEvent() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isEmployee)?  getProfile,TResult Function( UpdateProfileParams params)?  updateProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetProfileEvent() when getProfile != null:
return getProfile(_that.isEmployee);case UpdateProfileEvent() when updateProfile != null:
return updateProfile(_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isEmployee)  getProfile,required TResult Function( UpdateProfileParams params)  updateProfile,}) {final _that = this;
switch (_that) {
case GetProfileEvent():
return getProfile(_that.isEmployee);case UpdateProfileEvent():
return updateProfile(_that.params);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isEmployee)?  getProfile,TResult? Function( UpdateProfileParams params)?  updateProfile,}) {final _that = this;
switch (_that) {
case GetProfileEvent() when getProfile != null:
return getProfile(_that.isEmployee);case UpdateProfileEvent() when updateProfile != null:
return updateProfile(_that.params);case _:
  return null;

}
}

}

/// @nodoc


class GetProfileEvent implements ProfileEvent {
  const GetProfileEvent({required this.isEmployee});
  

 final  bool isEmployee;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProfileEventCopyWith<GetProfileEvent> get copyWith => _$GetProfileEventCopyWithImpl<GetProfileEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProfileEvent&&(identical(other.isEmployee, isEmployee) || other.isEmployee == isEmployee));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isEmployee);
}

@override
String toString() {
    return 'ProfileEvent.getProfile(isEmployee: $isEmployee)';
}


}

/// @nodoc
abstract mixin class $GetProfileEventCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $GetProfileEventCopyWith(GetProfileEvent value, $Res Function(GetProfileEvent) _then) = _$GetProfileEventCopyWithImpl;
@useResult
$Res call({
 bool isEmployee
});




}
/// @nodoc
class _$GetProfileEventCopyWithImpl<$Res>
    implements $GetProfileEventCopyWith<$Res> {
  _$GetProfileEventCopyWithImpl(this._self, this._then);

  final GetProfileEvent _self;
  final $Res Function(GetProfileEvent) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isEmployee = null,}) {
  return _then(GetProfileEvent(
isEmployee: null == isEmployee ? _self.isEmployee : isEmployee // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class UpdateProfileEvent implements ProfileEvent {
  const UpdateProfileEvent(this.params);
  

 final  UpdateProfileParams params;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileEventCopyWith<UpdateProfileEvent> get copyWith => _$UpdateProfileEventCopyWithImpl<UpdateProfileEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileEvent&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode {
    return Object.hash(runtimeType,params);
}

@override
String toString() {
    return 'ProfileEvent.updateProfile(params: $params)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileEventCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UpdateProfileEventCopyWith(UpdateProfileEvent value, $Res Function(UpdateProfileEvent) _then) = _$UpdateProfileEventCopyWithImpl;
@useResult
$Res call({
 UpdateProfileParams params
});


$UpdateProfileParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$UpdateProfileEventCopyWithImpl<$Res>
    implements $UpdateProfileEventCopyWith<$Res> {
  _$UpdateProfileEventCopyWithImpl(this._self, this._then);

  final UpdateProfileEvent _self;
  final $Res Function(UpdateProfileEvent) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(UpdateProfileEvent(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as UpdateProfileParams,
  ));
}

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateProfileParamsCopyWith<$Res> get params {
  
  return $UpdateProfileParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

// dart format on
