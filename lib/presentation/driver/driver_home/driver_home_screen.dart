import 'package:book_your_taxi/controller/driver_home_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/driver/driver_home/widgets/driver_home_hub_card.dart';
import 'package:book_your_taxi/presentation/driver/driver_home/widgets/driver_home_recent_bookings_card.dart';
import 'package:book_your_taxi/presentation/driver/driver_home/widgets/driver_home_stat_card.dart';
import 'package:book_your_taxi/presentation/driver/driver_home/widgets/driver_home_trip_card.dart';
import 'package:book_your_taxi/presentation/driver/driver_home/widgets/driver_home_weekly_chart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverHomeController>(
      init: DriverHomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFF0E1015),
          body: SafeArea(
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 40),
                  child: Row(
                    children: [
                      const Text(
                        'TRIPTAXI',
                        style: TextStyle(
                          color: ColorConstant.appColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Good Morning',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.45),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            'Alex Rivera',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: (){
                          controller.logOut(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0x22FF7A00),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: ColorConstant.appColor,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        _welcomeCard(),
                        const SizedBox(height: 10),
                        const DriverHomeStatCard(
                          icon: Icons.payments_outlined,
                          title: 'DAILY EARNINGS',
                          value: '\$284.50',
                          badge: '+8% vs yest.',
                        ),
                        const SizedBox(height: 10),
                        const DriverHomeStatCard(
                          icon: Icons.speed_rounded,
                          title: 'ACCEPTANCE RATE',
                          value: '98.2%',
                          badge: 'Top 5%',
                        ),
                        const SizedBox(height: 10),
                        const DriverHomeStatCard(
                          icon: Icons.workspace_premium_outlined,
                          title: 'DRIVER SCORE',
                          value: '942',
                          badge: '4.98 Rating',
                        ),
                        const SizedBox(height: 10),
                        const DriverHomeTripCard(),
                        const SizedBox(height: 10),
                        const DriverHomeRecentBookingsCard(),
                        const SizedBox(height: 10),
                        const DriverHomeWeeklyChartCard(),
                        const SizedBox(height: 10),
                        const DriverHomeHubCard(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _welcomeCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF15181E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          const Text(
            'Welcome back, Captain',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30 / 1.7,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'High demand near Downtown. Expected +\$12/hr bonus.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.58),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'OFFLINE',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.48),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: ColorConstant.appColor,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'GO\nONLINE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        height: 1.1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
