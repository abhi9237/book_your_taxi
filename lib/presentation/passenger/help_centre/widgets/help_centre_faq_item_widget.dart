import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class HelpCentreFaqItemWidget extends StatelessWidget {
  final String question;
  final String answer;
  final bool expanded;
  final VoidCallback onTap;

  const HelpCentreFaqItemWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.whiteColor,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: const TextStyle(
                        color: ColorConstant.blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: ColorConstant.appColor,
                    size: 28,
                  ),
                ],
              ),
              if (expanded) ...[
                const SizedBox(height: 12),
                Text(
                  answer,
                  style: TextStyle(
                    color: ColorConstant.blackGreyColor.withValues(alpha: 0.85),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
