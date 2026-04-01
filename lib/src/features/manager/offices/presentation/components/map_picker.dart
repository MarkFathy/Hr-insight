import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';

class MapPicker extends StatefulWidget {
  final LatLng? oldLoc;
  const MapPicker({super.key, this.oldLoc});

  @override
  State<MapPicker> createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng? selectedPlace;
  @override
  void initState() {
    if (widget.oldLoc != null) selectedPlace = widget.oldLoc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GoogleMap(
        mapType: MapType.normal,
        mapToolbarEnabled: true,
        initialCameraPosition: CameraPosition(
          target: widget.oldLoc ??
              const LatLng(30.03433422537047, 31.214909143745903),
          zoom: 15.0,
        ),
        onTap: (point) {
          // print(point);
          context.read<OfficesBloc>().location = point;
          selectedPlace = point;
          setState(() {});
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        markers: {
          if (selectedPlace != null)
            Marker(
              markerId: const MarkerId('selectedPlace'),
              position: selectedPlace!,
              icon: BitmapDescriptor.defaultMarker,
            )
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
