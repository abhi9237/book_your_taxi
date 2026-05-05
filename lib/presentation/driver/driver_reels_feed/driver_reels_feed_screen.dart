import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/driver/driver_reels_feed/widgets/driver_reels_feed_action_column.dart';
import 'package:book_your_taxi/presentation/driver/driver_reels_feed/widgets/driver_reels_feed_bottom_bar.dart';
import 'package:flutter/material.dart';

class DriverReelsFeedScreen extends StatelessWidget {
  const DriverReelsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12151C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=1200&q=80',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.35),
                          Colors.black.withValues(alpha: 0.18),
                          Colors.black.withValues(alpha: 0.68),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.movie_creation_outlined,
                              color: Colors.white70,
                              size: 21,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Reels Feed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21 / 1.3,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorConstant.appColor,
                                  width: 2,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.black26,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: _content()),
                            const SizedBox(width: 12),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 128),
                              child: DriverReelsFeedActionColumn(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Text(
              'Vikram Singh',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24 / 1.6,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF00E5FF).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: const Color(0xFF00E5FF).withValues(alpha: 0.4),
                ),
              ),
              child: const Text(
                'TOP RATED',
                style: TextStyle(
                  color: Color(0xFF00E5FF),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          'Scenic drive to Manali',
          style: TextStyle(
            color: Colors.white,
            fontSize: 46 / 1.6,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Experience the breathtaking views of the Beas River and the majestic Rohtang Pass.',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.82),
            fontSize: 15,
            height: 1.3,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Rs 4,200',
              style: TextStyle(
                color: ColorConstant.appColor,
                fontSize: 34 / 1.1,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'INCL. TOLLS & TAXES',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        _ctaButton(
          text: 'Create Trip for This Location',
          filled: true,
          icon: Icons.add_circle_outline,
        ),
        const SizedBox(height: 10),
        _ctaButton(
          text: 'Book Now',
          filled: false,
          icon: Icons.directions_car_filled_outlined,
        ),
      ],
    );
  }

  Widget _ctaButton({
    required String text,
    required bool filled,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: filled
            ? const Color(0xFFFF6E00)
            : Colors.black.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: filled ? 0 : 0.23),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: filled ? Colors.black : Colors.white, size: 26),
          const SizedBox(width: 9),
          Text(
            text,
            style: TextStyle(
              color: filled ? Colors.black : Colors.white,
              fontSize: 17 / 1.2,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
