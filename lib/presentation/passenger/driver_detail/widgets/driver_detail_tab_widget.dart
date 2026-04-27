import 'package:book_your_taxi/controller/driver_detail_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class DriverDetailTabWidget extends StatelessWidget {
  final DriverDetailController controller;
  const DriverDetailTabWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TabBar(
        onTap: (i){
          controller.onTapReviewTab(i);
        },
        controller: controller.tabController,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorConstant.appColor,
        ),
        labelStyle: TextStyle(
          color: ColorConstant.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        tabs: [
          Tab(text: "About"),
          Tab(text: "Review"),
        ],
      ),
    );
  }
}
