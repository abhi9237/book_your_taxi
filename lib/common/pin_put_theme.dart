import 'dart:ui';

import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(30, 60, 87, 1),
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: ColorConstant.appColor),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  textStyle: TextStyle(
    fontSize: 20,
    color: ColorConstant.whiteColor,
    fontWeight: FontWeight.w600,
  ),
  decoration: defaultPinTheme.decoration?.copyWith(
    color: ColorConstant.appColor,
  ),
);
