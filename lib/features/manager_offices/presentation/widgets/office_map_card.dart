import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/features/manager_offices/presentation/widgets/map_view.dart';
import 'package:latlong2/latlong.dart';

/// Renders the office geographic location map preview alongside radius & employee stat tiles.
class OfficeMapCard extends StatelessWidget {
  final double? lat;
  final double? lng;
  final num? radius;
  final int employeeCount;

  const OfficeMapCard({
    required this.lat,
    required this.lng,
    required this.radius,
    required this.employeeCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (lat != null && lng != null)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: size.height * 0.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: context.colors.primary.withValues(alpha: 0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: MapViewScreen(
                key: ValueKey('$lat-$lng'),
                location: LatLng(lat!, lng!),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: _OfficeInfoTile(
                  icon: Icons.radar_rounded,
                  title: 'نطاق التوقيع',
                  value: '${radius.formatRadius} متر',
                  color: context.colors.primary,
                ),
              ),
              10.pw,
              Expanded(
                child: _OfficeInfoTile(
                  icon: Icons.people_alt_rounded,
                  title: 'الموظفين المعينين',
                  value: '$employeeCount موظف',
                  color: Colors.cyanAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OfficeInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _OfficeInfoTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colors.secondary.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          10.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 11.5,
                  ),
                ),
                2.ph,
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
