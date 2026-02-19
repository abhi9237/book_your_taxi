import 'package:book_your_taxi/common/common_text_form_filled.dart';
import 'package:book_your_taxi/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import '../../../../core/color_constant/color_constant.dart';

class LoginScreenTextFilledWidget extends StatelessWidget {
  final AuthController controller;
  const LoginScreenTextFilledWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: ColorConstant.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          CommonTextFormFilled(
            hintText: 'example.gmail.com',
            controller: controller.emailController.value,
          ),
          SizedBox(height: 10),
          Text(
            'Password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: ColorConstant.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          CommonTextFormFilled(
            isObscureIcon: controller.isObsecureValue.value,
            onTapSuffixIcon: controller.onClickEyeIcon,
            suffixIcon: controller.isObsecureValue.value
                ? Icons.visibility
                : Icons.visibility_off,
            hintText: '********',
            controller: controller.passwordController.value,
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Forgot Password?',
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: ColorConstant.appColor,
                decorationThickness: 2,
                fontSize: 14,
                color: ColorConstant.appColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
