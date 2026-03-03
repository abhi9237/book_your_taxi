import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: ColorConstant.blackColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstant.appColor,
                ),
                child: const Icon(
                  Icons.check,
                  color: ColorConstant.whiteColor,
                  size: 60,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Congratulations! Ride\nAccepted by Jenny',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: ColorConstant.blackColor,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Your Ride Booked Successfully.\nYou can check your booking on the "Bookings".',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.blackGreyColor.withValues(alpha: 0.7),
                ),
              ),
              const Spacer(),
              CommonButton(
                buttonText: 'View E-Receipt',
                onTap: () {
                  // TODO: Implement E-Receipt view
                },
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  // TODO: Implement track driver
                },
                child: const Text(
                  'Track Driver',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorConstant.blackGreyColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
