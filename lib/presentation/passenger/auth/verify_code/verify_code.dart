import 'package:book_your_taxi/presentation/passenger/auth/verify_code/widgets/verify_code_textFilled_widget.dart';
import 'package:book_your_taxi/presentation/passenger/auth/verify_code/widgets/verify_code_top_screen.dart';
import 'package:book_your_taxi/presentation/passenger/auth/verify_code/widgets/verify_otp_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controller/passenger_auth_controller.dart';

class VerifyCodeScreen extends StatelessWidget {
  final String email;
  const VerifyCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassengerAuthController>(
      init: PassengerAuthController(context: context),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  VerifyCodeTopScreen(controller: controller),
                  VerifyCodeTextFilledWidget(controller: controller),
                  VerifyOtpBottomWidget(controller: controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
