import 'package:flutter/material.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/home/presentation/components/grid_item.dart';

class ManagerGrid extends StatelessWidget {
  const ManagerGrid({super.key});

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
          title: 'الحضور والإنصراف',
          onTap: () => NV.nextScreenNamed(context, '/manager-attendance'),
        ),
        GridItem(
          asset: AppImages.leaves,
          title: 'طلبات الأجازات',
          onTap: () => NV.nextScreenNamed(context, '/manager-leaves'),
        ),
        GridItem(
          asset: AppImages.office,
          title: 'المكاتب',
          onTap: () => NV.nextScreenNamed(context, '/offices'),
        ),
        GridItem(
          asset: AppImages.employee,
          title: 'الموظفين',
          onTap: () => NV.nextScreenNamed(context, '/employees'),
        ),
        GridItem(
          asset: AppImages.departments,
          title: 'الأقسام و الوظائف',
          onTap: () => NV.nextScreenNamed(context, '/departments'),
        ),
      ],
    );
  }
}
