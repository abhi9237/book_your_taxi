import 'package:book_your_taxi/controller/driver_detail_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import '../../../../common/common_text_form_filled.dart';
import 'driver_detail_review_filter_tab_view_widget.dart';
import 'driver_detail_review_filter_tab_widget.dart';

class DriverDetailReviewWidget extends StatelessWidget {
  final DriverDetailController controller;
  const DriverDetailReviewWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reviews',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Icon(Icons.edit, color: ColorConstant.appColor),
                Text(
                  'add review',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstant.appColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        CommonTextFormFilled(
          prefixIcon: Icon(Icons.search_rounded, color: ColorConstant.appColor),
          hintText: 'Search in reviews',
          controller: controller.searchController,
          hintTextColor: ColorConstant.lightGreyColor,
        ),
        SizedBox(height: 10),
        DriverDetailReviewFilterTabWidget(controller: controller),
        DriverDetailReviewFilterTabViewWidget(),
      ],
    );
  }
}
