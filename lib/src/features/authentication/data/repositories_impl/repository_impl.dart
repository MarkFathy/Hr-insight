import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/authentication/data/sources/local_src.dart';
import 'package:hr_app/src/features/authentication/data/sources/remote_src.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart.dart';
import 'package:hr_app/src/features/authentication/domain/entities/survant_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/user_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource remoteSource;
  final AuthLocalSource localSource;

  AuthRepositoryImpl({required this.remoteSource, required this.localSource});

  @override
  Future<Either<Failure, Map>> autoLogin() async {
    try {
      final user = localSource.autoLogin();
      if (user == null) throw const OfflineFailure("User Not logged!");
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String>> signOut() async {
    try {
      final user = await localSource.logout();
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, ManagerEntity>> managerSignUp(
      ManagerRegisterParams params) async {
    try {
      final user = await remoteSource.managerSignUp(params);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, EmployeeEntity>> employeeSignUp(
      EmployeeRegisterParams params) async {
    try {
      final user = await remoteSource.employeeSignUp(params);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, EmployeeEntity>> employeeSignIn(
      {required String email, required String password}) async {
    try {
      final user =
          await remoteSource.employeeSignIn(email: email, password: password);
      await localSource.save(user!.toMap(), true);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, ManagerEntity>> managerSignIn(
      {required String email, required String password}) async {
    try {
      final user =
          await remoteSource.managerSignIn(email: email, password: password);
      await localSource.save(user!.toJson(), false);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, ManagerInfoEntity?>> getDepartments(
      String params) async {
    try {
      final user = await remoteSource.getDepartments(params);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  // @override
  // Future<Either<Failure, JobTitlesEntity?>> getJobTitles(int params) async {
  //   try {
  //     final user = await remoteSource.getJobTitles(params);
  //     return Right(user);
  //   } on Failure catch (e) {
  //     return Left(e);
  //   }
  // }

  @override
  Future<Either<Failure, String>> changePassword(
      ChangePasswordParams params) async {
    try {
      final user = await remoteSource.changePassword(params);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> verifyEmail(
      VerifyParams params) async {
    try {
      final user = await remoteSource.veridfyEmail(params);
      await localSource.save(user, params.isEmployee);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> resetPassword(
      ResetPasswordParams params) async {
    try {
      final user = await remoteSource.resetPassword(params);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> forgetPassword(
      ForgetPasswordParams params) async {
    try {
      final user = await remoteSource.forgetPassword(params);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(
      AccountDeleteParams params) async {
    try {
      await remoteSource.deleteAccount(params);
      return const Right(null);
    } on Failure catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
