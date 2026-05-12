import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import '../../../../../controller/passenger_auth_controller.dart';

class CompleteProfileButtonWidget extends StatelessWidget {
  final PassengerAuthController controller;
  const CompleteProfileButtonWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      buttonText: 'Complete Profile',
      onTap: controller.onTapCompleteProfileButton,
    ) ;
  }
}
