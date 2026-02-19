import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/core/icons/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../../../common/common_button.dart';
import '../../../../controller/auth_controller.dart';

class LoginScreenButtonWidget extends StatelessWidget {
  final AuthController controller;
  const LoginScreenButtonWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 30),
          CommonButton(buttonText: "Sign In", onTap: () {}),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 1,
                  width: MediaQuery.sizeOf(context).width * 0.32,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor,
                  ),
                ),

                Text(
                  'OR sigin in with',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorConstant.lightGreyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.sizeOf(context).width * 0.32,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
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
          SizedBox(height: 50),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: 'Signup',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ColorConstant.appColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
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
    );
  }
}
