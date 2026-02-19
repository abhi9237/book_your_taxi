import 'package:flutter/cupertino.dart';

import '../../../../core/color_constant/color_constant.dart';

class SignUpTopWidget extends StatelessWidget {
  const SignUpTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        SizedBox(height: 20,),
        Text(
          'Create Account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "Fill your information below or register with your social account",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: ColorConstant.blackGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),

      ],
    );
  }
}
