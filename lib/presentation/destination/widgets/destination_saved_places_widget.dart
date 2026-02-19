import 'package:flutter/material.dart';
import '../../../core/color_constant/color_constant.dart';

class DestinationSavedPlacesWidget extends StatelessWidget {
  const DestinationSavedPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstant.whiteColor,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.3),
            offset: Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.bookmark, color: ColorConstant.appColor),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              'Saved Places',
              style: TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.navigate_next),
        ],
      ),
    );
  }
}
