import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/office_details.dart';
import 'package:shimmer/shimmer.dart';

class OfficeCard extends StatelessWidget {
  final OfficeDataEntity office;
  const OfficeCard({super.key, required this.office});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: theme.primaryColor.withValues(alpha: 0.35),
          width: 1.3,
        ),
      ),
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.25),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => NV.nextScreen(
          context,
          OfficeDetailsScreen(
            office: office,
            rebuild: () =>
                context.read<OfficesBloc>().add(const GetOfficesEvent()),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header: Office Icon + Name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_city_rounded,
                    color: theme.primaryColor,
                    size: 16.r,
                  ),
                  6.pw,
                  Flexible(
                    child: Text(
                      office.name ?? 'بدون اسم',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 13.r,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              // Center: Office Graphic with soft circle container
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 6.r),
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Gif(
                      image: AssetImage(AppImages.office),
                      autostart: Autostart.once,
                      fit: BoxFit.contain,
                      fps: 30,
                    ),
                  ),
                ),
              ),

              // Footer: Radius & Employee Count Chips
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Radius Chip
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 3.r),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.radar_rounded,
                          size: 12.r,
                          color: theme.primaryColor,
                        ),
                        4.pw,
                        Text(
                          '${office.radius.formatRadius} م',
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 10.r,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Employee Count Chip
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 3.r),
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.people_alt_outlined,
                          size: 12.r,
                          color: Colors.cyanAccent,
                        ),
                        4.pw,
                        Text(
                          '${office.employeeCount ?? 0} موظف',
                          style: TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 10.r,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OfficesIndicator extends StatelessWidget {
  const OfficesIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: theme.primaryColor.withValues(alpha: 0.2),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.grey.shade600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80.r,
                height: 12.r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                width: 65.r,
                height: 65.r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 45.r,
                    height: 14.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: 45.r,
                    height: 14.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
