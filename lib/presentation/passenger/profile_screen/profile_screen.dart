import 'package:book_your_taxi/common/app_loader.dart';
import 'package:book_your_taxi/controller/profile_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';
import '../../../core/route/route_constant/route_constant.dart';
import 'widgets/profile_header_widget.dart';
import 'widgets/profile_menu_item_widget.dart';
import 'widgets/profile_user_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return AppLoader(
          isLoading: controller.isLoadingLogout,
          child: Scaffold(
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
                            child: Column(
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
                                  onTap: (){
                                    controller.logOut(context);
                                  },
                                ),
                                ProfileMenuItemWidget(
                                  icon: Icons.info_outline,
                                  title: 'Help Center',
                                  showDivider: false,
                                  onTap: () {
                                    context.pushNamed(RouteConstant.helpCentreScreen);
                                  },
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
          ),
        );
      }
    );
  }
}
