import 'package:book_your_taxi/controller/home_controller.dart';
import 'package:book_your_taxi/presentation/passenger/home/widgets/home_map_view.dart';
import 'package:book_your_taxi/presentation/passenger/home/widgets/home_screen_top_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              HomeMapView(homeController: controller),
              HomeScreenTopWidget(controller: controller),
            ],
          ),
        );
      },
    );
  }
}
