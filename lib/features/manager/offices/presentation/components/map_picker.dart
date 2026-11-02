import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/app_snack_bar.dart';
import 'package:hr_app/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:latlong2/latlong.dart';

class MapPicker extends StatefulWidget {
  final LatLng? oldLoc;
  final double? height;
  final ValueChanged<LatLng>? onLocationChanged;

  const MapPicker({
    super.key,
    this.oldLoc,
    this.height,
    this.onLocationChanged,
  });

  @override
  State<MapPicker> createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker>
    with AutoConnectivityRestoreMixin {
  LatLng? selectedPlace;
  bool _loadingLocation = false;
  final MapController _mapController = MapController();

  @override
  void initState() {
    if (widget.oldLoc != null) selectedPlace = widget.oldLoc;
    super.initState();
  }

  @override
  void onConnectivityRestored() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _goToMyLocation() async {
    setState(() => _loadingLocation = true);

    try {
      // 1. طلب تفعيل خدمة الموقع (GPS)
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showSnack('يرجى تفعيل خدمة الموقع (GPS)');
        await Geolocator.openLocationSettings();
        return;
      }

      // 2. تحقق/اطلب الصلاحية
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showSnack('تم رفض صلاحية الوصول للموقع');
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        _showSnack('الصلاحية مرفوضة نهائياً — يرجى تفعيلها من الإعدادات');
        await Geolocator.openAppSettings();
        return;
      }

      // 3. احصل على الموقع الحالي
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );

      final myLoc = LatLng(pos.latitude, pos.longitude);

      // 4. تحريك الخريطة وتحديد الموقع
      if (!mounted) return;
      _mapController.move(myLoc, 16.0);
      context.read<OfficesBloc>().location = myLoc;
      setState(() => selectedPlace = myLoc);
      widget.onLocationChanged?.call(myLoc);
    } on Exception catch (_) {
      _showSnack('تعذّر تحديد الموقع');
    } finally {
      if (mounted) setState(() => _loadingLocation = false);
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    AppSnackBar.showError(context, msg);
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: widget.height ?? 220.h,
    child: Stack(
      children: [
        // ========== الخريطة ==========
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter:
                widget.oldLoc ??
                const LatLng(30.03433422537047, 31.214909143745903),
            initialZoom: 15.0,
            onTap: (tapPosition, point) {
              context.read<OfficesBloc>().location = point;
              setState(() => selectedPlace = point);
              widget.onLocationChanged?.call(point);
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
                    width: 80.r,
                    height: 80.r,
                    child: Icon(
                      Icons.location_on,
                      color: context.colors.error,
                      size: 40.r,
                    ),
                  ),
                ],
              ),
          ],
        ),

        // ========== زرار موقعي الحالي ==========
        Positioned(
          bottom: 12.r,
          right: 12.r,
          child: FloatingActionButton.small(
            heroTag: 'my_location_btn',
            backgroundColor: context.colors.primary,
            tooltip: 'موقعي الحالي',
            onPressed: _loadingLocation ? null : _goToMyLocation,
            child: _loadingLocation
                ? SizedBox(
                    width: 18.r,
                    height: 18.r,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Icon(
                    Icons.my_location_rounded,
                    color: Colors.white,
                    size: 20.r,
                  ),
          ),
        ),
      ],
    ),
  );
}
