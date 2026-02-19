import 'package:book_your_taxi/controller/auth_controller.dart';
import 'package:book_your_taxi/presentation/auth/signUp_screen/widgets/sign_up_bottom_widget.dart';
import 'package:book_your_taxi/presentation/auth/signUp_screen/widgets/sign_up_text_filled.dart';
import 'package:book_your_taxi/presentation/auth/signUp_screen/widgets/sign_up_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(context: context),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SignUpTopWidget(),
                    SignUpTextFilled(controller: controller,),
                    SignUpBottomWidget(controller: controller,)
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
