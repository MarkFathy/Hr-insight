import 'package:get_it/get_it.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/public_models/token.dart';
import 'package:hr_app/core/service/internet_connection_service.dart';
import 'package:hr_app/core/service/stability_interceptor.dart';
import 'package:hr_app/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:hr_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:hr_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:hr_app/features/authentication/domain/use_cases/auto_login_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/change_password_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/delete_account_use_case.dart';
import 'package:hr_app/features/authentication/domain/use_cases/employee_sign_in_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/employee_sign_up_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/forget_password.dart';
import 'package:hr_app/features/authentication/domain/use_cases/get_departments_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/manager_sign_in_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/manager_sign_up_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/reset_password.dart';
import 'package:hr_app/features/authentication/domain/use_cases/sign_out_uc.dart';
import 'package:hr_app/features/authentication/domain/use_cases/verify_email.dart';
import 'package:hr_app/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/features/employee/attendance/data/data_sources/remote_src.dart';
import 'package:hr_app/features/employee/attendance/data/repositories/repository_impl.dart';
import 'package:hr_app/features/employee/attendance/domain/repositories/repository.dart';
import 'package:hr_app/features/employee/attendance/domain/use_cases/get_attendance.dart';
import 'package:hr_app/features/employee/attendance/domain/use_cases/sign_attendance_use_case.dart';
import 'package:hr_app/features/employee/attendance/presentation/bloc/bloc.dart';
import 'package:hr_app/features/employee/leaves/data/data_sources/remote_src.dart';
import 'package:hr_app/features/employee/leaves/data/repositories/repository_impl.dart';
import 'package:hr_app/features/employee/leaves/domain/repositories/repository.dart';
import 'package:hr_app/features/employee/leaves/domain/use_cases/get_leaves.dart';
import 'package:hr_app/features/employee/leaves/domain/use_cases/request_leave.dart';
import 'package:hr_app/features/employee/leaves/presentation/bloc/bloc.dart';
import 'package:hr_app/features/manager/departments/data/data_sources/remote_src.dart';
import 'package:hr_app/features/manager/departments/data/repositories/repository_impl.dart';
import 'package:hr_app/features/manager/departments/domain/repositories/repository.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/add_department.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/add_job.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/delete_department.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/delete_job.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/edit_department.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/edit_job.dart';
import 'package:hr_app/features/manager/departments/domain/use_cases/get_departments_and_jobs_use_case.dart';
import 'package:hr_app/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/features/manager/employees/data/data_sources/remote_src.dart';
import 'package:hr_app/features/manager/employees/data/repositories/repository_impl.dart';
import 'package:hr_app/features/manager/employees/domain/repositories/repository.dart';
import 'package:hr_app/features/manager/employees/domain/use_cases/delete_employee_use_case.dart';
import 'package:hr_app/features/manager/employees/domain/use_cases/get_employees_use_case.dart';
import 'package:hr_app/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/features/manager/leaves/data/data_sources/remote_src.dart';
import 'package:hr_app/features/manager/leaves/data/repositories/repository_impl.dart';
import 'package:hr_app/features/manager/leaves/domain/repositories/repository.dart';
import 'package:hr_app/features/manager/leaves/domain/use_cases/get_leaves.dart';
import 'package:hr_app/features/manager/leaves/domain/use_cases/set_leave.dart';
import 'package:hr_app/features/manager/leaves/presentation/bloc/bloc.dart';
import 'package:hr_app/features/manager/manager_attendance/data/data_sources/remote_src.dart';
import 'package:hr_app/features/manager/manager_attendance/data/repositories/repository_impl.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/repositories/repository.dart';
import 'package:hr_app/features/manager/manager_attendance/domain/use_cases/get_attendance.dart';
import 'package:hr_app/features/manager/manager_attendance/presentation/bloc/attendance_bloc.dart';
import 'package:hr_app/features/manager/offices/data/data_sources/remote_src.dart';
import 'package:hr_app/features/manager/offices/data/repositories/repository_impl.dart';
import 'package:hr_app/features/manager/offices/domain/repositories/repository.dart';
import 'package:hr_app/features/manager/offices/domain/use_cases/add_office_use_case.dart';
import 'package:hr_app/features/manager/offices/domain/use_cases/delete_office_use_case.dart';
import 'package:hr_app/features/manager/offices/domain/use_cases/edit_office_use_case.dart';
import 'package:hr_app/features/manager/offices/domain/use_cases/get_office_details_use_case.dart';
import 'package:hr_app/features/manager/offices/domain/use_cases/get_offices_use_case.dart';
import 'package:hr_app/features/manager/offices/domain/use_cases/set_office_use_case.dart';
import 'package:hr_app/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/features/profile/data/data_sources/remote_src.dart';
import 'package:hr_app/features/profile/data/repositories/repository_impl.dart';
import 'package:hr_app/features/profile/domain/repositories/repository.dart';
import 'package:hr_app/features/profile/domain/use_cases/get_profile.dart';
import 'package:hr_app/features/profile/domain/use_cases/update_profile.dart';
import 'package:hr_app/features/profile/presentation/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Network & Internet Reachability
  sl
    ..registerLazySingleton<InternetConnectionService>(
      InternetConnectionService.new,
    )
    ..registerLazySingleton<IInternetConnectionService>(
      sl.get<InternetConnectionService>,
    )
    ..registerLazySingleton<StabilityInterceptor>(
      () => StabilityInterceptor(sl<InternetConnectionService>()),
    );

  final sharedPreferences = await SharedPreferences.getInstance();

  //!External
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Token(sl<SharedPreferences>()));
  sl.registerLazySingleton<DioClient>(() => DioClient(token: sl()));

  //!Authentication Blocs
  sl.registerFactory(
    () => AuthBloc(
      autoLoginUC: sl(),
      signInUC: sl(),
      signOutUC: sl(),
      employeeSignUpUC: sl(),
      managerSignUpUC: sl(),
      getDepartmentsUC: sl(),
      changePasswordUC: sl(),
      managerSignInUC: sl(),
      verifyEmailUC: sl(),
      forgetPasswordUC: sl(),
      resetPasswordUC: sl(),
      deleteAccountUC: sl(),
    ),
  );

  //! Use cases
  sl.registerLazySingleton(() => AutoLoginUC(sl()));
  sl.registerLazySingleton(() => EmployeeSignInUC(sl()));
  sl.registerLazySingleton(() => EmployeeSignUpUC(sl()));
  sl.registerLazySingleton(() => ManagerSignInUC(sl()));
  sl.registerLazySingleton(() => ManagerSignUpUC(sl()));
  sl.registerLazySingleton(() => SignOutUC(sl()));
  sl.registerLazySingleton(() => GetManagerDepartmentsUC(sl()));
  sl.registerLazySingleton(() => ChangePasswordUC(sl()));
  sl.registerLazySingleton(() => VerifyEmailUC(sl()));
  sl.registerLazySingleton(() => ForgetPasswordUC(sl()));
  sl.registerLazySingleton(() => ResetPasswordUC(sl()));
  sl.registerLazySingleton(() => DeleteAccountUC(sl()));

  //! Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(localSource: sl(), remoteSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<AuthRemoteSource>(
    () => AuthRemoteSourceImpl(dioClient: sl()),
  );
  sl.registerLazySingleton<AuthLocalSource>(
    () => AuthLocalSourceImpl(sl(), sl()),
  );

  ///
  // ----Profile Bloc
  ///

  sl.registerFactory(
    () => ProfileBloc(getProfileUC: sl(), updateProfileUC: sl()),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetProfileUC(sl()));
  sl.registerLazySingleton(() => UpdateProfileUC(sl()));
  //! Repository
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<ProfileRemoteDataSrc>(
    () => ProfileRemoteDataSrcImpl(dioClient: sl()),
  );

  ///
  // ----Attendance Bloc
  ///

  sl.registerFactory(() => AttendanceBloc(getAttendanceUC: sl(), signUC: sl()));
  //! Use cases
  sl.registerLazySingleton(() => GetAttendanceUC(sl()));
  sl.registerLazySingleton(() => SignUC(sl()));

  //! Repository
  sl.registerLazySingleton<AttendanceRepo>(
    () => AttendanceRepoImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<AttendanceRemoteDataSrc>(
    () => AttendanceRemoteDataSrcImpl(dioClient: sl()),
  );

  ///
  // ---- Manager Attendance Bloc
  ///

  sl.registerFactory(() => ManagerAttendanceBloc(getManagerAttendanceUC: sl()));
  //! Use cases
  sl.registerLazySingleton(() => GetManagerAttendanceUC(sl()));

  //! Repository
  sl.registerLazySingleton<ManagerAttendanceRepo>(
    () => ManagerAttendanceRepoImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<ManagerAttendanceRemoteDataSrc>(
    () => ManagerAttendanceRemoteDataSrcImpl(dioClient: sl()),
  );

  ///
  // ------ Leaves Bloc
  ///

  sl.registerFactory(() => LeavesBloc(getLeavesUC: sl(), requestLeaveUC: sl()));
  //! Use cases
  sl.registerLazySingleton(() => GetLeavesUC(sl()));
  sl.registerLazySingleton(() => RequestLeaveUC(sl()));

  //! Repository
  sl.registerLazySingleton<LeavesRepo>(
    () => LeavesRepoImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<LeavesRemoteDataSrc>(
    () => LeavesRemoteDataSrcImpl(dioClient: sl()),
  );

  ///
  // ------ Manager Leaves Bloc
  ///

  sl.registerFactory(
    () => ManagerLeavesBloc(getLeavesUC: sl(), setLeaveStateUC: sl()),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetManagerLeavesUC(sl()));
  sl.registerLazySingleton(() => SetLeaveUC(sl()));

  //! Repository
  sl.registerLazySingleton<ManagerLeavesRepo>(
    () => ManagerLeavesRepoImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<ManagerLeavesRemoteDataSrc>(
    () => ManagerLeavesRemoteDataSrcImpl(dioClient: sl()),
  );

  ///
  ///----- Offices
  ///

  sl.registerFactory(
    () => OfficesBloc(
      getOfficesUC: sl(),
      addOfficeUC: sl(),
      deleteOfficeUC: sl(),
      editOfficeUC: sl(),
      getOfficeDetailsUC: sl(),
      setOffice: sl(),
    ),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetOfficesUC(sl()));
  sl.registerLazySingleton(() => GetOfficeDetailsUC(sl()));
  sl.registerLazySingleton(() => AddOfficeUC(sl()));
  sl.registerLazySingleton(() => EditOfficeUC(sl()));
  sl.registerLazySingleton(() => DeleteOfficeUC(sl()));
  sl.registerLazySingleton(() => SetOfficeUC(sl()));
  //! Repository
  sl.registerLazySingleton<OfficesRepo>(
    () => OfficesRepoImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<OfficesRemoteSrc>(
    () => OfficesRemoteSrcImpl(dioClient: sl()),
  );

  ///
  /// -------Departments
  ///

  sl.registerFactory(
    () => DepartmentsAndJobsBloc(
      getDepartmentsAndJobsUC: sl(),
      addDepartmentsUC: sl(),
      deleteOfficeUC: sl(),
      editDewpartementsUC: sl(),
      addJobUC: sl(),
      editJobUC: sl(),
      deleteJobUC: sl(),
    ),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetDepartmentAndJobssUC(sl()));
  sl.registerLazySingleton(() => AddDepartmentUC(sl()));
  sl.registerLazySingleton(() => EditDepartmentUC(sl()));
  sl.registerLazySingleton(() => DeleteDepartmentUC(sl()));
  sl.registerLazySingleton(() => AddJobUC(sl()));
  sl.registerLazySingleton(() => EditJobUC(sl()));
  sl.registerLazySingleton(() => DeleteJobUC(sl()));

  //! Repository
  sl.registerLazySingleton<DepartmentsAndJobsRepo>(
    () => DepartmentsAndJobsRepoImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<DepartmentsAndJobRemoteSrc>(
    () => DepartmentsAndJobsRemoteSrcImpl(dioClient: sl()),
  );

  ///
  //-------- Employee
  ///

  sl.registerFactory(
    () => EmployeesBloc(deleteOfficeUC: sl(), getEmployeesUC: sl()),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetEmployeesUC(sl()));
  sl.registerLazySingleton(() => DeleteEmployeeUC(sl()));

  //! Repository
  sl.registerLazySingleton<EmployeesRepo>(
    () => EmployeesRepoImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<EmployeesRemoteSrc>(
    () => EmployeesRemoteSrcImpl(dioClient: sl()),
  );
}
