import 'package:flutter/material.dart';

import '../../../../controller/auth_controller.dart';
import '../../../../core/color_constant/color_constant.dart';

class CompleteProfileTopWidget extends StatelessWidget {
  final AuthController controller;
  const CompleteProfileTopWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
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
              child: Icon(Icons.keyboard_backspace, size: 22),
            ),
          ),
        ),

        SizedBox(height: 10),
        Text(
          'Complete Your Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Don't worry, only you can see your personal data. No one else will be able to see it.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: ColorConstant.blackGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
              ),
              child: Icon(
                Icons.person,
                size: 50,
                color: ColorConstant.lightGreyColor,
              ),
            ),

            Positioned(
              bottom: 0,
              right: 10,
              child: Container(
                padding: EdgeInsets.all(5),

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstant.appColor,
                ),
                child: Icon(
                  Icons.edit,
                  size: 18,
                  color: ColorConstant.whiteColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
