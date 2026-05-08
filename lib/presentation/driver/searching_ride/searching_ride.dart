import 'package:book_your_taxi/controller/searching_ride_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/driver/searching_ride/widgets/searching_ride_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SearchingRideScreen extends StatelessWidget {
  final String? searchingFor;
  const SearchingRideScreen({super.key, this.searchingFor});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingRideController>(
      init: SearchingRideController(
        context: context,
        searchingFor: searchingFor,
      ),
      builder: (controller) {
        return  Scaffold(
            backgroundColor: ColorConstant.blackColor,
            body: SearchingRideBodyWidget(
              searchingRideController: controller,
            ));
      },
    );
  }
}
