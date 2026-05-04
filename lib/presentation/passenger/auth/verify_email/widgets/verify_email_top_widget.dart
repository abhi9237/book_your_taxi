import 'package:flutter/material.dart';
import '../../../../../controller/passenger_auth_controller.dart';
import '../../../../../core/color_constant/color_constant.dart';

class VerifyEmailTopWidget extends StatelessWidget {
  final String email;
  final PassengerAuthController controller;

  const VerifyEmailTopWidget({
    super.key,
    required this.email,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        spacing: 12,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                controller.onTabBackButton(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorConstant.lightGreyColor),
                ),
                child: const Icon(Icons.keyboard_backspace, size: 22),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Verify Your Email',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: ColorConstant.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            'We will open your email app or webmail so you can check the verification message.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: ColorConstant.blackGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            email.isEmpty ? 'No email provided' : email,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: ColorConstant.appColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
