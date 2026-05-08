import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../core/route/route_constant/route_constant.dart';
import '../core/storage/hive_storage_service.dart';

class SplashController extends GetxController {
  BuildContext context;
  SplashController({required this.context});

  @override
  void onInit() {
    super.onInit();
    initSplashScreen(context);
  }

  Future<void> initSplashScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    if (context.mounted) {

      log('${HiveStorageService.getUserToken()}');
      log('${HiveStorageService.getEmailVerify()}');
      log('${  HiveStorageService.passCompleteProfile()}');
      if (HiveStorageService.getUserToken() != null) {
        if (HiveStorageService.getEmailVerify() == true &&
           ( HiveStorageService.passCompleteProfile() ?? false)== false) {
          context.go(RouteConstant.completeProfile);
        } else {
          if (HiveStorageService.getUserType() == 'passenger') {
            context.go(RouteConstant.bottomNav);
          } else if (HiveStorageService.getUserType() == 'driver') {
            context.go(RouteConstant.driverBottomNavigationBar);
          }
        }
      } else {
        context.go(RouteConstant.getStarted);
      }
    }
  }
}
