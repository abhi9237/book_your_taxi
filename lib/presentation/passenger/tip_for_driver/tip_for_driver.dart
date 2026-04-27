import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/passenger/tip_for_driver/widget/add_tip_for_driver.dart';
import 'package:book_your_taxi/presentation/passenger/tip_for_driver/widget/tip_for_driver_top_widget.dart';
import 'package:book_your_taxi/presentation/passenger/tip_for_driver/widget/trip_for_driver_user_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../common/common_button.dart';
import '../../../controller/tip_for_driver_controller.dart';

class TipForDriver extends StatelessWidget {
  const TipForDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TipForDriverController>(
      init: TipForDriverController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            height: 110,
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  offset: const Offset(0, -2),
                  spreadRadius: 5,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonButton(
                    gradientColors:   [ColorConstant.lightGreyColor, ColorConstant.lightGreyColor],
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    buttonText: 'No Thanks',
                    onTap: () {},
                  ),
                  CommonButton(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    buttonText: 'Pay Tip',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TipForDriverTopWidget(),
                  TripForDriverUserWidget(),
                  AddTipForDriver(controller: controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
