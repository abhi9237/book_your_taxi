import 'package:book_your_taxi/presentation/passenger/auth/verify_email/widgets/verify_email_bottom_widget.dart';
import 'package:book_your_taxi/presentation/passenger/auth/verify_email/widgets/verify_email_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controller/passenger_auth_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassengerAuthController>(
      init: PassengerAuthController(context: context),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    VerifyEmailTopWidget(
                      email: email,
                      controller: controller,
                    ),
                    VerifyEmailBottomWidget(
                      email: email,
                      controller: controller,
                    ),
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
