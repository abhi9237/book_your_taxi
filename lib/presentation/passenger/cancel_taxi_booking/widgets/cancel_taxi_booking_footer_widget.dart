import 'package:book_your_taxi/common/common_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class CancelTaxiBookingFooterWidget extends StatelessWidget {
  final VoidCallback onCancelRideTap;

  const CancelTaxiBookingFooterWidget({
    super.key,
    required this.onCancelRideTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: CommonButton(
          buttonText: 'Cancel Ride',
          onTap: onCancelRideTap,
        ),
      ),
    );
  }
}
