import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:go_router/go_router.dart';

import '../common/common_methods.dart';
import '../core/route/route_constant/route_constant.dart';
import '../core/storage/hive_storage_service.dart';
import '../repository/driver_home/driver_home_repo.dart';

class DriverHomeController extends GetxController {
  RxBool isLoadingLogout = false.obs;
  DriverHomeRepo repo = DriverHomeRepo();

  Future logOut(BuildContext context) async {
    try {
      isLoadingLogout.value = true;
      final response = await repo.logOut();
      if (response.success == true) {
        HiveStorageService.eraseAllData();
        if (context.mounted) {
          context.go(RouteConstant.login);
        }
      } else {
        if (context.mounted) {
          showToastMessage(
            titleMessage: 'Error',
            message: response.message ?? '',
            context: context,
            isError: true,
          );
        }
      }
    } catch (e) {
      log('Error');
    } finally {
      isLoadingLogout.value = false;
    }
    update();
  }

}
