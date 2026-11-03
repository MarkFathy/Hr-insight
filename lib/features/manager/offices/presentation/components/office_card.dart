import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/constants/app_images.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/utils/navigation_helper.dart';
import 'package:hr_app/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/features/manager/offices/presentation/components/office_details.dart';
import 'package:shimmer/shimmer.dart';

class OfficeCard extends StatelessWidget {
  final OfficeDataEntity office;
  const OfficeCard({required this.office, super.key});

  @override
  Widget build(BuildContext context) => Material(
    color: context.colors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(
        color: context.colors.primary.withValues(alpha: 0.35),
        width: 1.3,
      ),
    ),
    elevation: 4,
    shadowColor: Colors.black.withValues(alpha: 0.25),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () => unawaited(
        NavigationHelper.nextScreen<void>(
          context,
          OfficeDetailsScreen(
            office: office,
            rebuild: () =>
                context.read<OfficesBloc>().add(const GetOfficesEvent()),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Header: Office Icon + Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_city_rounded,
                  color: context.colors.primary,
                  size: 16,
                ),
                6.pw,
                Flexible(
                  child: Text(
                    office.name ?? 'بدون اسم',
                    style: context.typography.titleSmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 13,
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
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: context.colors.background.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    AppImages.office,
                    fit: BoxFit.contain,
                    cacheWidth: 150,
                    cacheHeight: 150,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.radar_rounded,
                        size: 12,
                        color: context.colors.primary,
                      ),
                      4.pw,
                      Text(
                        '${office.radius.formatRadius} م',
                        style: TextStyle(
                          color: context.colors.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Employee Count Chip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.people_alt_outlined,
                        size: 12,
                        color: Colors.cyanAccent,
                      ),
                      4.pw,
                      Text(
                        '${office.employeeCount ?? 0} موظف',
                        style: const TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 10,
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

class OfficesIndicator extends StatelessWidget {
  const OfficesIndicator({super.key});

  @override
  Widget build(BuildContext context) => Material(
    color: context.colors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: context.colors.primary.withValues(alpha: 0.2)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Container(
                  width: 45,
                  height: 14,
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
