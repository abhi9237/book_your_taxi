import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class CouponInputWidget extends StatelessWidget {
  const CouponInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: ColorConstant.lightGreyColor.withValues(alpha: 0.18),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Promo Code',
              style: TextStyle(
                color: ColorConstant.blackGreyColor.withValues(alpha: 0.55),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: ColorConstant.appColor,
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Center(
              child: Text(
                'Apply',
                style: TextStyle(
                  color: ColorConstant.whiteColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
