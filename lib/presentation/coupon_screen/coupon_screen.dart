import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import 'widgets/coupon_card_widget.dart';
import 'widgets/coupon_header_widget.dart';
import 'widgets/coupon_input_widget.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coupons = <CouponItemData>[
      CouponItemData(
        code: 'WELCOME200',
        unlockText: 'Add items worth \$2 more to unlock',
        offerText: 'Get 50% OFF',
      ),
      CouponItemData(
        code: 'CASHBACK12',
        unlockText: 'Add items worth \$2 more to unlock',
        offerText: 'Up to \$12.00 cashback',
      ),
      CouponItemData(
        code: 'FEST2COST',
        unlockText: 'Add items worth \$28 more to unlock',
        offerText: 'Get 50% OFF for Combo',
      ),
    ];

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 240),
              children: [
                CouponHeaderWidget(
                  onBackTap: () => Navigator.pop(context),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Coupons for you',
                  style: TextStyle(
                    color: ColorConstant.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                for (final coupon in coupons) ...[
                  CouponCardWidget(coupon: coupon),
                  const SizedBox(height: 16),
                ],
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 4,
                      width: 120,
                      decoration: BoxDecoration(
                        color: ColorConstant.lightGreyColor.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const CouponInputWidget(),
                    const SizedBox(height: 18),
                    CommonButton(
                      buttonText: 'Continue',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CouponItemData {
  final String code;
  final String unlockText;
  final String offerText;

  CouponItemData({
    required this.code,
    required this.unlockText,
    required this.offerText,
  });
}
