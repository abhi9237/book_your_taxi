import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../core/route/route_constant/route_constant.dart';

class VerificationRequiredStepsController extends GetxController {
  final String driverName = 'Esther';

  final List<String> requiredSteps = const [
    'Profile Picture',
    'Bank Account Details',
    'Driving Details',
  ];

  final List<String> submittedSteps = const [
    'Government ID',
  ];

  void onTapBack(BuildContext context) {
    context.pop();
  }

  void onTapStep(BuildContext context, String stepTitle) {
    if (stepTitle == 'Profile Picture') {
      context.push(RouteConstant.uploadProfilePicture);
    }
  }

  void onTapContinue(BuildContext context) {
    context.push(
      RouteConstant.onBoardingPages,
      extra: 'driver',
    );
  }

  void onTapSignIn(BuildContext context) {
    context.push(RouteConstant.login);
  }
}
