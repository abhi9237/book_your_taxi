import 'package:book_your_taxi/controller/payment_methods_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListWidget extends StatelessWidget {
  final PaymentMethodsController controller;

  const PaymentMethodsListWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentSectionWidget(
          title: 'Cash',
          child: PaymentTileWidget(
            title: 'Cash',
            selected: controller.selectedMethod == controller.cashMethod,
            onTap: () {
              controller.onTapPaymentMethod(controller.cashMethod);
            },
          ),
        ),
        const SizedBox(height: 16),
        PaymentSectionWidget(
          title: 'Wallet',
          child: PaymentTileWidget(
            title: 'Wallet',
            selected: controller.selectedMethod == controller.walletMethod,
            onTap: () {
              controller.onTapPaymentMethod(controller.walletMethod);
            },
          ),
        ),
        const SizedBox(height: 16),
        PaymentSectionWidget(
          title: 'Credit & Debit Card',
          child: PaymentActionTileWidget(
            title: 'Add Card',
            icon: Icons.add_circle_outline,
            onTap: () {
              controller.onTapAddCard(context);
            },
          ),
        ),
        const SizedBox(height: 16),
        PaymentSectionWidget(
          title: 'More Payment Options',
          child: PaymentActionTileWidget(
            title: 'PayPal',
            icon: Icons.account_balance_wallet_outlined,
            onTap: controller.onTapPaypal,
          ),
        ),
      ],
    );
  }
}

class PaymentSectionWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const PaymentSectionWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: ColorConstant.blackGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}

class PaymentTileWidget extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const PaymentTileWidget({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.blackColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorConstant.appColor),
              ),
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? ColorConstant.appColor : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentActionTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const PaymentActionTileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: ColorConstant.appColor),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
