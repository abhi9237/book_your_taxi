import 'dart:async';
import 'dart:developer';

import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  Rx<LatLng> currentLocation = LatLng(0, 0).obs;
  final Rx<TextEditingController> searchController =
      TextEditingController().obs;
  RxInt selectedIndex = 0.obs;
  List<Map<String, dynamic>> whereToGoList = [
    {
      'icon': Icons.location_on_outlined,
      'title': 'Destination',
      'subTitle': 'Enter Destination',
    },
    {'icon': Icons.business, 'title': 'Office', 'subTitle': '35 km away'},
  ];

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    // updateCamera();
  }

  void onTapSavedPlaces(BuildContext context) {
    context.push(RouteConstant.savedPlaces);
  }

  void onTapSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  Future<void> updateCamera() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(await setCameraLocation()),
    );
  }

  Future<CameraPosition> setCameraLocation() async {
    return CameraPosition(
      target: currentLocation.value,
      zoom: 19.151926040649414,
    );
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }
    Position position = await Geolocator.getCurrentPosition();
    currentLocation.value = LatLng(position.latitude, position.longitude);
    updateCamera();
    update();

    log('currentLocation.value==> ${currentLocation.value}');
  }
}
