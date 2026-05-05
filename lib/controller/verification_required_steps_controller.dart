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

  final List<String> submittedSteps = const ['Government ID'];

  void onTapBack(BuildContext context) {
    context.pop();
  }

  void onTapStep(BuildContext context, String stepTitle) {
    if (stepTitle == 'Profile Picture') {
      context.push(RouteConstant.uploadProfilePicture);
    } else if (stepTitle == 'Bank Account Details') {
      context.push(RouteConstant.uploadBankAccuontDetail);
    } else if (stepTitle == 'Driving Details') {
      context.push(RouteConstant.uploadDrivingLicenceDetail);
    }else if(stepTitle == 'Government ID'){
      context.push(RouteConstant.uploadGovernmentId);
    }
  }

  void onTapContinue(BuildContext context) {
    context.push(RouteConstant.onBoardingPages, extra: 'driver');
  }

  void onTapSignIn(BuildContext context) {
    context.push(RouteConstant.login);
  }

  void onTapVerificationContinue (BuildContext context) {
    context.push(RouteConstant.locationAccess,
    extra: 'driver'
    );
  }
}
