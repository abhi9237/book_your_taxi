import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class YourProfileAvatarWidget extends StatelessWidget {
  const YourProfileAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE1C19B),
          ),
          child: ClipOval(
            child: Container(
              color: const Color(0xFFD3D3D3),
              child: const Center(
                child: Icon(
                  Icons.person,
                  color: ColorConstant.blackColor,
                  size: 78,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 4,
          bottom: 8,
          child: Container(
            height: 38,
            width: 38,
            decoration: const BoxDecoration(
              color: ColorConstant.appColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit_outlined,
              color: ColorConstant.whiteColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
