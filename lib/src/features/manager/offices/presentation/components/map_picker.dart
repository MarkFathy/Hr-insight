import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:hr_app/src/core/theme/core_theme.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';

class MapPicker extends StatefulWidget {
  final LatLng? oldLoc;
  const MapPicker({super.key, this.oldLoc});

  @override
  State<MapPicker> createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  LatLng? selectedPlace;
  bool _loadingLocation = false;
  final MapController _mapController = MapController();

  @override
  void initState() {
    if (widget.oldLoc != null) selectedPlace = widget.oldLoc;
    super.initState();
  }

  Future<void> _goToMyLocation() async {
    setState(() => _loadingLocation = true);

    try {
      // 1. تأكد من تفعيل خدمة الموقع
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showSnack('خدمة الموقع غير مفعّلة');
        return;
      }

      // 2. تحقق/اطلب الصلاحية
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showSnack('تم رفض صلاحية الوصول للموقع');
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        _showSnack('الصلاحية مرفوضة نهائياً — افتح الإعدادات لتفعيلها');
        return;
      }

      // 3. احصل على الموقع الحالي
      final Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      final myLoc = LatLng(pos.latitude, pos.longitude);

      // 4. تحريك الخريطة وتحديد الموقع
      if (!mounted) return;
      _mapController.move(myLoc, 16.0);
      context.read<OfficesBloc>().location = myLoc;
      setState(() => selectedPlace = myLoc);
    } catch (e) {
      _showSnack('تعذّر تحديد الموقع');
    } finally {
      if (mounted) setState(() => _loadingLocation = false);
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E3F6B),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          // ========== الخريطة ==========
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: widget.oldLoc ??
                  const LatLng(30.03433422537047, 31.214909143745903),
              initialZoom: 15.0,
              onTap: (tapPosition, point) {
                context.read<OfficesBloc>().location = point;
                setState(() => selectedPlace = point);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.fourth_pyramid.hrapp',
              ),
              if (selectedPlace != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: selectedPlace!,
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // ========== زرار موقعي الحالي ==========
          Positioned(
            bottom: 12,
            right: 12,
            child: FloatingActionButton.small(
              heroTag: 'my_location_btn',
              backgroundColor: primaryColor,
              tooltip: 'موقعي الحالي',
              onPressed: _loadingLocation ? null : _goToMyLocation,
              child: _loadingLocation
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(
                      Icons.my_location_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
