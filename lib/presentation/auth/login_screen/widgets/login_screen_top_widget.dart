import 'package:flutter/cupertino.dart';

import '../../../../core/color_constant/color_constant.dart';

class LoginScreenTopWidget extends StatelessWidget {
  const LoginScreenTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: ColorConstant.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Hi Welcome back, you've been missed!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: ColorConstant.blackGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
