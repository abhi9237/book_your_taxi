import 'package:flutter/material.dart';

import '../../../../common/common_text_form_filled.dart';
import '../../../../controller/auth_controller.dart';
import '../../../../core/color_constant/color_constant.dart';

class CompleteProfileTextFilledWidget extends StatelessWidget {
  final AuthController controller;
  const CompleteProfileTextFilledWidget({super.key, required this.controller});

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
          'Phone Number',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        CommonTextFormFilled(
          keyBoardType: TextInputType.number,
          prefixIcon: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: ColorConstant.blackColor,
                    size: 20,
                  ),
                  Text(
                    '+91',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: 1.5,
                    color: ColorConstant.lightGreyColor,
                  ),
                ],
              ),
            ),
          ),
          hintText: 'Enter your phone number',
          controller: controller.emailController.value,
          maxLength: 10,
        ),
        SizedBox(height: 10),
        Text(
          'Gender',
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
          suffixIcon: Icons.arrow_drop_down_sharp,

          hintText: 'Select',
          controller: controller.passwordController.value,
        ),
      ],
    );
  }
}
