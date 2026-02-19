import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/common/place_model.dart';
import '../presentation/search_address/repo/search_repository.dart';

class SearchAddressController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  final SearchRepository service = SearchRepository();

  List<PlaceModel> results = [];
  RxBool isLoading = false.obs;

  Future<void> search(String address) async {
    if (address.isEmpty) {
      results.clear();
      return;
    }
    List<Location> locations = await locationFromAddress(address);
    if (locations.isNotEmpty) {
      Location location = locations.first;
      LatLng latLng = LatLng(location.latitude, location.longitude);
      await searchAddress(latLng: latLng);
    }

    update();
  }

  Future searchAddress({required LatLng latLng}) async {
    try {
      isLoading.value = true;
      results = await service.searchAddress(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      );
    } catch (e) {
      log(' Error==:>${e.toString()}');
    } finally {
      isLoading.value = false;
      update();
    }

    update();
  }
}
