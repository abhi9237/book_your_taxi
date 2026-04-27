import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class SosActionCardWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const SosActionCardWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 14),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: ColorConstant.blackGreyColor.withValues(alpha: 0.06),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: ColorConstant.appColor,
              size: 28,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: ColorConstant.appColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: ColorConstant.whiteColor,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
