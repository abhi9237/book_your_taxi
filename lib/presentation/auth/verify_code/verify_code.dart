import 'package:book_your_taxi/controller/auth_controller.dart';
import 'package:book_your_taxi/presentation/auth/verify_code/widgets/verify_code_textFilled_widget.dart';
import 'package:book_your_taxi/presentation/auth/verify_code/widgets/verify_code_top_screen.dart';
import 'package:book_your_taxi/presentation/auth/verify_code/widgets/verify_otp_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(context: context),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  VerifyCodeTopScreen(),
                  VerifyCodeTextFilledWidget(),
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
