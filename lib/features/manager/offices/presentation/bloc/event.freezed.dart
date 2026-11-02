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
mixin _$OfficesEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OfficesEvent()';
}


}

/// @nodoc
class $OfficesEventCopyWith<$Res>  {
$OfficesEventCopyWith(OfficesEvent _, $Res Function(OfficesEvent) __);
}


/// Adds pattern-matching-related methods to [OfficesEvent].
extension OfficesEventPatterns on OfficesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetOfficesEvent value)?  getOffices,TResult Function( AddOfficeEvent value)?  addOffice,TResult Function( SetEmployeeEvent value)?  setEmployee,TResult Function( EditOfficeEvent value)?  editOffice,TResult Function( DeleteOfficesEvent value)?  deleteOffices,TResult Function( GetOfficeDetailsEvent value)?  getOfficeDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetOfficesEvent() when getOffices != null:
return getOffices(_that);case AddOfficeEvent() when addOffice != null:
return addOffice(_that);case SetEmployeeEvent() when setEmployee != null:
return setEmployee(_that);case EditOfficeEvent() when editOffice != null:
return editOffice(_that);case DeleteOfficesEvent() when deleteOffices != null:
return deleteOffices(_that);case GetOfficeDetailsEvent() when getOfficeDetails != null:
return getOfficeDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetOfficesEvent value)  getOffices,required TResult Function( AddOfficeEvent value)  addOffice,required TResult Function( SetEmployeeEvent value)  setEmployee,required TResult Function( EditOfficeEvent value)  editOffice,required TResult Function( DeleteOfficesEvent value)  deleteOffices,required TResult Function( GetOfficeDetailsEvent value)  getOfficeDetails,}){
final _that = this;
switch (_that) {
case GetOfficesEvent():
return getOffices(_that);case AddOfficeEvent():
return addOffice(_that);case SetEmployeeEvent():
return setEmployee(_that);case EditOfficeEvent():
return editOffice(_that);case DeleteOfficesEvent():
return deleteOffices(_that);case GetOfficeDetailsEvent():
return getOfficeDetails(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetOfficesEvent value)?  getOffices,TResult? Function( AddOfficeEvent value)?  addOffice,TResult? Function( SetEmployeeEvent value)?  setEmployee,TResult? Function( EditOfficeEvent value)?  editOffice,TResult? Function( DeleteOfficesEvent value)?  deleteOffices,TResult? Function( GetOfficeDetailsEvent value)?  getOfficeDetails,}){
final _that = this;
switch (_that) {
case GetOfficesEvent() when getOffices != null:
return getOffices(_that);case AddOfficeEvent() when addOffice != null:
return addOffice(_that);case SetEmployeeEvent() when setEmployee != null:
return setEmployee(_that);case EditOfficeEvent() when editOffice != null:
return editOffice(_that);case DeleteOfficesEvent() when deleteOffices != null:
return deleteOffices(_that);case GetOfficeDetailsEvent() when getOfficeDetails != null:
return getOfficeDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getOffices,TResult Function()?  addOffice,TResult Function( SetEmployeeParams params)?  setEmployee,TResult Function( int id)?  editOffice,TResult Function( int id)?  deleteOffices,TResult Function( int id)?  getOfficeDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetOfficesEvent() when getOffices != null:
return getOffices();case AddOfficeEvent() when addOffice != null:
return addOffice();case SetEmployeeEvent() when setEmployee != null:
return setEmployee(_that.params);case EditOfficeEvent() when editOffice != null:
return editOffice(_that.id);case DeleteOfficesEvent() when deleteOffices != null:
return deleteOffices(_that.id);case GetOfficeDetailsEvent() when getOfficeDetails != null:
return getOfficeDetails(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getOffices,required TResult Function()  addOffice,required TResult Function( SetEmployeeParams params)  setEmployee,required TResult Function( int id)  editOffice,required TResult Function( int id)  deleteOffices,required TResult Function( int id)  getOfficeDetails,}) {final _that = this;
switch (_that) {
case GetOfficesEvent():
return getOffices();case AddOfficeEvent():
return addOffice();case SetEmployeeEvent():
return setEmployee(_that.params);case EditOfficeEvent():
return editOffice(_that.id);case DeleteOfficesEvent():
return deleteOffices(_that.id);case GetOfficeDetailsEvent():
return getOfficeDetails(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getOffices,TResult? Function()?  addOffice,TResult? Function( SetEmployeeParams params)?  setEmployee,TResult? Function( int id)?  editOffice,TResult? Function( int id)?  deleteOffices,TResult? Function( int id)?  getOfficeDetails,}) {final _that = this;
switch (_that) {
case GetOfficesEvent() when getOffices != null:
return getOffices();case AddOfficeEvent() when addOffice != null:
return addOffice();case SetEmployeeEvent() when setEmployee != null:
return setEmployee(_that.params);case EditOfficeEvent() when editOffice != null:
return editOffice(_that.id);case DeleteOfficesEvent() when deleteOffices != null:
return deleteOffices(_that.id);case GetOfficeDetailsEvent() when getOfficeDetails != null:
return getOfficeDetails(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetOfficesEvent implements OfficesEvent {
  const GetOfficesEvent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GetOfficesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OfficesEvent.getOffices()';
}


}




/// @nodoc


class AddOfficeEvent implements OfficesEvent {
  const AddOfficeEvent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOfficeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OfficesEvent.addOffice()';
}


}




/// @nodoc


class SetEmployeeEvent implements OfficesEvent {
  const SetEmployeeEvent({required this.params});
  

 final  SetEmployeeParams params;

/// Create a copy of OfficesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetEmployeeEventCopyWith<SetEmployeeEvent> get copyWith => _$SetEmployeeEventCopyWithImpl<SetEmployeeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SetEmployeeEvent&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode {
    return Object.hash(runtimeType,params);
}

@override
String toString() {
    return 'OfficesEvent.setEmployee(params: $params)';
}


}

/// @nodoc
abstract mixin class $SetEmployeeEventCopyWith<$Res> implements $OfficesEventCopyWith<$Res> {
  factory $SetEmployeeEventCopyWith(SetEmployeeEvent value, $Res Function(SetEmployeeEvent) _then) = _$SetEmployeeEventCopyWithImpl;
@useResult
$Res call({
 SetEmployeeParams params
});


$SetEmployeeParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$SetEmployeeEventCopyWithImpl<$Res>
    implements $SetEmployeeEventCopyWith<$Res> {
  _$SetEmployeeEventCopyWithImpl(this._self, this._then);

  final SetEmployeeEvent _self;
  final $Res Function(SetEmployeeEvent) _then;

/// Create a copy of OfficesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(SetEmployeeEvent(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as SetEmployeeParams,
  ));
}

/// Create a copy of OfficesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SetEmployeeParamsCopyWith<$Res> get params {
  
  return $SetEmployeeParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class EditOfficeEvent implements OfficesEvent {
  const EditOfficeEvent({required this.id});
  

 final  int id;

/// Create a copy of OfficesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditOfficeEventCopyWith<EditOfficeEvent> get copyWith => _$EditOfficeEventCopyWithImpl<EditOfficeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EditOfficeEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'OfficesEvent.editOffice(id: $id)';
}


}

