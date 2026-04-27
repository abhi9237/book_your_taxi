import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import '../../../../common/common_bottom_sheet.dart';

class PayCashLocationWidget extends StatelessWidget {
  const PayCashLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(top: 30,left: 15,right: 15),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.4),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
              ),
              child: Icon(Icons.wallet, color: ColorConstant.appColor, size: 35),
            ),
            Text(
              'Pay Cash',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.radio_button_checked, size: 20, color: ColorConstant.blackColor),
                      Container(
                        height: 40,
                        width: 1,
                        decoration: BoxDecoration(
                          color: ColorConstant.lightGreyColor,
                          border: Border.all(color: ColorConstant.lightGreyColor, width: 0.5, style: BorderStyle.none),
                        ),
                        child: CustomPaint(
                          painter: DashLinePainter(),
                        ),
                      ),
                      const Icon(Icons.location_on, size: 20, color: Colors.orange),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6391 Elgin St. Celina, Delawa...',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blackColor.withValues(alpha: 0.8),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: ColorConstant.lightGreyColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '16 miles',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: ColorConstant.blackGreyColor.withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '1901 Thornridge Cir. Sh...',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blackColor.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
