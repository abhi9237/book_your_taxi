import 'package:book_your_taxi/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMapView extends StatelessWidget {
  final HomeController homeController;
  const HomeMapView({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      compassEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: homeController.currentLocation.value,
        zoom: 10.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        homeController.mapController.complete(controller);
      },
    );
  }
}
