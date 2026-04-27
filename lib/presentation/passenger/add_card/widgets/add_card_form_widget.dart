import 'package:book_your_taxi/common/common_text_form_filled.dart';
import 'package:book_your_taxi/controller/add_card_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class AddCardFormWidget extends StatelessWidget {
  final AddCardController controller;

  const AddCardFormWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Card Holder Name',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorConstant.blackColor,
          ),
        ),
        const SizedBox(height: 8),
        CommonTextFormFilled(
          hintText: 'Enter card holder name',
          controller: controller.cardHolderController,
        ),
        const SizedBox(height: 16),
        const Text(
          'Card Number',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorConstant.blackColor,
          ),
        ),
        const SizedBox(height: 8),
        CommonTextFormFilled(
          hintText: 'XXXX XXXX XXXX XXXX',
          controller: controller.cardNumberController,
          keyBoardType: TextInputType.number,
          maxLength: 19,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Expiry Date',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CommonTextFormFilled(
                    hintText: 'MM/YY',
                    controller: controller.expiryDateController,
                    keyBoardType: TextInputType.number,
                    maxLength: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CVV',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CommonTextFormFilled(
                    hintText: '***',
                    controller: controller.cvvController,
                    keyBoardType: TextInputType.number,
                    maxLength: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorConstant.lightGreyColor.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Save this card for future payments',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.blackColor,
                  ),
                ),
              ),
              Switch(
                value: controller.saveCard,
                onChanged: controller.onTapSaveCard,
                activeThumbColor: ColorConstant.appColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
