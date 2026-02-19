import 'package:book_your_taxi/common/common_button.dart';
import 'package:flutter/cupertino.dart';

import '../../../../controller/auth_controller.dart';

class CompleteProfileButtonWidget extends StatelessWidget {
  final AuthController controller;
  const CompleteProfileButtonWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: CommonButton(
        buttonText: 'Complete Profile',
        onTap: controller.onTapCompleteProfileButton,
      ),
    );
  }
}
