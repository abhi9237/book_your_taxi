import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class CancelTaxiBookingReasonWidget extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const CancelTaxiBookingReasonWidget({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? ColorConstant.appColor : ColorConstant.blackGreyColor.withValues(alpha: 0.45),
                width: 1.4,
              ),
            ),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                height: selected ? 14 : 0,
                width: selected ? 14 : 0,
                decoration: const BoxDecoration(
                  color: ColorConstant.appColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