/// @nodoc
abstract mixin class $EditOfficeEventCopyWith<$Res> implements $OfficesEventCopyWith<$Res> {
  factory $EditOfficeEventCopyWith(EditOfficeEvent value, $Res Function(EditOfficeEvent) _then) = _$EditOfficeEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$EditOfficeEventCopyWithImpl<$Res>
    implements $EditOfficeEventCopyWith<$Res> {
  _$EditOfficeEventCopyWithImpl(this._self, this._then);

  final EditOfficeEvent _self;
  final $Res Function(EditOfficeEvent) _then;

/// Create a copy of OfficesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(EditOfficeEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteOfficesEvent implements OfficesEvent {
  const DeleteOfficesEvent(this.id);
  

 final  int id;

/// Create a copy of OfficesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteOfficesEventCopyWith<DeleteOfficesEvent> get copyWith => _$DeleteOfficesEventCopyWithImpl<DeleteOfficesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteOfficesEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'OfficesEvent.deleteOffices(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteOfficesEventCopyWith<$Res> implements $OfficesEventCopyWith<$Res> {
  factory $DeleteOfficesEventCopyWith(DeleteOfficesEvent value, $Res Function(DeleteOfficesEvent) _then) = _$DeleteOfficesEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteOfficesEventCopyWithImpl<$Res>
    implements $DeleteOfficesEventCopyWith<$Res> {
  _$DeleteOfficesEventCopyWithImpl(this._self, this._then);

  final DeleteOfficesEvent _self;
  final $Res Function(DeleteOfficesEvent) _then;

/// Create a copy of OfficesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteOfficesEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GetOfficeDetailsEvent implements OfficesEvent {
  const GetOfficeDetailsEvent(this.id);
  

 final  int id;

/// Create a copy of OfficesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetOfficeDetailsEventCopyWith<GetOfficeDetailsEvent> get copyWith => _$GetOfficeDetailsEventCopyWithImpl<GetOfficeDetailsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GetOfficeDetailsEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'OfficesEvent.getOfficeDetails(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetOfficeDetailsEventCopyWith<$Res> implements $OfficesEventCopyWith<$Res> {
  factory $GetOfficeDetailsEventCopyWith(GetOfficeDetailsEvent value, $Res Function(GetOfficeDetailsEvent) _then) = _$GetOfficeDetailsEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$GetOfficeDetailsEventCopyWithImpl<$Res>
    implements $GetOfficeDetailsEventCopyWith<$Res> {
  _$GetOfficeDetailsEventCopyWithImpl(this._self, this._then);

  final GetOfficeDetailsEvent _self;
  final $Res Function(GetOfficeDetailsEvent) _then;

/// Create a copy of OfficesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetOfficeDetailsEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
