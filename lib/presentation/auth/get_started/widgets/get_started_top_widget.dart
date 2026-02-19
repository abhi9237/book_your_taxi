import 'package:book_your_taxi/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/common_button.dart';
import '../../../../core/color_constant/color_constant.dart';
import '../../../../core/localisation/string_constant/string_constant.dart';
import '../../../../core/localisation/string_constant/string_constant_key.dart';

class GetStartedTopWidget extends StatelessWidget {
  final AuthController controller;
  const GetStartedTopWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * 0.4,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: ColorConstant.whiteColor,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: AppStringConstant.welcomeToYour.tr,
                style: TextStyle(color: ColorConstant.blackColor, fontSize: 26,fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: AppStringConstant.ultimateTransportationSolution.tr,
                    style: TextStyle(
                      color: ColorConstant.appColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            Text(
              AppStringConstant.loremIpsum.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.blackGreyColor,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 30),
            CommonButton(buttonText: AppStringConstant.letsGetStarted.tr,onTap: (){
              controller.onTapGetStarted(context);
            },),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: AppStringConstant.alreadyHaveAccount.tr,
                style: TextStyle(color: ColorConstant.blackColor, fontSize: 14),
                children: [
                  TextSpan(
                    text: AppStringConstant.signIn.tr,
                    style: TextStyle(
                      color: ColorConstant.appColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to Sign In screen
                      },
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
