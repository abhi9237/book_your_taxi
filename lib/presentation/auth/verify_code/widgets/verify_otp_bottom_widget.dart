import 'package:book_your_taxi/common/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/passenger_auth_controller.dart';
import '../../../../../core/color_constant/color_constant.dart';

class VerifyOtpBottomWidget extends StatelessWidget {
  final PassengerAuthController controller;
  const VerifyOtpBottomWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(height: 30),
          if (controller.seconds.value > 0)
            Text(
              "Resend code in ${controller.seconds} seconds",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: ColorConstant.lightGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          if (controller.seconds.value == 0)
            Text(
              "Didn't receive the code?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: ColorConstant.lightGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          if (controller.seconds.value == 0) SizedBox(height: 5),
          if (controller.seconds.value == 0)
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                controller.resendOtp();


              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Text(
                  "Resend Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorConstant.blackColor,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorConstant.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          SizedBox(height: 30),
          CommonButton(
            buttonText: 'Verify',
            onTap: () {
              controller.onTapVerifyButton();
            },
          ),
        ],
      ),
    );
  }
}
