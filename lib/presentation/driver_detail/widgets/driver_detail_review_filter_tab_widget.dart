import 'package:flutter/material.dart';

import '../../../controller/driver_detail_controller.dart';
import '../../../core/color_constant/color_constant.dart';

class DriverDetailReviewFilterTabWidget extends StatelessWidget {
  final DriverDetailController controller;
  const DriverDetailReviewFilterTabWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        controller: controller.reviewTabController,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding:  const EdgeInsets.symmetric(vertical: 6),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
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
          Tab(text: "Review"),
          Tab(text: "Review"),
          Tab(text: "Review"),
        ],
      ),
    );
  }
}
