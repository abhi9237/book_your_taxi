import 'package:flutter/material.dart';

import '../../core/color_constant/color_constant.dart';
import 'widgets/profile_bottom_nav_widget.dart';
import 'widgets/profile_header_widget.dart';
import 'widgets/profile_menu_item_widget.dart';
import 'widgets/profile_user_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            ProfileHeaderWidget(
              onBackTap: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                child: Column(
                  children: [
                    const ProfileUserWidget(),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: ColorConstant.lightGreyColor.withValues(alpha: 0.10),
                        ),
                      ),
                      child: const Column(
                        children: [
                          ProfileMenuItemWidget(
                            icon: Icons.person_outline,
                            title: 'Your profile',
                          ),
                          ProfileMenuItemWidget(
                            icon: Icons.location_on_outlined,
                            title: 'Manage Address',
                          ),
                          ProfileMenuItemWidget(
                            icon: Icons.notifications_none_outlined,
                            title: 'Notification',
                          ),
                          ProfileMenuItemWidget(
                            icon: Icons.credit_card_outlined,
                            title: 'Payment Methods',
                          ),
                          ProfileMenuItemWidget(
                            icon: Icons.calendar_month_outlined,
                            title: 'Pre-Booked Rides',
                          ),
                          ProfileMenuItemWidget(
                            icon: Icons.settings_outlined,
                            title: 'Settings',
                          ),
                          ProfileMenuItemWidget(
                            icon: Icons.emergency_outlined,
                            title: 'Emergency Contact',
                          ),
                          ProfileMenuItemWidget(
                            icon: Icons.info_outline,
                            title: 'Help Center',
                            showDivider: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
