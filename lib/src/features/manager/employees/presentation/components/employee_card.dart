import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/manager/employees/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/employees/presentation/components/employee_details.dart';
import 'package:shimmer/shimmer.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeDataEntity employee;
  final bool inOffice;
  const EmployeeCard({
    required this.employee, super.key,
    this.inOffice = false,
  });

  @override
  Widget build(BuildContext context) {
    final validImageUrl = employee.image.toValidImageUrl;

    return InkWell(
      onLongPress: () async {
        final confirm = await _showDeleteConfirmationDialog(context);
        if ((confirm ?? false) && context.mounted) {
          context.read<EmployeesBloc>().add(DeleteEmployeeEvent(employee.id!));
        }
      },
      onTap: () {
        if (!inOffice) {
          unawaited(
            NavigationHelper.nextScreen<void>(
              context,
              EmployeeDetailsScreen(
                employee: employee,
                rebuild: () {
                  context.read<EmployeesBloc>().add(const GetEmployeesEvent());
                },
              ),
            ),
          );
        }
      },
      child: Material(
        color: context.colors.surface,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.colors.primary.withValues(alpha: 0.25),
          ),
          borderRadius: context.radius.mdBorder,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 38.r,
                    height: 38.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.colors.primary,
                        width: 1.5,
                      ),
                    ),
                    child: ClipOval(
                      child: validImageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: validImageUrl,
                              fit: BoxFit.cover,
                              placeholder: (_, _) => Icon(
                                Icons.person,
                                color: context.colors.primary,
                                size: 22.r,
                              ),
                              errorWidget: (_, _, _) => Icon(
                                Icons.person,
                                color: context.colors.primary,
                                size: 22.r,
                              ),
                            )
                          : Icon(
                              Icons.person,
                              color: context.colors.primary,
                              size: 22.r,
                            ),
                    ),
                  ),
                  8.pw,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          employee.name ?? '',
                          style: context.typography.titleSmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.r,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          employee.email ?? '',
                          style: context.typography.bodySmall.copyWith(
                            color: Colors.white.withValues(alpha: 0.5),
                            fontSize: 10.r,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (!inOffice) ...[
                Divider(
                  height: 12.r,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
                _EmployeeInfoRow(
                  label: 'المكتب',
                  value: employee.office?.name ?? 'غير محدد',
                  isSet: employee.office != null,
                ),
                _EmployeeInfoRow(
                  label: 'القسم',
                  value: employee.department?.name ?? 'غير محدد',
                  isSet: employee.department != null,
                ),
                _EmployeeInfoRow(
                  label: 'الوظيفة',
                  value: employee.job?.title ?? 'غير محدد',
                  isSet: employee.job != null,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _EmployeeInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isSet;

  const _EmployeeInfoRow({
    required this.label,
    required this.value,
    required this.isSet,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 1.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: context.typography.bodySmall.copyWith(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 10.r,
              ),
            ),
            5.pw,
            Flexible(
              child: Text(
                value,
                style: TextStyle(
                  color: isSet ? context.colors.primary : Colors.white.withValues(alpha: 0.4),
                  fontSize: 10.r,
                  fontWeight: isSet ? FontWeight.w600 : FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}

class EmployeeIndicator extends StatelessWidget {
  const EmployeeIndicator({super.key});

  @override
  Widget build(BuildContext context) => Material(
      color: context.colors.surface,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colors.primary),
        borderRadius: context.radius.smBorder,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: context.colors.surface,
              direction: ShimmerDirection.rtl,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 60,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700,
                      blurRadius: 3,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                  borderRadius: context.radius.smBorder,
                ),
                child: const SizedBox(height: 10),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: context.colors.surface,
              direction: ShimmerDirection.rtl,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700,
                      blurRadius: 3,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                  borderRadius: context.radius.smBorder,
                ),
                child: const SizedBox(height: 7),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: context.colors.surface,
              direction: ShimmerDirection.rtl,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700,
                      blurRadius: 3,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                  borderRadius: context.radius.smBorder,
                ),
                child: const SizedBox(height: 7),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: context.colors.surface,
              direction: ShimmerDirection.rtl,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700,
                      blurRadius: 3,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                  borderRadius: context.radius.smBorder,
                ),
                child: const SizedBox(height: 7),
              ),
            ),
          ],
        ),
      ),
    );
}

Future<bool?> _showDeleteConfirmationDialog(BuildContext context) => showDialog<bool>(
    context: context,
    builder: (dialogCtx) => AlertDialog(
      backgroundColor: dialogCtx.colors.surface,
      title: const Text('تأكيد الحذف'),
      content: const Text('هل أنت متأكد أنك تريد حذف هذا الموظف؟'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogCtx).pop(false),
          child: const Text('إلغاء'),
        ),
        TextButton(
          onPressed: () => Navigator.of(dialogCtx).pop(true),
          child: const Text('حذف'),
        ),
      ],
    ),
  );
