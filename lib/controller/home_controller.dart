import 'dart:async';
import 'dart:developer';

import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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
  RxString userAddress = ''.obs;
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

  void onTapWhereToGoTab(int index,BuildContext context){

    if(index == 0){
      context.push(RouteConstant.destination);
    }

  }


  Future<void> getAddress(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

    Placemark place = placemarks.first;
    searchController.value.text =
        "${place.street.toString()}, ${place.locality.toString()}, ${place.country.toString()}";

    log(place.street.toString());
    log(place.locality.toString());
    log(place.country.toString());
  }

  void onTapSavedPlaces(BuildContext context) {
    context.push(RouteConstant.savedPlaces);
  }
  void onTapSearchAddress(BuildContext context) {
    context.push(RouteConstant.searchAddress);
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
    getAddress(currentLocation.value.latitude, currentLocation.value.longitude);
    updateCamera();
    update();

    log('currentLocation.value==> ${currentLocation.value}');
  }
}
