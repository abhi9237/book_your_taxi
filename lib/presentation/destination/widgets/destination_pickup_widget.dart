import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class DestinationPickupWidget extends StatelessWidget {
  const DestinationPickupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(vertical: 15),
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
      child: PickUpWidget(),
    );
  }
}

class PickUpWidget extends StatelessWidget {
  const PickUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(height: 5),
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstant.blackColor,
                ),
              ),
              Container(
                height: 25,
                width: 2,
                color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
              ),
              Icon(Icons.location_on_rounded, color: ColorConstant.appColor),
            ],
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  '6981, ncjksc,kncs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstant.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 1,
                  color: ColorConstant.lightGreyColor.withValues(alpha: 0.4),
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        '6981, ncjksc,kncs',
                        style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.map, color: ColorConstant.appColor),
                    SizedBox(width: 15),
                    Container(
                      height: 20,
                      width: 2,
                      color: ColorConstant.lightGreyColor.withValues(
                        alpha: 0.3,
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.add, color: ColorConstant.appColor),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



