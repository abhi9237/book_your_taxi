import 'package:flutter/material.dart';

import '../../core/color_constant/color_constant.dart';
import 'widgets/sos_action_card_widget.dart';
import 'widgets/sos_header_widget.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: Column(
              children: [
                SosHeaderWidget(
                  onBackTap: () => Navigator.pop(context),
                ),
                const SizedBox(height: 72),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: ColorConstant.blackGreyColor.withValues(alpha: 0.06),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFE54C4C),
                    size: 72,
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'Use in Case of\nEmergency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstant.blackColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 76),
                Row(
                  children: const [
                    Expanded(
                      child: SosActionCardWidget(
                        icon: Icons.phone_in_talk_rounded,
                        title: 'Call Police\nControl Room',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: SosActionCardWidget(
                        icon: Icons.notifications_active_rounded,
                        title: 'Alert Your\nEmergency Contacts',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 38),
                Text(
                  'Company Tracks Location Data for a Safer and Smooth Ride',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstant.blackGreyColor.withValues(alpha: 0.68),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
