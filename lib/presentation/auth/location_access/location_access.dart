import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/controller/location_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/auth/location_access/widgets/location_enabled_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class LocationAccessScreen extends StatelessWidget {
  final String comingFrom;
  const LocationAccessScreen({super.key, required this.comingFrom});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(context: context,
      comingFrom: comingFrom
      ),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: 140,
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
                  offset: Offset(0, -2),
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                CommonButton(
                  buttonText: 'Allow Location Access',
                  onTap: () async {
                    await controller.onTapAllowLocationAccess();
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Maybe Later",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorConstant.appColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: LocationEnabledWidget(),
              ),
            ),
          ),
        );
      },
    );
  }
}
