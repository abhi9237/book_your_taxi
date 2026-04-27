import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class YourProfileFieldWidget extends StatelessWidget {
  final String label;
  final String value;
  final String? trailingText;
  final String? hintText;
  final bool showDropdown;

  const YourProfileFieldWidget({
    super.key,
    required this.label,
    required this.value,
    this.trailingText,
    this.hintText,
    this.showDropdown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: ColorConstant.lightGreyColor.withValues(alpha: 0.18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  hintText ?? value,
                  style: TextStyle(
                    color: hintText != null
                        ? ColorConstant.blackGreyColor.withValues(alpha: 0.55)
                        : ColorConstant.blackColor,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              if (trailingText != null)
                Text(
                  trailingText!,
                  style: const TextStyle(
                    color: ColorConstant.appColor,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (showDropdown)
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: ColorConstant.appColor,
                  size: 28,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
