import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/user_role_selection/widgets/user_role_selection_header_widget.dart';
import 'package:book_your_taxi/presentation/user_role_selection/widgets/user_role_selection_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../controller/get_started_controller.dart';

class UserRoleSelectionScreen extends StatelessWidget {
  const UserRoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetStartedController>(
      init: GetStartedController(context: context),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonButton(
                  buttonText: 'Continue',
                  onTap: () =>
                      controller.onTapContinueUserRoleSelection(context),
                ),
                const SizedBox(height: 12),
                Text(
                  'You can update this later if your app flow supports multiple roles.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: const Color(0xFFF7F7FB),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  const UserRoleSelectionHeaderWidget(),
                  const SizedBox(height: 28),
                  UserRoleSelectionOptionWidget(
                    title: 'Passenger',
                    description:
                        'Book rides, track drivers, and travel comfortably as a passenger.',
                    icon: Icons.person_rounded,
                    isSelected:
                        controller.selectedUserRole.value == 'passenger',
                    onTap: () => controller.selectUserRole('passenger'),
                  ),
                  const SizedBox(height: 14),
                  UserRoleSelectionOptionWidget(
                    title: 'Driver',
                    description:
                        'Register your car, accept ride requests, and start earning as a driver.',
                    icon: Icons.directions_car_rounded,
                    isSelected: controller.selectedUserRole.value == 'driver',
                    onTap: () => controller.selectUserRole('driver'),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
