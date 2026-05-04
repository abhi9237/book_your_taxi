import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class UserRoleSelectionHeaderWidget extends StatelessWidget {
  const UserRoleSelectionHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 94,
          width: 94,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                ColorConstant.appColor.withValues(alpha: 0.2),
                ColorConstant.blackColor.withValues(alpha: 0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(
            Icons.how_to_reg_rounded,
            size: 44,
            color: ColorConstant.appColor,
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'How would you like to register?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Choose the role that matches you so we can set up the right experience.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.95),
            fontWeight: FontWeight.w500,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}
