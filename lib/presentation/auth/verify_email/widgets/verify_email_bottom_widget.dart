import 'package:book_your_taxi/common/common_button.dart';
import 'package:flutter/material.dart';
import '../../../../../common/common_methods.dart';
import '../../../../../controller/passenger_auth_controller.dart';
import '../../../../../core/color_constant/color_constant.dart';

class VerifyEmailBottomWidget extends StatelessWidget {
  final String email;
  final PassengerAuthController controller;

  const VerifyEmailBottomWidget({
    super.key,
    required this.email,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: ColorConstant.lightGreyColor.withValues(alpha: 0.2)),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.mark_email_read_outlined,
                  size: 60,
                  color: ColorConstant.appColor,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Check your inbox',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorConstant.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tap the button below to open the email app or website with your address already filled in.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorConstant.blackGreyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CommonButton(
            buttonText: 'Verify Email',
            onTap: () {
              onTapOpenEmailApp(email,context);
            },
          ),
          const SizedBox(height: 12),
          Text(
            'If mail app does not open, your browser will try Gmail or Outlook web.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: ColorConstant.blackGreyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
