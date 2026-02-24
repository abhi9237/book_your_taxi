import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class SearchingRideBodyWidget extends StatelessWidget {
  const SearchingRideBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 64,
                width: 64,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  color: ColorConstant.appColor,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Searching Ride...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: ColorConstant.blackColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please wait while we find the nearest driver.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.blackGreyColor.withValues(alpha: 0.75),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
