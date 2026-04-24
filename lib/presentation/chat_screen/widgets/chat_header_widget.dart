import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class ChatHeaderWidget extends StatelessWidget {
  final VoidCallback onBackTap;
  final VoidCallback onCallTap;

  const ChatHeaderWidget({
    super.key,
    required this.onBackTap,
    required this.onCallTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _RoundButton(
            icon: Icons.arrow_back,
            onTap: onBackTap,
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white70,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFD9D9D9),
              child: Text(
                'JW',
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jenny Wilson',
                  style: TextStyle(
                    color: ColorConstant.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Online',
                  style: TextStyle(
                    color: ColorConstant.whiteColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          _RoundButton(
            icon: Icons.call,
            onTap: onCallTap,
          ),
        ],
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 48,
        width: 48,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstant.whiteColor,
        ),
        child: Icon(
          icon,
          color: ColorConstant.appColor,
          size: 22,
        ),
      ),
    );
  }
}
