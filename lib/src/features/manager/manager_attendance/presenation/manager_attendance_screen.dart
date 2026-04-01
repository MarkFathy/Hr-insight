import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/shared_widgets/search_fied.dart';
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
    String query = '';
    return BlocProvider(
      create: (context) => sl<ManagerAttendanceBloc>(),
      child: BlocBuilder<ManagerAttendanceBloc, ManagerAttendanceState>(
          builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('حضور الموظفين الشهرى'),
              centerTitle: true,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: BlocProvider(
                    create: (context) =>
                        sl<EmployeesBloc>()..add(const GetEmployeesEvent()),
                    child: BlocBuilder<EmployeesBloc, EmployeesState>(
                      builder: (context, state) {
                        return ListTile(
                          leading: const Icon(Icons.person),
                          title: Builder(
                            builder: (context) {
                              if (state is EmployeesLoadingState) {
                                return DropdownButton(
                                    hint: Shimmer.fromColors(
                                        baseColor: Colors.transparent,
                                        highlightColor: theme.primaryColor,
                                        child: const Text('الموظفين')),
                                    isExpanded: true,
                                    underline: const Center(),
                                    items: const [],
                                    onChanged: (val) {});
                              }
                              if (state is EmployeesLoadedState) {
                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: StatefulBuilder(
                                      builder: (context, changeState) {
                                    return DropdownButton(
                                      dropdownColor: MyColors.greyColor,
                                        items: [

                                          DropdownMenuItem(
                                              value: null,
                                              enabled: false,
                                              child: SearchField(
                                                  onChanged: (value) {
                                                    query = value!;

                                                    changeState(() {});
                                                  },
                                                  hint: 'اسم الموظف')),
                                          ...state.employees.data!
                                              .where((element) => element.name!
                                                  .startsWith(query))
                                              .map((e) => DropdownMenuItem(
                                                  value: e.id,
                                                  // alignment: Alignment.center,
                                                  child: Text(e.name!)))
                                              .toList()
                                        ],
                                        underline: const Center(),
                                        hint: const Text('اختر الموظف'),
                                        isExpanded: true,
                                        value: selectedId,
                                        onChanged: (value) {
                                          selectedId = value;
                                          context
                                              .read<ManagerAttendanceBloc>()
                                              .add(LoadManagerAttendanceEvent(
                                                  ManagerAttendanceParams(
                                                      date: signatureMonth,
                                                      employeeId: selectedId
                                                          .toString())));
                                        });
                                  }),
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
