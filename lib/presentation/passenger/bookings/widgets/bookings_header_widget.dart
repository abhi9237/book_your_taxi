import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class BookingsHeaderWidget extends StatelessWidget {
  final VoidCallback onBackTap;

  const BookingsHeaderWidget({super.key, required this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _BackButton(onTap: onBackTap),
          const Expanded(
            child: Center(
              child: Text(
                'Bookings',
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 44),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.18),
          ),
        ),
        child: const Icon(
          Icons.arrow_back,
          color: ColorConstant.blackColor,
          size: 22,
        ),
      ),
    );
  }
}
