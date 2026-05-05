import 'package:book_your_taxi/controller/driver_bottom_navigation_bar_controller.dart';
import 'package:book_your_taxi/presentation/driver/driver_bottom_navigation_bar/widgets/driver_bottom_navigation_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DriverBottomNavigationBarScreen extends StatelessWidget {
  const DriverBottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverBottomNavigationBarController>(
      init: DriverBottomNavigationBarController(),
      builder: (controller) {
        return Scaffold(
          body: controller.screenList.elementAt(controller.selectedIndex.value),
          bottomNavigationBar: DriverBottomNavigationTab(
            controller: controller,
          ),
        );
      },
    );
  }
}
