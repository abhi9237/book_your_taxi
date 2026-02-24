import 'package:book_your_taxi/controller/searching_ride_controller.dart';
import 'package:book_your_taxi/presentation/searching_ride/widgets/searching_ride_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SearchingRideScreen extends StatelessWidget {
  const SearchingRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingRideController>(
      init: SearchingRideController(context: context),
      builder: (controller) {
        return const Scaffold(body: SearchingRideBodyWidget());
      },
    );
  }
}
