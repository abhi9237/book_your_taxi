import 'dart:developer';

import 'package:book_your_taxi/core/storage/hive_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../common/common_methods.dart';
import '../core/route/route_constant/route_constant.dart';

class GetStartedController extends GetxController {
  final BuildContext context;
  final RxString selectedUserRole = ''.obs;
  GetStartedController({required this.context});

  void onTapGetStarted(BuildContext context) {
    context.go(RouteConstant.authSelection);
  }

  void onTapContinueUserRoleSelection(BuildContext context) {
    if (selectedUserRole.value.isEmpty) {
      showToastMessage(
        isError: true,
        context: context,
        titleMessage: 'Select role',
        message: 'Please choose passenger or driver to continue',
      );
      return;
    }
    if (selectedUserRole.value.toLowerCase() == 'Passenger'.toLowerCase()) {
      context.push(
        RouteConstant.onBoardingPages,
        extra: selectedUserRole.value,
      );
    } else {
      context.push(
        RouteConstant.onBoardingPages,
        extra: selectedUserRole.value,
      );
    }
  }

  void selectUserRole(String role) {
    selectedUserRole.value = role;
    HiveStorageService.storeUserType(role);

    update();
  }
}
