import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class VerifyCodeTopScreen extends StatelessWidget {
  const VerifyCodeTopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              // controller.onTabBackButton(context);
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
        SizedBox(height: 15),
        Text(
          'Verify Code',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Please enter the code we just send to email",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: ColorConstant.blackGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "emaple@gmail.com",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: ColorConstant.appColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
