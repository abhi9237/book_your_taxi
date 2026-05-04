import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../common/common_button.dart';
import '../../../../../controller/verification_required_steps_controller.dart';
import '../../../../../core/color_constant/color_constant.dart';

class VerificationRequiredStepsBottomWidget extends StatelessWidget {
  final VerificationRequiredStepsController controller;

  const VerificationRequiredStepsBottomWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * 0.42,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 26),
            Container(
              height: 6,
              width: 56,
              decoration: BoxDecoration(
                color: ColorConstant.lightGreyColor.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Verification required steps',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 26,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Please review and complete the required verification steps to unlock the next stage.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.blackGreyColor.withValues(alpha: 0.95),
                fontSize: 14,
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            CommonButton(
              buttonText: 'Get Started',
              onTap: () => controller.onTapContinue(context),
            ),
            const SizedBox(height: 18),
            RichText(
              text: TextSpan(
                text: 'Need help? ',
                style: const TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'Contact support',
                    style: const TextStyle(
                      color: ColorConstant.appColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => controller.onTapSignIn(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
