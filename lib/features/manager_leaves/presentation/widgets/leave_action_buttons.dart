import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/manager_leaves/domain/entities/set_leave_param.dart';
import 'package:hr_app/features/manager_leaves/presentation/bloc/manager_leaves_bloc.dart';

/// Accept and Reject action buttons for manager leave authorization.
class LeaveActionButtons extends StatelessWidget {
  final int? leaveId;
  final bool isPending;
  final BuildContext blocContext;

  const LeaveActionButtons({
    required this.leaveId,
    required this.isPending,
    required this.blocContext,
    super.key,
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
