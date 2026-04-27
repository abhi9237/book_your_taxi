import 'package:flutter/cupertino.dart';

import '../../../../core/color_constant/color_constant.dart';

class PayCashOtpWidget extends StatelessWidget {
  const PayCashOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom:360,
      right: 155,
      left: 155,
      child: Container(
        alignment: Alignment.center,

        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: ColorConstant.blackColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'OTP - 8546',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
