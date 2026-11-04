import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:latlong2/latlong.dart';

class MapViewScreen extends StatefulWidget {
  final LatLng location;

  const MapViewScreen({required this.location, super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen>
    with AutoConnectivityRestoreMixin {
  @override
  void onConnectivityRestored() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: FlutterMap(
      options: MapOptions(initialCenter: widget.location, initialZoom: 15),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.fourth_pyramid.hrapp',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: widget.location,
              width: 80,
              height: 80,
              child: const Icon(Icons.location_on, color: Colors.red, size: 40),
            ),
          ],
        ),
      ],
    ),
  );
}
