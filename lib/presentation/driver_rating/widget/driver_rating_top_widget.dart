import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class DriverRatingTopWidget extends StatelessWidget {
  const DriverRatingTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorConstant.lightGreyColor),
            ),

            child: Icon(Icons.keyboard_backspace_outlined, size: 20),
          ),
        ),
        Text(
          'Rate Driver',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 40),
      ],
    );
  }
}
