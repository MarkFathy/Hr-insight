import 'package:flutter/material.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/home/presentation/components/grid_item.dart';
import 'package:hr_app/src/features/employee/leaves/presentation/components/leave_form.dart';

class EmployeeGrid extends StatelessWidget {
  const EmployeeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.1,
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      padding: const EdgeInsets.all(15),
      shrinkWrap: true,
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      children: [
        GridItem(
          asset: AppImages.attendance,
          title: 'الحضور و الإنصراف',
          onTap: () => NV.nextScreenNamed(context, '/attendance'),
        ),
        GridItem(
            asset: AppImages.leaves,
            title: 'طلبات الأجازات',
            onTap: () => NV.nextScreenNamed(context, '/leaves')),
        GridItem(
          asset: AppImages.leave,
          title: 'طلب إجازة',
          onTap: () => showDialog(
            context: context,
            builder: (context) => const LeaveForm(),
          ),
        ),
      ],
    );
  }
}
