import 'package:book_your_taxi/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import '../../../../common/common_text_form_filled.dart';
import '../../../../core/color_constant/color_constant.dart';

class SignUpTextFilled extends StatelessWidget {
  final AuthController controller;
  const SignUpTextFilled({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        CommonTextFormFilled(
          hintText: 'Enter your name',
          controller: controller.emailController.value,
        ),
        SizedBox(height: 10),
        Text(
          'Email',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        CommonTextFormFilled(
          hintText: 'emaple@gmail.com',
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
      ],
    );
  }
}
