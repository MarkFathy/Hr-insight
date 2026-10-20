import 'package:fpdart/fpdart.dart';
import 'package:hr_app/src/core/errors/app_failure.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:hr_app/src/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:hr_app/src/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteSource;
  final AuthLocalDataSource localSource;

  AuthRepositoryImpl({required this.remoteSource, required this.localSource});

  @override
  ResultFuture<Map<String, dynamic>?> autoLogin() async {
    try {
      final user = localSource.autoLogin();
      if (user == null) {
        return const Left(AppFailure.emptyCache(message: 'User Not logged!'));
      }
      return Right(user);
    } on EmptyCacheException catch (e) {
      return Left(AppFailure.emptyCache(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.emptyCache(message: e.toString()));
    }
  }

  @override
  ResultFuture<String> signOut() async {
    try {
      final user = await localSource.logout();
      return Right(user);
    } on EmptyCacheException catch (e) {
      return Left(AppFailure.emptyCache(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.emptyCache(message: e.toString()));
    }
  }

  @override
  ResultFuture<ManagerEntity> managerSignUp(
    ManagerRegisterParams params,
  ) async {
    try {
      final user = await remoteSource.managerSignUp(params);
      return Right(user);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }

  @override
  ResultFuture<EmployeeEntity> employeeSignUp(
    EmployeeRegisterParams params,
  ) async {
    try {
      final user = await remoteSource.employeeSignUp(params);
      return Right(user);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }

  @override
  ResultFuture<EmployeeEntity?> employeeSignIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteSource.employeeSignIn(
        email: email,
        password: password,
      );
      if (user != null) {
        await localSource.save(user.toJson(), isEmployee: true);
      }
      return Right(user);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }

  @override
  ResultFuture<ManagerEntity?> managerSignIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteSource.managerSignIn(
        email: email,
        password: password,
      );
      if (user != null) {
        await localSource.save(user.toJson(), isEmployee: false);
      }
      return Right(user);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }

  @override
  ResultFuture<ManagerInfoEntity?> getDepartments(String params) async {
    try {
      final user = await remoteSource.getDepartments(params);
      return Right(user);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }

  @override
  ResultFuture<String> changePassword(ChangePasswordParams params) async {
    try {
      final user = await remoteSource.changePassword(params);
      return Right(user);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }

  @override
  ResultFuture<Map<String, dynamic>?> verifyEmail(VerifyParams params) async {
    try {
      final user = await remoteSource.verifyEmail(params);
      return Right(user);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }

  @override
  ResultFuture<Map<String, dynamic>?> resetPassword(
    ResetPasswordParams params,
  ) async {
    try {
      final user = await remoteSource.resetPassword(params);
      return Right(user);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }

  @override
  ResultFuture<Map<String, dynamic>?> forgetPassword(
    ForgetPasswordParams params,
  ) async {
    try {
      final user = await remoteSource.forgetPassword(params);
      return Right(user);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> deleteAccount(AccountDeleteParams params) async {
    try {
      await remoteSource.deleteAccount(params);
      await localSource.logout();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(AppFailure.server(message: e.message));
    } on Exception catch (e) {
      return Left(AppFailure.server(message: e.toString()));
    }
  }
}
