import 'dart:developer';
import 'package:book_your_taxi/common/common_methods.dart';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:book_your_taxi/core/storage/hive_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../repository/profile_repo/profile_repo.dart';

class ProfileController extends GetxController {
  ProfileRepo repo = ProfileRepo();
  RxBool isLoadingLogout = false.obs;

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
