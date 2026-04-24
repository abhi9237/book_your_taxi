import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class AddAddressHeaderWidget extends StatelessWidget {
  final VoidCallback onBackTap;

  const AddAddressHeaderWidget({super.key, required this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _RoundBackButton(onTap: onBackTap),
        const Expanded(
          child: Center(
            child: Text(
              'Add Address',
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
    );
  }
}

class _RoundBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const _RoundBackButton({required this.onTap});

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
          color: ColorConstant.whiteColor,
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
