// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  initial,TResult Function( AuthLoadingState value)?  loading,TResult Function( ValidUIDState value)?  validUID,TResult Function( DepartmentSelectedState value)?  departmentSelected,TResult Function( PasswordChangedState value)?  passwordChanged,TResult Function( ForgetPasswordState value)?  forgetPassword,TResult Function( PasswordResettedState value)?  passwordResetted,TResult Function( ActivateAccountState value)?  activateAccount,TResult Function( EmailVerifiedState value)?  emailVerified,TResult Function( AuthSuccessState value)?  success,TResult Function( AuthFailureState value)?  failure,TResult Function( AccountDeletedState value)?  accountDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoadingState() when loading != null:
return loading(_that);case ValidUIDState() when validUID != null:
return validUID(_that);case DepartmentSelectedState() when departmentSelected != null:
return departmentSelected(_that);case PasswordChangedState() when passwordChanged != null:
return passwordChanged(_that);case ForgetPasswordState() when forgetPassword != null:
return forgetPassword(_that);case PasswordResettedState() when passwordResetted != null:
return passwordResetted(_that);case ActivateAccountState() when activateAccount != null:
return activateAccount(_that);case EmailVerifiedState() when emailVerified != null:
return emailVerified(_that);case AuthSuccessState() when success != null:
return success(_that);case AuthFailureState() when failure != null:
return failure(_that);case AccountDeletedState() when accountDeleted != null:
return accountDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  initial,required TResult Function( AuthLoadingState value)  loading,required TResult Function( ValidUIDState value)  validUID,required TResult Function( DepartmentSelectedState value)  departmentSelected,required TResult Function( PasswordChangedState value)  passwordChanged,required TResult Function( ForgetPasswordState value)  forgetPassword,required TResult Function( PasswordResettedState value)  passwordResetted,required TResult Function( ActivateAccountState value)  activateAccount,required TResult Function( EmailVerifiedState value)  emailVerified,required TResult Function( AuthSuccessState value)  success,required TResult Function( AuthFailureState value)  failure,required TResult Function( AccountDeletedState value)  accountDeleted,}){
final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that);case AuthLoadingState():
return loading(_that);case ValidUIDState():
return validUID(_that);case DepartmentSelectedState():
return departmentSelected(_that);case PasswordChangedState():
return passwordChanged(_that);case ForgetPasswordState():
return forgetPassword(_that);case PasswordResettedState():
return passwordResetted(_that);case ActivateAccountState():
return activateAccount(_that);case EmailVerifiedState():
return emailVerified(_that);case AuthSuccessState():
return success(_that);case AuthFailureState():
return failure(_that);case AccountDeletedState():
return accountDeleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  initial,TResult? Function( AuthLoadingState value)?  loading,TResult? Function( ValidUIDState value)?  validUID,TResult? Function( DepartmentSelectedState value)?  departmentSelected,TResult? Function( PasswordChangedState value)?  passwordChanged,TResult? Function( ForgetPasswordState value)?  forgetPassword,TResult? Function( PasswordResettedState value)?  passwordResetted,TResult? Function( ActivateAccountState value)?  activateAccount,TResult? Function( EmailVerifiedState value)?  emailVerified,TResult? Function( AuthSuccessState value)?  success,TResult? Function( AuthFailureState value)?  failure,TResult? Function( AccountDeletedState value)?  accountDeleted,}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoadingState() when loading != null:
return loading(_that);case ValidUIDState() when validUID != null:
return validUID(_that);case DepartmentSelectedState() when departmentSelected != null:
return departmentSelected(_that);case PasswordChangedState() when passwordChanged != null:
return passwordChanged(_that);case ForgetPasswordState() when forgetPassword != null:
return forgetPassword(_that);case PasswordResettedState() when passwordResetted != null:
return passwordResetted(_that);case ActivateAccountState() when activateAccount != null:
return activateAccount(_that);case EmailVerifiedState() when emailVerified != null:
return emailVerified(_that);case AuthSuccessState() when success != null:
return success(_that);case AuthFailureState() when failure != null:
return failure(_that);case AccountDeletedState() when accountDeleted != null:
return accountDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  validUID,TResult Function()?  departmentSelected,TResult Function( String message)?  passwordChanged,TResult Function()?  forgetPassword,TResult Function( String message)?  passwordResetted,TResult Function( String email)?  activateAccount,TResult Function( ManagerEntity? manager,  EmployeeEntity? employee)?  emailVerified,TResult Function( EmployeeEntity? employee,  ManagerEntity? manager)?  success,TResult Function( String error)?  failure,TResult Function( String message)?  accountDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoadingState() when loading != null:
return loading();case ValidUIDState() when validUID != null:
return validUID();case DepartmentSelectedState() when departmentSelected != null:
return departmentSelected();case PasswordChangedState() when passwordChanged != null:
return passwordChanged(_that.message);case ForgetPasswordState() when forgetPassword != null:
return forgetPassword();case PasswordResettedState() when passwordResetted != null:
return passwordResetted(_that.message);case ActivateAccountState() when activateAccount != null:
return activateAccount(_that.email);case EmailVerifiedState() when emailVerified != null:
return emailVerified(_that.manager,_that.employee);case AuthSuccessState() when success != null:
return success(_that.employee,_that.manager);case AuthFailureState() when failure != null:
return failure(_that.error);case AccountDeletedState() when accountDeleted != null:
return accountDeleted(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  validUID,required TResult Function()  departmentSelected,required TResult Function( String message)  passwordChanged,required TResult Function()  forgetPassword,required TResult Function( String message)  passwordResetted,required TResult Function( String email)  activateAccount,required TResult Function( ManagerEntity? manager,  EmployeeEntity? employee)  emailVerified,required TResult Function( EmployeeEntity? employee,  ManagerEntity? manager)  success,required TResult Function( String error)  failure,required TResult Function( String message)  accountDeleted,}) {final _that = this;
switch (_that) {
case AuthInitial():
return initial();case AuthLoadingState():
return loading();case ValidUIDState():
return validUID();case DepartmentSelectedState():
return departmentSelected();case PasswordChangedState():
return passwordChanged(_that.message);case ForgetPasswordState():
return forgetPassword();case PasswordResettedState():
return passwordResetted(_that.message);case ActivateAccountState():
return activateAccount(_that.email);case EmailVerifiedState():
return emailVerified(_that.manager,_that.employee);case AuthSuccessState():
return success(_that.employee,_that.manager);case AuthFailureState():
return failure(_that.error);case AccountDeletedState():
return accountDeleted(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  validUID,TResult? Function()?  departmentSelected,TResult? Function( String message)?  passwordChanged,TResult? Function()?  forgetPassword,TResult? Function( String message)?  passwordResetted,TResult? Function( String email)?  activateAccount,TResult? Function( ManagerEntity? manager,  EmployeeEntity? employee)?  emailVerified,TResult? Function( EmployeeEntity? employee,  ManagerEntity? manager)?  success,TResult? Function( String error)?  failure,TResult? Function( String message)?  accountDeleted,}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoadingState() when loading != null:
return loading();case ValidUIDState() when validUID != null:
return validUID();case DepartmentSelectedState() when departmentSelected != null:
return departmentSelected();case PasswordChangedState() when passwordChanged != null:
return passwordChanged(_that.message);case ForgetPasswordState() when forgetPassword != null:
return forgetPassword();case PasswordResettedState() when passwordResetted != null:
return passwordResetted(_that.message);case ActivateAccountState() when activateAccount != null:
return activateAccount(_that.email);case EmailVerifiedState() when emailVerified != null:
return emailVerified(_that.manager,_that.employee);case AuthSuccessState() when success != null:
return success(_that.employee,_that.manager);case AuthFailureState() when failure != null:
return failure(_that.error);case AccountDeletedState() when accountDeleted != null:
return accountDeleted(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial extends AuthState {
  const AuthInitial(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.initial()';
}


}




/// @nodoc


class AuthLoadingState extends AuthState {
  const AuthLoadingState(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.loading()';
}


}




/// @nodoc


class ValidUIDState extends AuthState {
  const ValidUIDState(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidUIDState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.validUID()';
}


}




/// @nodoc


class DepartmentSelectedState extends AuthState {
  const DepartmentSelectedState(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentSelectedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.departmentSelected()';
}


}




/// @nodoc


class PasswordChangedState extends AuthState {
  const PasswordChangedState(this.message): super._();
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordChangedStateCopyWith<PasswordChangedState> get copyWith => _$PasswordChangedStateCopyWithImpl<PasswordChangedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordChangedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AuthState.passwordChanged(message: $message)';
}


}

/// @nodoc
abstract mixin class $PasswordChangedStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $PasswordChangedStateCopyWith(PasswordChangedState value, $Res Function(PasswordChangedState) _then) = _$PasswordChangedStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PasswordChangedStateCopyWithImpl<$Res>
    implements $PasswordChangedStateCopyWith<$Res> {
  _$PasswordChangedStateCopyWithImpl(this._self, this._then);

  final PasswordChangedState _self;
  final $Res Function(PasswordChangedState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PasswordChangedState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgetPasswordState extends AuthState {
  const ForgetPasswordState(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.forgetPassword()';
}


}




/// @nodoc


class PasswordResettedState extends AuthState {
  const PasswordResettedState(this.message): super._();
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResettedStateCopyWith<PasswordResettedState> get copyWith => _$PasswordResettedStateCopyWithImpl<PasswordResettedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordResettedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AuthState.passwordResetted(message: $message)';
}


}

/// @nodoc
abstract mixin class $PasswordResettedStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $PasswordResettedStateCopyWith(PasswordResettedState value, $Res Function(PasswordResettedState) _then) = _$PasswordResettedStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PasswordResettedStateCopyWithImpl<$Res>
    implements $PasswordResettedStateCopyWith<$Res> {
  _$PasswordResettedStateCopyWithImpl(this._self, this._then);

  final PasswordResettedState _self;
  final $Res Function(PasswordResettedState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PasswordResettedState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ActivateAccountState extends AuthState {
  const ActivateAccountState(this.email): super._();
  

 final  String email;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivateAccountStateCopyWith<ActivateAccountState> get copyWith => _$ActivateAccountStateCopyWithImpl<ActivateAccountState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivateAccountState&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email);
}

@override
String toString() {
    return 'AuthState.activateAccount(email: $email)';
}


}

/// @nodoc
abstract mixin class $ActivateAccountStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ActivateAccountStateCopyWith(ActivateAccountState value, $Res Function(ActivateAccountState) _then) = _$ActivateAccountStateCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ActivateAccountStateCopyWithImpl<$Res>
    implements $ActivateAccountStateCopyWith<$Res> {
  _$ActivateAccountStateCopyWithImpl(this._self, this._then);

  final ActivateAccountState _self;
  final $Res Function(ActivateAccountState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ActivateAccountState(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EmailVerifiedState extends AuthState {
  const EmailVerifiedState({this.manager, this.employee}): super._();
  

 final  ManagerEntity? manager;
 final  EmployeeEntity? employee;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailVerifiedStateCopyWith<EmailVerifiedState> get copyWith => _$EmailVerifiedStateCopyWithImpl<EmailVerifiedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailVerifiedState&&(identical(other.manager, manager) || other.manager == manager)&&(identical(other.employee, employee) || other.employee == employee));
}


@override
int get hashCode {
    return Object.hash(runtimeType,manager,employee);
}

@override
String toString() {
    return 'AuthState.emailVerified(manager: $manager, employee: $employee)';
}


}

/// @nodoc
abstract mixin class $EmailVerifiedStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $EmailVerifiedStateCopyWith(EmailVerifiedState value, $Res Function(EmailVerifiedState) _then) = _$EmailVerifiedStateCopyWithImpl;
@useResult
$Res call({
 ManagerEntity? manager, EmployeeEntity? employee
});


$ManagerEntityCopyWith<$Res>? get manager;$EmployeeEntityCopyWith<$Res>? get employee;

}
/// @nodoc
class _$EmailVerifiedStateCopyWithImpl<$Res>
    implements $EmailVerifiedStateCopyWith<$Res> {
  _$EmailVerifiedStateCopyWithImpl(this._self, this._then);

  final EmailVerifiedState _self;
  final $Res Function(EmailVerifiedState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? manager = freezed,Object? employee = freezed,}) {
  return _then(EmailVerifiedState(
manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerEntity?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as EmployeeEntity?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerEntityCopyWith<$Res>? get manager {
    if (_self.manager == null) {
    return null;
  }

  return $ManagerEntityCopyWith<$Res>(_self.manager!, (value) {
    return _then(_self.copyWith(manager: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeEntityCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $EmployeeEntityCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}
}

/// @nodoc


class AuthSuccessState extends AuthState {
  const AuthSuccessState({this.employee, this.manager}): super._();
  

 final  EmployeeEntity? employee;
 final  ManagerEntity? manager;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSuccessStateCopyWith<AuthSuccessState> get copyWith => _$AuthSuccessStateCopyWithImpl<AuthSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSuccessState&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.manager, manager) || other.manager == manager));
}


@override
int get hashCode {
    return Object.hash(runtimeType,employee,manager);
}

@override
String toString() {
    return 'AuthState.success(employee: $employee, manager: $manager)';
}


}

/// @nodoc
abstract mixin class $AuthSuccessStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthSuccessStateCopyWith(AuthSuccessState value, $Res Function(AuthSuccessState) _then) = _$AuthSuccessStateCopyWithImpl;
@useResult
$Res call({
 EmployeeEntity? employee, ManagerEntity? manager
});


$EmployeeEntityCopyWith<$Res>? get employee;$ManagerEntityCopyWith<$Res>? get manager;

}
/// @nodoc
class _$AuthSuccessStateCopyWithImpl<$Res>
    implements $AuthSuccessStateCopyWith<$Res> {
  _$AuthSuccessStateCopyWithImpl(this._self, this._then);

  final AuthSuccessState _self;
  final $Res Function(AuthSuccessState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employee = freezed,Object? manager = freezed,}) {
  return _then(AuthSuccessState(
employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as EmployeeEntity?,manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerEntity?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeEntityCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $EmployeeEntityCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerEntityCopyWith<$Res>? get manager {
    if (_self.manager == null) {
    return null;
  }

  return $ManagerEntityCopyWith<$Res>(_self.manager!, (value) {
    return _then(_self.copyWith(manager: value));
  });
}
}

/// @nodoc


class AuthFailureState extends AuthState {
  const AuthFailureState(this.error): super._();
  

 final  String error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureStateCopyWith<AuthFailureState> get copyWith => _$AuthFailureStateCopyWithImpl<AuthFailureState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailureState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'AuthState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $AuthFailureStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthFailureStateCopyWith(AuthFailureState value, $Res Function(AuthFailureState) _then) = _$AuthFailureStateCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AuthFailureStateCopyWithImpl<$Res>
    implements $AuthFailureStateCopyWith<$Res> {
  _$AuthFailureStateCopyWithImpl(this._self, this._then);

  final AuthFailureState _self;
  final $Res Function(AuthFailureState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AuthFailureState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AccountDeletedState extends AuthState {
  const AccountDeletedState(this.message): super._();
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDeletedStateCopyWith<AccountDeletedState> get copyWith => _$AccountDeletedStateCopyWithImpl<AccountDeletedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDeletedState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AuthState.accountDeleted(message: $message)';
}


}

/// @nodoc
abstract mixin class $AccountDeletedStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AccountDeletedStateCopyWith(AccountDeletedState value, $Res Function(AccountDeletedState) _then) = _$AccountDeletedStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AccountDeletedStateCopyWithImpl<$Res>
    implements $AccountDeletedStateCopyWith<$Res> {
  _$AccountDeletedStateCopyWithImpl(this._self, this._then);

  final AccountDeletedState _self;
  final $Res Function(AccountDeletedState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AccountDeletedState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
