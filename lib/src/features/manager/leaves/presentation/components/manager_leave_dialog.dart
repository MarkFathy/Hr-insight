import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';
import 'package:hr_app/src/features/manager/leaves/presentation/bloc/bloc.dart';
import 'package:intl/intl.dart';

class ManagerLeaveDialog extends StatelessWidget {
  final LeavesDataEntity leave;
  final EmployeeDataEntity? employeeDataEntity;
  final BuildContext ctx;

  const ManagerLeaveDialog({
    super.key,
    required this.leave,
    required this.employeeDataEntity,
    required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPending = leave.status == 'pending' || leave.status == null;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: theme.primaryColor.withValues(alpha: 0.3),
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
              // Dialog Header with Close Button
              Padding(
                padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 8.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.description_rounded,
                            color: theme.primaryColor,
                            size: 20.r,
                          ),
                        ),
                        10.pw,
                        Text(
                          'تفاصيل طلب الإجازة',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.r,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => NV.pop(context),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.white.withValues(alpha: 0.7),
                          size: 20.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // Employee Profile Card
              if (employeeDataEntity != null)
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: theme.primaryColor.withValues(alpha: 0.15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50.r,
                          height: 50.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.primaryColor.withValues(alpha: 0.15),
                            border: Border.all(
                              color: theme.primaryColor.withValues(alpha: 0.6),
                              width: 1.5,
                            ),
                          ),
                          child: ClipOval(
                            child: employeeDataEntity!.image.toValidImageUrl.isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl: employeeDataEntity!.image.toValidImageUrl,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      color: theme.colorScheme.secondary,
                                      child: Center(
                                        child: SizedBox(
                                          width: 18.r,
                                          height: 18.r,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: theme.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (_, __, ___) => Icon(
                                      Icons.person_rounded,
                                      color: theme.primaryColor,
                                      size: 28.r,
                                    ),
                                  )
                                : Icon(
                                    Icons.person_rounded,
                                    color: theme.primaryColor,
                                    size: 28.r,
                                  ),
                          ),
                        ),
                        12.pw,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                employeeDataEntity!.name ?? 'بدون اسم',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.r,
                                ),
                              ),
                              4.ph,
                              if (employeeDataEntity!.department?.name != null)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.r),
                                  child: Row(
                                    children: [
                                      Text(
                                        'القسم: ',
                                        style: TextStyle(
                                          color: theme.primaryColor,
                                          fontSize: 12.r,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          employeeDataEntity!.department!.name!,
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.85),
                                            fontSize: 12.r,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (employeeDataEntity!.job?.title != null)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.r),
                                  child: Row(
                                    children: [
                                      Text(
                                        'الوظيفة: ',
                                        style: TextStyle(
                                          color: theme.primaryColor,
                                          fontSize: 12.r,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          employeeDataEntity!.job!.title!,
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.85),
                                            fontSize: 12.r,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (employeeDataEntity!.office?.name != null)
                                Row(
                                  children: [
                                    Text(
                                      'المكتب: ',
                                      style: TextStyle(
                                        color: theme.primaryColor,
                                        fontSize: 12.r,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        employeeDataEntity!.office!.name!,
                                        style: TextStyle(
                                          color: Colors.white.withValues(alpha: 0.85),
                                          fontSize: 12.r,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              // Leave Details Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Column(
                  children: [
                    _buildInfoRow(
                      context: context,
                      theme: theme,
                      icon: Icons.calendar_today_rounded,
                      title: 'تاريخ الطلب',
                      value: leave.dayDate != null
                          ? DateFormat.yMMMMd('ar').format(leave.dayDate!)
                          : '-',
                    ),
                    8.ph,
                    _buildInfoRow(
                      context: context,
                      theme: theme,
                      icon: Icons.schedule_rounded,
                      title: 'من',
                      value: leave.from != null
                          ? DateFormat('y-MM-dd  hh:mm a', 'ar').format(leave.from!)
                          : '-',
                    ),
                    8.ph,
                    _buildInfoRow(
                      context: context,
                      theme: theme,
                      icon: Icons.schedule_send_rounded,
                      title: 'إلى',
                      value: leave.to != null
                          ? DateFormat('y-MM-dd  hh:mm a', 'ar').format(leave.to!)
                          : '-',
                    ),
                    8.ph,
                    _buildInfoRow(
                      context: context,
                      theme: theme,
                      icon: Icons.category_rounded,
                      title: 'نوع الإجازة',
                      value: leave.leaveType ?? 'إجازة عادية',
                    ),
                    8.ph,
                    _buildInfoRow(
                      context: context,
                      theme: theme,
                      icon: Icons.info_outline_rounded,
                      title: 'حالة الطلب',
                      value: '',
                      customValueWidget: _buildStatusBadge(leave.status),
                    ),
                  ],
                ),
              ),

              16.ph,

              // Action Buttons (Approve / Reject)
              if (isPending)
                Padding(
                  padding: EdgeInsets.fromLTRB(16.r, 0, 16.r, 16.r),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12.r),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            elevation: 4,
                          ),
                          onPressed: () {
                            ctx.read<ManagerLeavesBloc>().add(SetLeaveEvent(
                                SetLeaveParams(id: leave.id, status: "approved")));
                            NV.pop(context);
                          },
                          icon: const Icon(Icons.check_circle_rounded, size: 20),
                          label: Text(
                            'قبول الطلب',
                            style: TextStyle(
                              fontSize: 14.r,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      12.pw,
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade700,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12.r),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            elevation: 4,
                          ),
                          onPressed: () {
                            ctx.read<ManagerLeavesBloc>().add(SetLeaveEvent(
                                SetLeaveParams(id: leave.id, status: "rejected")));
                            NV.pop(context);
                          },
                          icon: const Icon(Icons.cancel_rounded, size: 20),
                          label: Text(
                            'رفض الطلب',
                            style: TextStyle(
                              fontSize: 14.r,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.fromLTRB(16.r, 0, 16.r, 16.r),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.r),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      onPressed: () => NV.pop(context),
                      child: const Text('إغلاق', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildInfoRow({
    required BuildContext context,
    required ThemeData theme,
    required IconData icon,
    required String title,
    required String value,
    Widget? customValueWidget,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 10.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 18.r,
                color: theme.primaryColor,
              ),
              8.pw,
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 13.r,
                ),
              ),
            ],
          ),
          customValueWidget ??
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.r,
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String? status) {
    Color fg;
    String text;
    IconData icon;

    switch (status) {
      case 'approved':
        fg = Colors.green;
        text = 'تم القبول';
        icon = Icons.check_circle_rounded;
        break;
      case 'rejected':
        fg = Colors.red;
        text = 'تم الرفض';
        icon = Icons.cancel_rounded;
        break;
      default:
        fg = Colors.orange;
        text = 'قيد المراجعة';
        icon = Icons.hourglass_top_rounded;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16.r, color: fg),
        6.pw,
        Text(
          text,
          style: TextStyle(
            color: fg,
            fontWeight: FontWeight.bold,
            fontSize: 13.r,
          ),
        ),
      ],
    );
  }
}
