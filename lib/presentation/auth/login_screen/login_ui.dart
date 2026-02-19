import 'package:book_your_taxi/controller/auth_controller.dart';
import 'package:book_your_taxi/presentation/auth/login_screen/widgets/login_screen_button_widget.dart';
import 'package:book_your_taxi/presentation/auth/login_screen/widgets/login_screen_textFilled_widget.dart';
import 'package:book_your_taxi/presentation/auth/login_screen/widgets/login_screen_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(context: context),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                LoginScreenTopWidget(),
                LoginScreenTextFilledWidget(controller: controller),
                LoginScreenButtonWidget(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
