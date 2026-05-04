import 'package:book_your_taxi/presentation/passenger/auth/complete_profile/widgets/complete_profile_button_widget.dart';
import 'package:book_your_taxi/presentation/passenger/auth/complete_profile/widgets/complete_profile_text_widget.dart';
import 'package:book_your_taxi/presentation/passenger/auth/complete_profile/widgets/complete_profile_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../controller/passenger_auth_controller.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassengerAuthController>(
      init: PassengerAuthController(context: context),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: CompleteProfileButtonWidget(controller: controller),
          ),
          body: SafeArea(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CompleteProfileTopWidget(controller: controller),
                      CompleteProfileTextFilledWidget(controller: controller),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
