import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';

class MapPicker extends StatefulWidget {
  final LatLng? oldLoc;
  const MapPicker({super.key, this.oldLoc});

  @override
  State<MapPicker> createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  LatLng? selectedPlace;
  final MapController _mapController = MapController();

  @override
  void initState() {
    if (widget.oldLoc != null) selectedPlace = widget.oldLoc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: widget.oldLoc ??
                  const LatLng(30.03433422537047, 31.214909143745903),
              initialZoom: 15.0,
              onTap: (tapPosition, point) {
                context.read<OfficesBloc>().location = point;
                setState(() {
                  selectedPlace = point;
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'fourth_pyramid.hr_insightapp',
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
        ],
      ),
    );
  }
}
