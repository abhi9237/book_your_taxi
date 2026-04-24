import 'package:book_your_taxi/controller/driver_detail_controller.dart';
import 'package:flutter/material.dart';

import 'driver_detail_about_widget.dart';
import 'driver_detail_review_widget.dart';

class DriverDetailTabViewWidget extends StatelessWidget {
  final DriverDetailController controller;
  const DriverDetailTabViewWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.selectedReviewTabIndex.value == 0?
    DriverDetailAboutWidget():
    DriverDetailReviewWidget(
    controller: controller,
    );
  }
}
