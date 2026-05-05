import 'package:book_your_taxi/common/common_bottom_sheet.dart';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../common/exception.dart';
import '../service/location_service/location_service.dart';

class LocationController extends GetxController {
  BuildContext context;
  final String comingFrom;
  LocationController({required this.context, required this.comingFrom});

  @override
  void onInit() {
    onTapAllowLocationAccess();
    super.onInit();
  }

  //
  Future<bool> onTapAllowLocationAccess() async {
    try {
      await LocationService.getCurrentLocation();
      if (context.mounted) {
        if (comingFrom == 'driver') {
          context.go(RouteConstant.driverBottomNavigationBar);
        } else if (comingFrom == 'passenger') {
          context.go(RouteConstant.bottomNav);
        }
      }
      return true;
    } on LocationPermissionPermanentlyDeniedException {
      if (context.mounted) {
        await openLocationPermissionDeniedBottomSheet(context);
      }
    } catch (_) {}

    return false;
  }

  // Future<void> getCurrentLocation() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     if (context.mounted) {
  //       await openLocationPermissionDeniedBottomSheet(context);
  //     }
  //     return;
  //   }
  //   Position position = await Geolocator.getCurrentPosition();
  //
  //   update();
  //
  // }
}
