import 'package:flutter/material.dart';
import '../../../../core/color_constant/color_constant.dart';

class LocationEnabledWidget extends StatelessWidget {
  const LocationEnabledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
          ),
          child: Icon(
            Icons.location_on_rounded,
            size: 40,
            color: ColorConstant.appColor,
          ),
        ),
        SizedBox(height: 20,),
        Text(
          'Enable Location Access',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10,),
        Text(
          'To ensure a smooth ride experience, please enable location access.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: ColorConstant.lightGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
