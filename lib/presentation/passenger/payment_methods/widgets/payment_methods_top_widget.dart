import 'package:book_your_taxi/controller/payment_methods_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class PaymentMethodsTopWidget extends StatelessWidget {
  final PaymentMethodsController controller;

  const PaymentMethodsTopWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              controller.onTapBack(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                border: Border.all(color: ColorConstant.lightGreyColor),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.keyboard_backspace_outlined),
            ),
          ),
          const Text(
            'Payment Methods',
            style: TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
