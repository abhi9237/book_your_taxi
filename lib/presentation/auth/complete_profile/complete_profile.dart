import 'package:book_your_taxi/controller/auth_controller.dart';
import 'package:book_your_taxi/presentation/auth/complete_profile/widgets/complete_profile_button_widget.dart';
import 'package:book_your_taxi/presentation/auth/complete_profile/widgets/complete_profile_text_widget.dart';
import 'package:book_your_taxi/presentation/auth/complete_profile/widgets/complete_profile_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

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
                    CompleteProfileTopWidget(
                      controller: controller,
                    ),
                    CompleteProfileTextFilledWidget(controller: controller),
                    CompleteProfileButtonWidget(
                      controller: controller,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
