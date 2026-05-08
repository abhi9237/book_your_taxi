import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import '../../../../controller/searching_ride_controller.dart';

class SearchingRideBodyWidget extends StatelessWidget {
  final SearchingRideController searchingRideController;
  const SearchingRideBodyWidget({
    super.key,
    required this.searchingRideController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What's next?",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w800,
                color: ColorConstant.whiteColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Share a journey or start a new\nadventure.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: const Color(0xFFF9D0BD).withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 24),
            _PrimaryCard(
              onTapGetStarted: () {
                searchingRideController.onTapGetStarted();
              },
            ),
            const SizedBox(height: 18),
            _SecondaryCard(),
          ],
        ),
      ),
    );
  }
}

class _PrimaryCard extends StatelessWidget {
  final VoidCallback onTapGetStarted;
  const _PrimaryCard({required this.onTapGetStarted});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFFF6200), width: 5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/get_started_img.jpg',
              height: 390,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 390,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF4B1C08).withValues(alpha: 0.45),
                    const Color(0xFF110D0A).withValues(alpha: 0.85),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 390,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB7A39A).withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'MOST POPULAR',
                        style: TextStyle(
                          color: ColorConstant.whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(
                              Icons.local_taxi,
                              color: Color(0xFFFF6200),
                              size: 28,
                            ),
                          ),
                        ),
                        SizedBox(width: 14),
                        Text(
                          'Create a Trip',
                          style: TextStyle(
                            color: ColorConstant.whiteColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Book a ride, schedule a route,\nand travel with top-rated drivers\nin your area.',
                      style: TextStyle(
                        color: ColorConstant.whiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        height: 1.6,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: onTapGetStarted,
                      splashColor: Colors.transparent,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Text(
                          'Get Started  →',
                          style: TextStyle(
                            color: Color(0xFFFF6200),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
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

class _SecondaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/onBoarding1.jpg',
            height: 320,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 320,
            decoration: BoxDecoration(
              color: const Color(0xFF151922).withValues(alpha: 0.72),
            ),
          ),
          SizedBox(
            height: 320,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFF16BED0),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: ColorConstant.whiteColor,
                            size: 26,
                          ),
                        ),
                      ),
                      SizedBox(width: 14),
                      Text(
                        'Post a Reel',
                        style: TextStyle(
                          color: ColorConstant.whiteColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Share your latest journey, tips,\nand experiences with the\nTripTaxi community.',
                    style: TextStyle(
                      color: ColorConstant.whiteColor.withValues(alpha: 0.85),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.6,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteColor.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: ColorConstant.whiteColor.withValues(alpha: 0.12),
                      ),
                    ),
                    child: Text(
                      'Upload Video  ⊞',
                      style: TextStyle(
                        color: ColorConstant.whiteColor.withValues(alpha: 0.95),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
