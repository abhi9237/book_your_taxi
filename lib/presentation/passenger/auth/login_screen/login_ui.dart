import 'package:book_your_taxi/presentation/passenger/auth/login_screen/widgets/login_screen_button_widget.dart';
import 'package:book_your_taxi/presentation/passenger/auth/login_screen/widgets/login_screen_textFilled_widget.dart';
import 'package:book_your_taxi/presentation/passenger/auth/login_screen/widgets/login_screen_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controller/passenger_auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassengerAuthController>(
      init: PassengerAuthController(context: context),
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
