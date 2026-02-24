import 'package:book_your_taxi/presentation/destination/widgets/destination_pickup_widget.dart';
import 'package:book_your_taxi/presentation/destination/widgets/destination_saved_places_widget.dart';
import 'package:book_your_taxi/presentation/destination/widgets/destination_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../common/common_button.dart';
import '../../controller/destination_pickup_controller.dart';
import '../../core/color_constant/color_constant.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DestinationPickupController>(
      init: DestinationPickupController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: 100,
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
                  buttonText: 'Confirm Location',
                  onTap: () {
                    controller.onTapConfirmLocation(context);
                  },
                ),

              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  DestinationTopWidget(
                    controller: controller,
                  ),
                  DestinationPickupWidget(),
                  DestinationSavedPlacesWidget()
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
