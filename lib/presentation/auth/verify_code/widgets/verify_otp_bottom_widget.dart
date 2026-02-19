import 'package:book_your_taxi/common/common_button.dart';
import 'package:flutter/cupertino.dart';

import '../../../../controller/auth_controller.dart';
import '../../../../core/color_constant/color_constant.dart';

class VerifyOtpBottomWidget extends StatelessWidget {
  final AuthController controller;
  const VerifyOtpBottomWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Text(
          "Didn't receive the code?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: ColorConstant.lightGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Text(
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
        SizedBox(height: 30),
        CommonButton(buttonText: 'Verify',onTap: (){
          controller.onTapVerifyButton();
        },),
      ],
    );
  }
}
