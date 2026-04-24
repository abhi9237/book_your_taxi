import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';
import '../coupon_screen.dart';

class CouponCardWidget extends StatelessWidget {
  final CouponItemData coupon;

  const CouponCardWidget({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: ColorConstant.lightGreyColor.withValues(alpha: 0.20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(26, 22, 26, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coupon.code,
                      style: const TextStyle(
                        color: ColorConstant.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      coupon.unlockText,
                      style: TextStyle(
                        color: ColorConstant.blackGreyColor.withValues(alpha: 0.72),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 18,
                          width: 18,
                          decoration: const BoxDecoration(
                            color: ColorConstant.appColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.percent,
                            color: ColorConstant.whiteColor,
                            size: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            coupon.offerText,
                            style: const TextStyle(
                              color: ColorConstant.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: ColorConstant.lightGreyColor.withValues(alpha: 0.09),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'COPY CODE',
                    style: TextStyle(
                      color: ColorConstant.appColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: -8,
          top: 50,
          child: const _TicketCutout(),
        ),
        Positioned(
          right: -8,
          top: 50,
          child: const _TicketCutout(),
        ),
      ],
    );
  }
}

class _TicketCutout extends StatelessWidget {
  const _TicketCutout();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorConstant.lightGreyColor.withValues(alpha: 0.20),
        ),
      ),
    );
  }
}
