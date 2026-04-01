import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewScreen extends StatelessWidget {
  final LatLng location;

  const MapViewScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: location,
          zoom: 15,
        ),
        markers: {
          Marker(markerId: const MarkerId('office-Loc'), position: location)
        },
        onMapCreated: (GoogleMapController controller) {
          // _controller.complete(controller);
        },
      ),
    );
  }
}
