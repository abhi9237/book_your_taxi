import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/driver/create_trip/widgets/create_trip_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/create_trip_controller.dart';

class CreateTripScreen extends StatelessWidget {
  const CreateTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateTripController>(
      init: CreateTripController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFFF6A00),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF6A00).withValues(alpha: 0.34),
                    blurRadius: 18,
                    spreadRadius: 1,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'POST TRIP',
                    style: TextStyle(
                      color: ColorConstant.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.rocket_launch_outlined,
                    color: ColorConstant.blackColor,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: ColorConstant.blackColor,
          body: CreateTripBodyWidget(controller: controller),
        );
      },
    );
  }
}
