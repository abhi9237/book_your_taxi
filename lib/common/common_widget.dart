import 'package:flutter/material.dart';

import '../core/color_constant/color_constant.dart';
import '../core/icons/app_icons.dart';

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

class CommonShaderContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const CommonShaderContainer({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: child,
      ),
    );
  }
}

class CommonTaxiWidget extends StatelessWidget {
  const CommonTaxiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonShaderContainer(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstant.whiteColor,
        ),
        child: Column(
          children: [
            Image.asset(
              AppIcons.miniCarIcon,
              height: 20,
              width: 40,
              fit: BoxFit.cover,
            ),
            Text(
              '5 min',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.lightGreyColor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 1,
              width: MediaQuery.sizeOf(context).width * 0.7,
              color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
            ),
            SizedBox(height: 5),

            Row(
              children: [
                Text(
                  'Mini',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstant.blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "\$ 1.0",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstant.blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "/mile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstant.lightGreyColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "3 Seats Capacity",
                style: TextStyle(
                  color: ColorConstant.lightGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
