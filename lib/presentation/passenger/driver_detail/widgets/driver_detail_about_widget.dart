import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/common_bottom_sheet.dart';

class DriverDetailAboutWidget extends StatelessWidget {
  const DriverDetailAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          'About',
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit auctor dui, sed efficitur enim efficitur in. Sed at nunc a enim efficitur commodo. Donec suscipit auctor dui, sed efficitur enim efficitur in. Sed at nunc a enim efficitur commodo.',
          style: TextStyle(
            color: ColorConstant.blackGreyColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Driver Contact',
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.appColor,
              ),
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenny Wilson',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Driver',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.blackGreyColor,
                    ),
                  ),
                ],
              ),
            ),
            buildCircleIcon(Icons.message, ColorConstant.appColor),
            const SizedBox(width: 10),
            buildCircleIcon(Icons.call, ColorConstant.appColor),
          ],
        ),
        SizedBox(height: 15,),
        Text(
          'Car Details',
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10,),
        CarDetail(
          title: 'Car Model',
          subTitle: 'Toyota Camry',
        ),
        SizedBox(height: 10,),
        CarDetail(
          title: 'Car Color',
          subTitle: 'Black',
        ),
        SizedBox(height: 10,),
        CarDetail(
          title: 'Car Number',
          subTitle: 'GA 1234',
        ),
      ],
    );
  }
}


class CarDetail extends StatelessWidget {
  final String title;
  final String subTitle;
  const CarDetail({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
       title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: ColorConstant.blackGreyColor,
          ),
        ),
        Text(
        subTitle,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: ColorConstant.blackColor,
          ),
        ),
      ],
    );
  }
}
