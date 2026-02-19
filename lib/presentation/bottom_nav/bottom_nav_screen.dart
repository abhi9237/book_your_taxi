import 'package:book_your_taxi/presentation/bottom_nav/widgets/bottom_nav_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/bottom_nav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      init: BottomNavController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavTab(controller: controller),
          body: controller.screenList.elementAt(
            controller.selectedIndex.value,
          ),
        );
      },
    );
  }
}
