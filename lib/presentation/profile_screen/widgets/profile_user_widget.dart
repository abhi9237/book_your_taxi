import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class ProfileUserWidget extends StatelessWidget {
  const ProfileUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFFD4C0A2),
              child: CircleAvatar(
                radius: 46,
                backgroundColor: const Color(0xFFD8D8D8),
                child: const Icon(
                  Icons.person,
                  size: 54,
                  color: ColorConstant.blackColor,
                ),
              ),
            ),
            Positioned(
              right: -4,
              bottom: 4,
              child: Container(
                height: 34,
                width: 34,
                decoration: const BoxDecoration(
                  color: ColorConstant.appColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.edit_outlined,
                  color: ColorConstant.whiteColor,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        const Text(
          'Esther Howard',
          style: TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
