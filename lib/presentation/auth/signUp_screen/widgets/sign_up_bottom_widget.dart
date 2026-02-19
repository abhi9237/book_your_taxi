import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';
import '../../../../core/icons/app_icons.dart';

class SignUpBottomWidget extends StatelessWidget {
  final AuthController controller;
  const SignUpBottomWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: ColorConstant.appColor,
              value: controller.isChecked,
              onChanged: (v) {
                controller.onTapAgreeTermsCondition(v ?? false);
              },
            ),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Agree with ",
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorConstant.appColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.onTapSignUp();
                      },
                  ),
                ],
              ),
            ),
            

          ],
        ),
        SizedBox(height: 30,),
        CommonButton(buttonText: 'SignUp',onTap: (){
          controller.onTapSignUpButton();
        },),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 1,
                width: MediaQuery.sizeOf(context).width * 0.3,
                decoration: BoxDecoration(color: ColorConstant.lightGreyColor),
              ),

              Text(
                'OR signup in with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: ColorConstant.blackGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.sizeOf(context).width * 0.3,
                decoration: BoxDecoration(color: ColorConstant.lightGreyColor),
              ),

            ],
          ),

        ),
        SizedBox(height: 40,),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonSocialLoginButton(iconImg: AppIcons.appleLogin),
              CommonSocialLoginButton(iconImg: AppIcons.googleLogin),
              CommonSocialLoginButton(iconImg: AppIcons.facebookLogin),
            ],
          ),
        ),
        SizedBox(height: 40,),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Already have an account? ",
            style: TextStyle(color: ColorConstant.blackColor, fontSize: 14,fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                text: 'Signin',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: ColorConstant.appColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    controller.onTapSignIn();
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
