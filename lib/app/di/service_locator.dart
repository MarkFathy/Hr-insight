import 'package:get_it/get_it.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/network/interceptors/stability_interceptor.dart';
import 'package:hr_app/core/network/internet_connection_service.dart';
import 'package:hr_app/core/network/token_manager.dart';
import 'package:hr_app/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:hr_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:hr_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:hr_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:hr_app/features/authentication/domain/usecases/auto_login.dart';
import 'package:hr_app/features/authentication/domain/usecases/change_password.dart';
import 'package:hr_app/features/authentication/domain/usecases/delete_account.dart';
import 'package:hr_app/features/authentication/domain/usecases/employee_sign_in.dart';
import 'package:hr_app/features/authentication/domain/usecases/employee_sign_up.dart';
import 'package:hr_app/features/authentication/domain/usecases/forget_password.dart';
import 'package:hr_app/features/authentication/domain/usecases/get_manager_departments.dart';
import 'package:hr_app/features/authentication/domain/usecases/manager_sign_in.dart';
import 'package:hr_app/features/authentication/domain/usecases/manager_sign_up.dart';
import 'package:hr_app/features/authentication/domain/usecases/reset_password.dart';
import 'package:hr_app/features/authentication/domain/usecases/sign_out.dart';
import 'package:hr_app/features/authentication/domain/usecases/verify_email.dart';
import 'package:hr_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:hr_app/features/employee_attendance/data/datasources/attendance_remote_data_source.dart';
import 'package:hr_app/features/employee_attendance/data/repositories/attendance_repository_impl.dart';
import 'package:hr_app/features/employee_attendance/domain/repositories/attendance_repository.dart';
import 'package:hr_app/features/employee_attendance/domain/usecases/get_attendance.dart';
import 'package:hr_app/features/employee_attendance/domain/usecases/sign_attendance.dart';
import 'package:hr_app/features/employee_attendance/presentation/bloc/attendance_bloc.dart';
import 'package:hr_app/features/employee_leaves/data/datasources/leaves_remote_data_source.dart';
import 'package:hr_app/features/employee_leaves/data/repositories/leaves_repository_impl.dart';
import 'package:hr_app/features/employee_leaves/domain/repositories/leaves_repository.dart';
import 'package:hr_app/features/employee_leaves/domain/usecases/get_leaves.dart';
import 'package:hr_app/features/employee_leaves/domain/usecases/request_leave.dart';
import 'package:hr_app/features/employee_leaves/presentation/bloc/leaves_bloc.dart';
import 'package:hr_app/features/manager_attendance/data/datasources/manager_attendance_remote_data_source.dart';
import 'package:hr_app/features/manager_attendance/data/repositories/manager_attendance_repository_impl.dart';
import 'package:hr_app/features/manager_attendance/domain/repositories/manager_attendance_repository.dart';
import 'package:hr_app/features/manager_attendance/domain/usecases/get_manager_attendance.dart';
import 'package:hr_app/features/manager_attendance/presentation/bloc/manager_attendance_bloc.dart';
import 'package:hr_app/features/manager_departments/data/datasources/departments_remote_data_source.dart';
import 'package:hr_app/features/manager_departments/data/repositories/departments_repository_impl.dart';
import 'package:hr_app/features/manager_departments/domain/repositories/departments_repository.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/add_department.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/add_job.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/delete_department.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/delete_job.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/edit_department.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/edit_job.dart';
import 'package:hr_app/features/manager_departments/domain/usecases/get_departments_and_jobs.dart';
import 'package:hr_app/features/manager_departments/presentation/bloc/departments_bloc.dart';
import 'package:hr_app/features/manager_employees/data/datasources/employees_remote_data_source.dart';
import 'package:hr_app/features/manager_employees/data/repositories/employees_repository_impl.dart';
import 'package:hr_app/features/manager_employees/domain/repositories/employees_repository.dart';
import 'package:hr_app/features/manager_employees/domain/usecases/delete_employee.dart';
import 'package:hr_app/features/manager_employees/domain/usecases/get_employees.dart';
import 'package:hr_app/features/manager_employees/presentation/bloc/employees_bloc.dart';
import 'package:hr_app/features/manager_leaves/data/datasources/manager_leaves_remote_data_source.dart';
import 'package:hr_app/features/manager_leaves/data/repositories/manager_leaves_repository_impl.dart';
import 'package:hr_app/features/manager_leaves/domain/repositories/manager_leaves_repository.dart';
import 'package:hr_app/features/manager_leaves/domain/usecases/get_manager_leaves.dart';
import 'package:hr_app/features/manager_leaves/domain/usecases/set_leave_status.dart';
import 'package:hr_app/features/manager_leaves/presentation/bloc/manager_leaves_bloc.dart';
import 'package:hr_app/features/manager_offices/data/datasources/offices_remote_data_source.dart';
import 'package:hr_app/features/manager_offices/data/repositories/offices_repository_impl.dart';
import 'package:hr_app/features/manager_offices/domain/repositories/offices_repository.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/add_office.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/delete_office.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/edit_office.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/get_office_details.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/get_offices.dart';
import 'package:hr_app/features/manager_offices/domain/usecases/set_employee_office.dart';
import 'package:hr_app/features/manager_offices/presentation/bloc/offices_bloc.dart';
import 'package:hr_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:hr_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:hr_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:hr_app/features/profile/domain/usecases/get_profile.dart';
import 'package:hr_app/features/profile/domain/usecases/update_profile.dart';
import 'package:hr_app/features/profile/presentation/bloc/profile_bloc.dart';
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
      autoLogin: sl(),
      employeeSignIn: sl(),
      signOut: sl(),
      employeeSignUp: sl(),
      managerSignUp: sl(),
      getDepartments: sl(),
      changePassword: sl(),
      managerSignIn: sl(),
      verifyEmail: sl(),
      forgetPassword: sl(),
      resetPassword: sl(),
      deleteAccount: sl(),
    ),
  );

  //! Use cases
  sl.registerLazySingleton(() => AutoLogin(sl()));
  sl.registerLazySingleton(() => EmployeeSignIn(sl()));
  sl.registerLazySingleton(() => EmployeeSignUp(sl()));
  sl.registerLazySingleton(() => ManagerSignIn(sl()));
  sl.registerLazySingleton(() => ManagerSignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  sl.registerLazySingleton(() => GetManagerDepartments(sl()));
  sl.registerLazySingleton(() => ChangePassword(sl()));
  sl.registerLazySingleton(() => VerifyEmail(sl()));
  sl.registerLazySingleton(() => ForgetPassword(sl()));
  sl.registerLazySingleton(() => ResetPassword(sl()));
  sl.registerLazySingleton(() => DeleteAccount(sl()));

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

  sl.registerFactory(() => ProfileBloc(getProfile: sl(), updateProfile: sl()));
  //! Use cases
  sl.registerLazySingleton(() => GetProfile(sl()));
  sl.registerLazySingleton(() => UpdateProfile(sl()));
  //! Repository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(dioClient: sl()),
  );

  ///
  // ----Attendance Bloc
  ///

  sl.registerFactory(
    () => AttendanceBloc(getAttendance: sl(), signAttendance: sl()),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetAttendance(sl()));
  sl.registerLazySingleton(() => SignAttendance(sl()));

  //! Repository
  sl.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<AttendanceRemoteDataSource>(
    () => AttendanceRemoteDataSourceImpl(dioClient: sl()),
  );

  ///
  // ---- Manager Attendance Bloc
  ///

  sl.registerFactory(() => ManagerAttendanceBloc(getManagerAttendance: sl()));
  //! Use cases
  sl.registerLazySingleton(() => GetManagerAttendance(sl()));

  //! Repository
  sl.registerLazySingleton<ManagerAttendanceRepository>(
    () => ManagerAttendanceRepositoryImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<ManagerAttendanceRemoteDataSource>(
    () => ManagerAttendanceRemoteDataSourceImpl(dioClient: sl()),
  );

  ///
  // ------ Leaves Bloc
  ///

  sl.registerFactory(() => LeavesBloc(getLeaves: sl(), requestLeave: sl()));
  //! Use cases
  sl.registerLazySingleton(() => GetLeaves(sl()));
  sl.registerLazySingleton(() => RequestLeave(sl()));

  //! Repository
  sl.registerLazySingleton<LeavesRepository>(
    () => LeavesRepositoryImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<LeavesRemoteDataSource>(
    () => LeavesRemoteDataSourceImpl(dioClient: sl()),
  );

  ///
  // ------ Manager Leaves Bloc
  ///

  sl.registerFactory(
    () => ManagerLeavesBloc(getLeaves: sl(), setLeaveStatus: sl()),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetManagerLeaves(sl()));
  sl.registerLazySingleton(() => SetLeaveStatus(sl()));

  //! Repository
  sl.registerLazySingleton<ManagerLeavesRepository>(
    () => ManagerLeavesRepositoryImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<ManagerLeavesRemoteDataSource>(
    () => ManagerLeavesRemoteDataSourceImpl(dioClient: sl()),
  );

  ///
  ///----- Offices
  ///

  sl.registerFactory(
    () => OfficesBloc(
      getOffices: sl(),
      addOffice: sl(),
      deleteOffice: sl(),
      editOffice: sl(),
      getOfficeDetails: sl(),
      setEmployeeOffice: sl(),
    ),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetOffices(sl()));
  sl.registerLazySingleton(() => GetOfficeDetails(sl()));
  sl.registerLazySingleton(() => AddOffice(sl()));
  sl.registerLazySingleton(() => EditOffice(sl()));
  sl.registerLazySingleton(() => DeleteOffice(sl()));
  sl.registerLazySingleton(() => SetEmployeeOffice(sl()));
  //! Repository
  sl.registerLazySingleton<OfficesRepository>(
    () => OfficesRepositoryImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<OfficesRemoteDataSource>(
    () => OfficesRemoteDataSourceImpl(dioClient: sl()),
  );

  ///
  /// -------Departments
  ///

  sl.registerFactory(
    () => DepartmentsBloc(
      getDepartmentsAndJobs: sl(),
      addDepartment: sl(),
      deleteDepartment: sl(),
      editDepartment: sl(),
      addJob: sl(),
      editJob: sl(),
      deleteJob: sl(),
    ),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetDepartmentsAndJobs(sl()));
  sl.registerLazySingleton(() => AddDepartment(sl()));
  sl.registerLazySingleton(() => EditDepartment(sl()));
  sl.registerLazySingleton(() => DeleteDepartment(sl()));
  sl.registerLazySingleton(() => AddJob(sl()));
  sl.registerLazySingleton(() => EditJob(sl()));
  sl.registerLazySingleton(() => DeleteJob(sl()));

  //! Repository
  sl.registerLazySingleton<DepartmentsRepository>(
    () => DepartmentsRepositoryImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<DepartmentsRemoteDataSource>(
    () => DepartmentsRemoteDataSourceImpl(dioClient: sl()),
  );

  ///
  //-------- Employee
  ///

  sl.registerFactory(
    () => EmployeesBloc(deleteEmployee: sl(), getEmployees: sl()),
  );
  //! Use cases
  sl.registerLazySingleton(() => GetEmployees(sl()));
  sl.registerLazySingleton(() => DeleteEmployee(sl()));

  //! Repository
  sl.registerLazySingleton<EmployeesRepository>(
    () => EmployeesRepositoryImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<EmployeesRemoteDataSource>(
    () => EmployeesRemoteDataSourceImpl(dioClient: sl()),
  );
}
