// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/employee_details.dart';
import 'package:shimmer/shimmer.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeDataEntity employee;
  final bool inOffice;
  const EmployeeCard(
      {super.key, required this.employee, this.inOffice = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onLongPress: () async {
        bool? confirm = await _showDeleteConfirmationDialog(context);
        if (confirm == true) {
          if (kDebugMode) {
            print("wwwwwwwwwwwwwwwwww");
          }
          context.read<EmployeesBloc>().add(DeleteEmployeeEvent(employee.id!));
          if (kDebugMode) {
            print("Doneeeeeeee");
          }
        }
      },
      onTap: () {
        if (!inOffice) {
          NV.nextScreen(
              context,
              EmployeeDetailsScreen(
                employee: employee,
                rebuild: () {
                  context.read<EmployeesBloc>().add(const GetEmployeesEvent());
                },
              ));
        }
      },
      child: Material(
        color: theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: theme.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: DefaultTextStyle(
            style: theme.textTheme.labelMedium!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        employee.name!,
                        style: theme.textTheme.labelLarge!
                            .copyWith(color: theme.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        employee.email!,
                        style: theme.textTheme.labelSmall!
                            .copyWith(color: theme.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // 10.ph,
                if (!inOffice) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'المكتب',
                        style: theme.textTheme.labelLarge!
                            .copyWith(color: theme.primaryColor),
                      ),
                      5.pw,
                      employee.office != null
                          ? Text(employee.office!.name!)
                          : const Text('خالى')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('القسم',
                          style: theme.textTheme.labelLarge!
                              .copyWith(color: theme.primaryColor)),
                      5.pw,
                      employee.department == null
                          ? const Text('خالى')
                          : Text(employee.department!.name!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('الوظيفة',
                          style: theme.textTheme.labelLarge!
                              .copyWith(color: theme.primaryColor)),
                      5.pw,
                      employee.job != null
                          ? Text(employee.job!.title!)
                          : const Text('خالى')
                    ],
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeeIndicator extends StatelessWidget {
  const EmployeeIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.secondary,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: theme.cardColor,
              direction: ShimmerDirection.rtl,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 60, right: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade700,
                          blurRadius: 3,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.inner)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(height: 10),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: theme.cardColor,
              direction: ShimmerDirection.rtl,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 30, right: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade700,
                          blurRadius: 3,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.inner)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(height: 10),
              ),
            ),
            // Spacer(),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: theme.cardColor,
              direction: ShimmerDirection.rtl,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade700,
                          blurRadius: 3,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.inner)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(height: 7),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: theme.cardColor,
              direction: ShimmerDirection.rtl,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade700,
                          blurRadius: 3,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.inner)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(height: 7),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: theme.cardColor,
              direction: ShimmerDirection.rtl,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade700,
                          blurRadius: 3,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.inner)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(height: 7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool?> _showDeleteConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('تأكيد الحذف'),
      content: const Text('هل أنت متأكد أنك تريد حذف هذا الموظف؟'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('إلغاء'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('حذف'),
        ),
      ],
    ),
  );
}
