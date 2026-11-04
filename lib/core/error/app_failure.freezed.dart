// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppFailure {

 String get message;
/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppFailureCopyWith<AppFailure> get copyWith => _$AppFailureCopyWithImpl<AppFailure>(this as AppFailure, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AppFailure;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppFailure&&(identical(other.message, _this.message) || other.message == _this.message));
}


@override
int get hashCode {
  final _this = this as AppFailure;
  return Object.hash(runtimeType,_this.message);
}

@override
String toString() {
  final _this = this as AppFailure;
  return 'AppFailure(message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $AppFailureCopyWith<$Res>  {
  factory $AppFailureCopyWith(AppFailure value, $Res Function(AppFailure) _then) = _$AppFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AppFailureCopyWithImpl<$Res>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._self, this._then);

  final AppFailure _self;
  final $Res Function(AppFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppFailure].
extension AppFailurePatterns on AppFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OfflineFailure value)?  offline,TResult Function( ServerFailure value)?  server,TResult Function( UnauthorizedFailure value)?  unauthorized,TResult Function( EmptyCacheFailure value)?  emptyCache,TResult Function( LocationFailure value)?  location,TResult Function( FingerprintFailure value)?  fingerprint,TResult Function( UnexpectedFailure value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OfflineFailure() when offline != null:
return offline(_that);case ServerFailure() when server != null:
return server(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case EmptyCacheFailure() when emptyCache != null:
return emptyCache(_that);case LocationFailure() when location != null:
return location(_that);case FingerprintFailure() when fingerprint != null:
return fingerprint(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OfflineFailure value)  offline,required TResult Function( ServerFailure value)  server,required TResult Function( UnauthorizedFailure value)  unauthorized,required TResult Function( EmptyCacheFailure value)  emptyCache,required TResult Function( LocationFailure value)  location,required TResult Function( FingerprintFailure value)  fingerprint,required TResult Function( UnexpectedFailure value)  unexpected,}){
final _that = this;
switch (_that) {
case OfflineFailure():
return offline(_that);case ServerFailure():
return server(_that);case UnauthorizedFailure():
return unauthorized(_that);case EmptyCacheFailure():
return emptyCache(_that);case LocationFailure():
return location(_that);case FingerprintFailure():
return fingerprint(_that);case UnexpectedFailure():
return unexpected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OfflineFailure value)?  offline,TResult? Function( ServerFailure value)?  server,TResult? Function( UnauthorizedFailure value)?  unauthorized,TResult? Function( EmptyCacheFailure value)?  emptyCache,TResult? Function( LocationFailure value)?  location,TResult? Function( FingerprintFailure value)?  fingerprint,TResult? Function( UnexpectedFailure value)?  unexpected,}){
final _that = this;
switch (_that) {
case OfflineFailure() when offline != null:
return offline(_that);case ServerFailure() when server != null:
return server(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case EmptyCacheFailure() when emptyCache != null:
return emptyCache(_that);case LocationFailure() when location != null:
return location(_that);case FingerprintFailure() when fingerprint != null:
return fingerprint(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  offline,TResult Function( String message,  int? statusCode)?  server,TResult Function( String message)?  unauthorized,TResult Function( String message)?  emptyCache,TResult Function( String message)?  location,TResult Function( String message)?  fingerprint,TResult Function( String message)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OfflineFailure() when offline != null:
return offline(_that.message);case ServerFailure() when server != null:
return server(_that.message,_that.statusCode);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message);case EmptyCacheFailure() when emptyCache != null:
return emptyCache(_that.message);case LocationFailure() when location != null:
return location(_that.message);case FingerprintFailure() when fingerprint != null:
return fingerprint(_that.message);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  offline,required TResult Function( String message,  int? statusCode)  server,required TResult Function( String message)  unauthorized,required TResult Function( String message)  emptyCache,required TResult Function( String message)  location,required TResult Function( String message)  fingerprint,required TResult Function( String message)  unexpected,}) {final _that = this;
switch (_that) {
case OfflineFailure():
return offline(_that.message);case ServerFailure():
return server(_that.message,_that.statusCode);case UnauthorizedFailure():
return unauthorized(_that.message);case EmptyCacheFailure():
return emptyCache(_that.message);case LocationFailure():
return location(_that.message);case FingerprintFailure():
return fingerprint(_that.message);case UnexpectedFailure():
return unexpected(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  offline,TResult? Function( String message,  int? statusCode)?  server,TResult? Function( String message)?  unauthorized,TResult? Function( String message)?  emptyCache,TResult? Function( String message)?  location,TResult? Function( String message)?  fingerprint,TResult? Function( String message)?  unexpected,}) {final _that = this;
switch (_that) {
case OfflineFailure() when offline != null:
return offline(_that.message);case ServerFailure() when server != null:
return server(_that.message,_that.statusCode);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message);case EmptyCacheFailure() when emptyCache != null:
return emptyCache(_that.message);case LocationFailure() when location != null:
return location(_that.message);case FingerprintFailure() when fingerprint != null:
return fingerprint(_that.message);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class OfflineFailure implements AppFailure {
  const OfflineFailure({this.message = 'No internet connection'});
  

@override@JsonKey() final  String message;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineFailureCopyWith<OfflineFailure> get copyWith => _$OfflineFailureCopyWithImpl<OfflineFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AppFailure.offline(message: $message)';
}


}

/// @nodoc
abstract mixin class $OfflineFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $OfflineFailureCopyWith(OfflineFailure value, $Res Function(OfflineFailure) _then) = _$OfflineFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OfflineFailureCopyWithImpl<$Res>
    implements $OfflineFailureCopyWith<$Res> {
  _$OfflineFailureCopyWithImpl(this._self, this._then);

  final OfflineFailure _self;
  final $Res Function(OfflineFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OfflineFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServerFailure implements AppFailure {
  const ServerFailure({required this.message, this.statusCode});
  

@override final  String message;
 final  int? statusCode;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message,statusCode);
}

@override
String toString() {
    return 'AppFailure.server(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,}) {
  return _then(ServerFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class UnauthorizedFailure implements AppFailure {
  const UnauthorizedFailure({this.message = 'Unauthorized access'});
  

@override@JsonKey() final  String message;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedFailureCopyWith<UnauthorizedFailure> get copyWith => _$UnauthorizedFailureCopyWithImpl<UnauthorizedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AppFailure.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $UnauthorizedFailureCopyWith(UnauthorizedFailure value, $Res Function(UnauthorizedFailure) _then) = _$UnauthorizedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnauthorizedFailureCopyWithImpl<$Res>
    implements $UnauthorizedFailureCopyWith<$Res> {
  _$UnauthorizedFailureCopyWithImpl(this._self, this._then);

  final UnauthorizedFailure _self;
  final $Res Function(UnauthorizedFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnauthorizedFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EmptyCacheFailure implements AppFailure {
  const EmptyCacheFailure({this.message = 'No cached data available'});
  

@override@JsonKey() final  String message;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmptyCacheFailureCopyWith<EmptyCacheFailure> get copyWith => _$EmptyCacheFailureCopyWithImpl<EmptyCacheFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyCacheFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AppFailure.emptyCache(message: $message)';
}


}

/// @nodoc
abstract mixin class $EmptyCacheFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $EmptyCacheFailureCopyWith(EmptyCacheFailure value, $Res Function(EmptyCacheFailure) _then) = _$EmptyCacheFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$EmptyCacheFailureCopyWithImpl<$Res>
    implements $EmptyCacheFailureCopyWith<$Res> {
  _$EmptyCacheFailureCopyWithImpl(this._self, this._then);

  final EmptyCacheFailure _self;
  final $Res Function(EmptyCacheFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(EmptyCacheFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LocationFailure implements AppFailure {
  const LocationFailure({required this.message});
  

@override final  String message;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationFailureCopyWith<LocationFailure> get copyWith => _$LocationFailureCopyWithImpl<LocationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AppFailure.location(message: $message)';
}


}

/// @nodoc
abstract mixin class $LocationFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $LocationFailureCopyWith(LocationFailure value, $Res Function(LocationFailure) _then) = _$LocationFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LocationFailureCopyWithImpl<$Res>
    implements $LocationFailureCopyWith<$Res> {
  _$LocationFailureCopyWithImpl(this._self, this._then);

  final LocationFailure _self;
  final $Res Function(LocationFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LocationFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FingerprintFailure implements AppFailure {
  const FingerprintFailure({required this.message});
  

@override final  String message;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FingerprintFailureCopyWith<FingerprintFailure> get copyWith => _$FingerprintFailureCopyWithImpl<FingerprintFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FingerprintFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AppFailure.fingerprint(message: $message)';
}


}

/// @nodoc
abstract mixin class $FingerprintFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $FingerprintFailureCopyWith(FingerprintFailure value, $Res Function(FingerprintFailure) _then) = _$FingerprintFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FingerprintFailureCopyWithImpl<$Res>
    implements $FingerprintFailureCopyWith<$Res> {
  _$FingerprintFailureCopyWithImpl(this._self, this._then);

  final FingerprintFailure _self;
  final $Res Function(FingerprintFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FingerprintFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnexpectedFailure implements AppFailure {
  const UnexpectedFailure({this.message = 'An unexpected error occurred'});
  

@override@JsonKey() final  String message;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedFailureCopyWith<UnexpectedFailure> get copyWith => _$UnexpectedFailureCopyWithImpl<UnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AppFailure.unexpected(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnexpectedFailureCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $UnexpectedFailureCopyWith(UnexpectedFailure value, $Res Function(UnexpectedFailure) _then) = _$UnexpectedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnexpectedFailureCopyWithImpl<$Res>
    implements $UnexpectedFailureCopyWith<$Res> {
  _$UnexpectedFailureCopyWithImpl(this._self, this._then);

  final UnexpectedFailure _self;
  final $Res Function(UnexpectedFailure) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnexpectedFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
