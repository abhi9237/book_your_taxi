import 'package:flutter/material.dart';
import '../../../../core/color_constant/color_constant.dart';

class TripForDriverUserWidget extends StatelessWidget {
  const TripForDriverUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorConstant.lightGreyColor),
          ),
          child: Icon(Icons.person, size: 45),
        ),
        SizedBox(height: 15),
        Text(
          'Jenny Wilson',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hyundai verna',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.lightGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 5),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.appColor,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'GJ-01-AB-1234',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.lightGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(
          'You Rated your trip with Jenny Wilson',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Do you want to tip your driver for the great service?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.lightGreyColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
