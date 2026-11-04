// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employees_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeesEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmployeesEvent()';
}


}

/// @nodoc
class $EmployeesEventCopyWith<$Res>  {
$EmployeesEventCopyWith(EmployeesEvent _, $Res Function(EmployeesEvent) __);
}


/// Adds pattern-matching-related methods to [EmployeesEvent].
extension EmployeesEventPatterns on EmployeesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetEmployeesEvent value)?  getEmployees,TResult Function( AddEmployeeEvent value)?  addEmployee,TResult Function( DeleteEmployeeEvent value)?  deleteEmployee,TResult Function( GetEmployeeDetailsEvent value)?  getEmployeeDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetEmployeesEvent() when getEmployees != null:
return getEmployees(_that);case AddEmployeeEvent() when addEmployee != null:
return addEmployee(_that);case DeleteEmployeeEvent() when deleteEmployee != null:
return deleteEmployee(_that);case GetEmployeeDetailsEvent() when getEmployeeDetails != null:
return getEmployeeDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetEmployeesEvent value)  getEmployees,required TResult Function( AddEmployeeEvent value)  addEmployee,required TResult Function( DeleteEmployeeEvent value)  deleteEmployee,required TResult Function( GetEmployeeDetailsEvent value)  getEmployeeDetails,}){
final _that = this;
switch (_that) {
case GetEmployeesEvent():
return getEmployees(_that);case AddEmployeeEvent():
return addEmployee(_that);case DeleteEmployeeEvent():
return deleteEmployee(_that);case GetEmployeeDetailsEvent():
return getEmployeeDetails(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetEmployeesEvent value)?  getEmployees,TResult? Function( AddEmployeeEvent value)?  addEmployee,TResult? Function( DeleteEmployeeEvent value)?  deleteEmployee,TResult? Function( GetEmployeeDetailsEvent value)?  getEmployeeDetails,}){
final _that = this;
switch (_that) {
case GetEmployeesEvent() when getEmployees != null:
return getEmployees(_that);case AddEmployeeEvent() when addEmployee != null:
return addEmployee(_that);case DeleteEmployeeEvent() when deleteEmployee != null:
return deleteEmployee(_that);case GetEmployeeDetailsEvent() when getEmployeeDetails != null:
return getEmployeeDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getEmployees,TResult Function()?  addEmployee,TResult Function( int id)?  deleteEmployee,TResult Function( int id)?  getEmployeeDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetEmployeesEvent() when getEmployees != null:
return getEmployees();case AddEmployeeEvent() when addEmployee != null:
return addEmployee();case DeleteEmployeeEvent() when deleteEmployee != null:
return deleteEmployee(_that.id);case GetEmployeeDetailsEvent() when getEmployeeDetails != null:
return getEmployeeDetails(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getEmployees,required TResult Function()  addEmployee,required TResult Function( int id)  deleteEmployee,required TResult Function( int id)  getEmployeeDetails,}) {final _that = this;
switch (_that) {
case GetEmployeesEvent():
return getEmployees();case AddEmployeeEvent():
return addEmployee();case DeleteEmployeeEvent():
return deleteEmployee(_that.id);case GetEmployeeDetailsEvent():
return getEmployeeDetails(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getEmployees,TResult? Function()?  addEmployee,TResult? Function( int id)?  deleteEmployee,TResult? Function( int id)?  getEmployeeDetails,}) {final _that = this;
switch (_that) {
case GetEmployeesEvent() when getEmployees != null:
return getEmployees();case AddEmployeeEvent() when addEmployee != null:
return addEmployee();case DeleteEmployeeEvent() when deleteEmployee != null:
return deleteEmployee(_that.id);case GetEmployeeDetailsEvent() when getEmployeeDetails != null:
return getEmployeeDetails(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetEmployeesEvent implements EmployeesEvent {
  const GetEmployeesEvent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GetEmployeesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmployeesEvent.getEmployees()';
}


}




/// @nodoc


class AddEmployeeEvent implements EmployeesEvent {
  const AddEmployeeEvent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddEmployeeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmployeesEvent.addEmployee()';
}


}




/// @nodoc


class DeleteEmployeeEvent implements EmployeesEvent {
  const DeleteEmployeeEvent(this.id);
  

 final  int id;

/// Create a copy of EmployeesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteEmployeeEventCopyWith<DeleteEmployeeEvent> get copyWith => _$DeleteEmployeeEventCopyWithImpl<DeleteEmployeeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteEmployeeEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'EmployeesEvent.deleteEmployee(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteEmployeeEventCopyWith<$Res> implements $EmployeesEventCopyWith<$Res> {
  factory $DeleteEmployeeEventCopyWith(DeleteEmployeeEvent value, $Res Function(DeleteEmployeeEvent) _then) = _$DeleteEmployeeEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteEmployeeEventCopyWithImpl<$Res>
    implements $DeleteEmployeeEventCopyWith<$Res> {
  _$DeleteEmployeeEventCopyWithImpl(this._self, this._then);

  final DeleteEmployeeEvent _self;
  final $Res Function(DeleteEmployeeEvent) _then;

/// Create a copy of EmployeesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteEmployeeEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GetEmployeeDetailsEvent implements EmployeesEvent {
  const GetEmployeeDetailsEvent(this.id);
  

 final  int id;

/// Create a copy of EmployeesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetEmployeeDetailsEventCopyWith<GetEmployeeDetailsEvent> get copyWith => _$GetEmployeeDetailsEventCopyWithImpl<GetEmployeeDetailsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GetEmployeeDetailsEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'EmployeesEvent.getEmployeeDetails(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetEmployeeDetailsEventCopyWith<$Res> implements $EmployeesEventCopyWith<$Res> {
  factory $GetEmployeeDetailsEventCopyWith(GetEmployeeDetailsEvent value, $Res Function(GetEmployeeDetailsEvent) _then) = _$GetEmployeeDetailsEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$GetEmployeeDetailsEventCopyWithImpl<$Res>
    implements $GetEmployeeDetailsEventCopyWith<$Res> {
  _$GetEmployeeDetailsEventCopyWithImpl(this._self, this._then);

  final GetEmployeeDetailsEvent _self;
  final $Res Function(GetEmployeeDetailsEvent) _then;

/// Create a copy of EmployeesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetEmployeeDetailsEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
