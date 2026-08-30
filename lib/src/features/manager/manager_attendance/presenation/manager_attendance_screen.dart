import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/s_back_button.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/employee_picker_sheet.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/bloc/attendance_block.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/bloc/attendance_event.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/bloc/attendance_state.dart';
import 'package:hr_app/src/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/manager_attendance/presenation/components/monthly_signatures_calendar.dart';
import 'package:hr_app/src/injector.dart';
import 'package:shimmer/shimmer.dart';

class ManagerAttendanceScreen extends StatelessWidget {
  static const routeName = '/manager-attendance';

  const ManagerAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime signatureMonth = DateTime.now();
    int? selectedId;
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => sl<ManagerAttendanceBloc>(),
      child: BlocBuilder<ManagerAttendanceBloc, ManagerAttendanceState>(
          builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('حضور الموظفين الشهرى'),
              leading: const SBackButton(),
              centerTitle: true,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(56.r),
                  child: BlocProvider(
                    create: (context) =>
                        sl<EmployeesBloc>()..add(const GetEmployeesEvent()),
                    child: BlocBuilder<EmployeesBloc, EmployeesState>(
                      builder: (context, empState) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(16.r, 0, 16.r, 10.r),
                          child: Builder(
                            builder: (context) {
                              if (empState is EmployeesLoadingState) {
                                return Container(
                                  height: 44.r,
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.secondary.withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(14.r),
                                  ),
                                  child: Center(
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.transparent,
                                      highlightColor: theme.primaryColor,
                                      child: const Text('جاري تحميل الموظفين...'),
                                    ),
                                  ),
                                );
                              }
                              if (empState is EmployeesLoadedState) {
                                final employeesList = empState.employees.data ?? [];
                                final selectedEmp = selectedId != null
                                    ? employeesList.firstWhere(
                                        (e) => e.id == selectedId,
                                        orElse: () => const EmployeeDataEntity(),
                                      )
                                    : null;
                                return StatefulBuilder(
                                  builder: (context, changeState) {
                                    return InkWell(
                                      onTap: () {
                                        EmployeePickerSheet.show(
                                          context: context,
                                          employees: employeesList,
                                          selectedId: selectedId,
                                          showAllOption: false,
                                          onSelected: (emp) {
                                            if (emp != null) {
                                              changeState(() {
                                                selectedId = emp.id;
                                              });
                                              context
                                                  .read<ManagerAttendanceBloc>()
                                                  .add(LoadManagerAttendanceEvent(
                                                      ManagerAttendanceParams(
                                                          date: signatureMonth,
                                                          employeeId: selectedId
                                                              .toString())));
                                            }
                                          },
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(14.r),
                                      child: Container(
                                        height: 46.r,
                                        padding: EdgeInsets.symmetric(horizontal: 14.r),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.secondary,
                                          borderRadius: BorderRadius.circular(14.r),
                                          border: Border.all(
                                            color: selectedId != null
                                                ? theme.primaryColor
                                                : theme.primaryColor.withValues(alpha: 0.25),
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.person_rounded,
                                              color: theme.primaryColor,
                                              size: 20.r,
                                            ),
                                            10.pw,
                                            Expanded(
                                              child: Text(
                                                selectedEmp?.name ?? 'اختر الموظف لعرض الحضور',
                                                style: TextStyle(
                                                  color: selectedId != null
                                                      ? theme.primaryColor
                                                      : Colors.white.withValues(alpha: 0.8),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.r,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(4.r),
                                              decoration: BoxDecoration(
                                                color: theme.primaryColor.withValues(alpha: 0.12),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.keyboard_arrow_down_rounded,
                                                color: theme.primaryColor,
                                                size: 18.r,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        );
                      },
                    ),
                  )),
            ),
            body: ManagerMonthlySignaturesCalendar(
              employeeId: selectedId,
            ));
      }),
    );
  }
}
//
// class BioAuthenticationWidget extends StatefulWidget {
//   const BioAuthenticationWidget({Key? key}) : super(key: key);
//
//   @override
//   State<BioAuthenticationWidget> createState() => _BioAuthenticationWidgetState();
// }
//
// class _BioAuthenticationWidgetState extends State<BioAuthenticationWidget> {
//   BiometricStorageFile? _storage;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   Future init() async {
//     print('object');
//     _storage = await BiometricStorage().getStorage('auth', options: StorageFileInitOptions(), forceInit: true);
//     await _storage!.write(
//       'auhed',
//     );
//     final res = await _storage!.read();
//     print(_storage!.name);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: init(),
//         builder: (context, snapshot) {
//           return snapshot.connectionState == ConnectionState.waiting ? CircularProgressIndicator() : Container();
//         });
//   }
// }

// class BiometricAuthentication extends StatefulWidget {
//   const BiometricAuthentication({Key? key}) : super(key: key);

//   @override
//   State<BiometricAuthentication> createState() =>
//       _BiometricAuthenticationState();
// }

// class _BiometricAuthenticationState extends State<BiometricAuthentication> {
//   final LocalAuthentication _localAuthentication = LocalAuthentication();
//   bool _canCheckBiometric = false;
//   String _authorizedOrNot = "Not Authorized";
//   List<BiometricType> _availableBiometricTypes = [];

//   Future<void> _checkBiometric() async {
//     bool canCheckBiometric = false;
//     try {
//       canCheckBiometric = await _localAuthentication.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       print(e);
//     }

//     if (!mounted) return;

//     setState(() {
//       _canCheckBiometric = canCheckBiometric;
//     });
//   }

//   Future<void> _getListOfBiometricTypes() async {
//     List<BiometricType>? listofBiometrics;
//     try {
//       listofBiometrics = await _localAuthentication.getAvailableBiometrics();
//       // if (!listofBiometrics.contains(BiometricType.face)) listofBiometrics.add(BiometricType.face);
//     } on PlatformException catch (e) {
//       print(e);
//     }

//     if (!mounted) return;

//     setState(() {
//       _availableBiometricTypes = listofBiometrics!;
//     });
//   }

//   Future<void> _authorizeNow() async {
//     bool isAuthorized = false;
//     try {
//       isAuthorized = await _localAuthentication.authenticate(
//           localizedReason: "Please authenticate to complete your transaction",
//           options: const AuthenticationOptions(
//               biometricOnly: false, stickyAuth: true, useErrorDialogs: true)
//           // useErrorDialogs: true,
//           // stickyAuth: true,

//           );
//     } on PlatformException catch (e) {
//       print(e);
//     }

//     if (!mounted) return;

//     setState(() {
//       if (isAuthorized) {
//         _authorizedOrNot = "Authorized";
//       } else {
//         _authorizedOrNot = "Not Authorized";
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text("Can we check Biometric : $_canCheckBiometric"),
//           ElevatedButton(
//             onPressed: _checkBiometric,
//             child: const Text("Check Biometric"),
//           ),
//           Text("List Of Biometric : ${_availableBiometricTypes.toString()}"),
//           ElevatedButton(
//             onPressed: _getListOfBiometricTypes,
//             child: const Text("List of Biometric Types"),
//           ),
//           Text("Authorized : $_authorizedOrNot"),
//           ElevatedButton(
//             onPressed: _authorizeNow,
//             child: const Text("Authorize now"),
//           ),
//         ]);
//   }
// }
