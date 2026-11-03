import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/features/employee/leaves/presentation/bloc/bloc.dart'
    as emp_leaves;
import 'package:hr_app/features/manager/leaves/domain/entities/set_leave_param.dart';
import 'package:hr_app/features/manager/leaves/presentation/bloc/bloc.dart';
import 'package:intl/intl.dart';

class ManagerLeaveDialog extends StatefulWidget {
  final LeavesDataEntity leave;
  final EmployeeDataEntity? employeeDataEntity;
  final BuildContext ctx;

  const ManagerLeaveDialog({
    required this.leave,
    required this.employeeDataEntity,
    required this.ctx,
    super.key,
  });

  @override
  State<ManagerLeaveDialog> createState() => _ManagerLeaveDialogState();
}

class _ManagerLeaveDialogState extends State<ManagerLeaveDialog>
    with AutoConnectivityRestoreMixin {
  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) {
    final leave = widget.leave;
    final employeeDataEntity = widget.employeeDataEntity;
    final ctx = widget.ctx;
    final colors = context.colors;
    final typography = context.typography;
    final isPending = leave.status == 'pending' || leave.status == null;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: colors.primary.withValues(alpha: 0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Dialog Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colors.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.description_rounded,
                            color: colors.primary,
                            size: 20,
                          ),
                        ),
                        10.pw,
                        Text(
                          'تفاصيل طلب الإجازة',
                          style: typography.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => NavigationHelper.pop(context),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.white.withValues(alpha: 0.7),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // Employee Profile Section
              if (employeeDataEntity != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: _EmployeeProfileCard(employee: employeeDataEntity),
                ),

              // Leave Details Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _LeaveDetailsSection(leave: leave),
              ),

              16.ph,

              // Action Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: _LeaveActionButtons(
                  leaveId: leave.id,
                  isPending: isPending,
                  blocContext: ctx,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmployeeProfileCard extends StatelessWidget {
  final EmployeeDataEntity employee;

  const _EmployeeProfileCard({required this.employee});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.secondary.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.primary.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.primary.withValues(alpha: 0.15),
              border: Border.all(
                color: colors.primary.withValues(alpha: 0.6),
                width: 1.5,
              ),
            ),
            child: ClipOval(
              child: employee.image.toValidImageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: employee.image.toValidImageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => ColoredBox(
                        color: colors.secondary,
                        child: Center(
                          child: SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colors.primary,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (_, _, _) => Icon(
                        Icons.person_rounded,
                        color: colors.primary,
                        size: 28,
                      ),
                    )
                  : Icon(Icons.person_rounded, color: colors.primary, size: 28),
            ),
          ),
          12.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.name ?? 'بدون اسم',
                  style: typography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                4.ph,
                if (employee.department?.name != null)
                  _buildEmployeeMetaRow(
                    'القسم: ',
                    employee.department!.name!,
                    colors,
                  ),
                if (employee.job?.title != null)
                  _buildEmployeeMetaRow(
                    'الوظيفة: ',
                    employee.job!.title!,
                    colors,
                  ),
                if (employee.office?.name != null)
                  _buildEmployeeMetaRow(
                    'المكتب: ',
                    employee.office!.name!,
                    colors,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeMetaRow(String label, String value, AppColors colors) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: colors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}

class _LeaveDetailsSection extends StatelessWidget {
  final LeavesDataEntity leave;

  const _LeaveDetailsSection({required this.leave});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      _LeaveInfoRow(
        icon: Icons.calendar_today_rounded,
        title: 'تاريخ الطلب',
        value: leave.dayDate != null
            ? DateFormat.yMMMMd('ar').format(leave.dayDate!)
            : '-',
      ),
      8.ph,
      _LeaveInfoRow(
        icon: Icons.schedule_rounded,
        title: 'من',
        value: leave.from != null
            ? DateFormat('y-MM-dd  hh:mm a', 'ar').format(leave.from!)
            : '-',
      ),
      8.ph,
      _LeaveInfoRow(
        icon: Icons.schedule_send_rounded,
        title: 'إلى',
        value: leave.to != null
            ? DateFormat('y-MM-dd  hh:mm a', 'ar').format(leave.to!)
            : '-',
      ),
      8.ph,
      _LeaveInfoRow(
        icon: Icons.category_rounded,
        title: 'نوع الإجازة',
        value: emp_leaves.LeaveType.toArabic(leave.leaveType),
      ),
      8.ph,
      _LeaveInfoRow(
        icon: Icons.info_outline_rounded,
        title: 'حالة الطلب',
        value: '',
        customValueWidget: _LeaveStatusBadge(status: leave.status),
      ),
    ],
  );
}

class _LeaveInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Widget? customValueWidget;

  const _LeaveInfoRow({
    required this.icon,
    required this.title,
    required this.value,
    this.customValueWidget,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colors.secondary.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: colors.primary),
              8.pw,
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          customValueWidget ??
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
        ],
      ),
    );
  }
}

class _LeaveStatusBadge extends StatelessWidget {
  final String? status;

  const _LeaveStatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (Color fg, String text, IconData icon) = switch (status) {
      'approved' => (colors.success, 'تم القبول', Icons.check_circle_rounded),
      'rejected' => (colors.error, 'تم الرفض', Icons.cancel_rounded),
      _ => (colors.warning, 'قيد المراجعة', Icons.hourglass_top_rounded),
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: fg),
        6.pw,
        Text(
          text,
          style: TextStyle(
            color: fg,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _LeaveActionButtons extends StatelessWidget {
  final int? leaveId;
  final bool isPending;
  final BuildContext blocContext;

  const _LeaveActionButtons({
    required this.leaveId,
    required this.isPending,
    required this.blocContext,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (isPending) {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.success,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 4,
              ),
              onPressed: () {
                blocContext.read<ManagerLeavesBloc>().add(
                  SetLeaveEvent(
                    SetLeaveParams(id: leaveId, status: 'approved'),
                  ),
                );
                NavigationHelper.pop(context);
              },
              icon: const Icon(Icons.check_circle_rounded, size: 20),
              label: const Text(
                'قبول الطلب',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          12.pw,
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.error,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 4,
              ),
              onPressed: () {
                blocContext.read<ManagerLeavesBloc>().add(
                  SetLeaveEvent(
                    SetLeaveParams(id: leaveId, status: 'rejected'),
                  ),
                );
                NavigationHelper.pop(context);
              },
              icon: const Icon(Icons.cancel_rounded, size: 20),
              label: const Text(
                'رفض الطلب',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () => NavigationHelper.pop(context),
        child: const Text('إغلاق', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
