import 'package:book_your_taxi/common/common_text_form_filled.dart';
import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class ChatInputWidget extends StatelessWidget {
  ChatInputWidget({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: CommonTextFormFilled(
          hintText: 'Type a message here...',
          controller: controller,
          suffixWidget: Container(
            decoration: BoxDecoration(
              color: ColorConstant.appColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.mic_none_rounded,
              color: ColorConstant.whiteColor,
              size: 20,
            ),
          ),
        ),
        // Container(
        //   height: 58,
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   decoration: BoxDecoration(
        //     color: ColorConstant.whiteColor,
        //     borderRadius: BorderRadius.circular(14),
        //     border: Border.all(
        //       color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
        //     ),
        //   ),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: Text(
        //           'Type a message here...',
        //           style: TextStyle(
        //             color: ColorConstant.blackGreyColor.withValues(alpha: 0.55),
        //             fontSize: 14,
        //             fontWeight: FontWeight.w400,
        //           ),
        //         ),
        //       ),
        //       Container(
        //         height: 36,
        //         width: 36,
        //         decoration: BoxDecoration(
        //           color: ColorConstant.appColor,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: const Icon(
        //           Icons.mic_none_rounded,
        //           color: ColorConstant.whiteColor,
        //           size: 20,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
