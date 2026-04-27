import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class BookingsTabBarWidget extends StatelessWidget {
  const BookingsTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: const EdgeInsets.only(bottom: 12),
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 18),
      indicatorWeight: 3,
      indicatorColor: ColorConstant.appColor,
      labelColor: ColorConstant.appColor,
      unselectedLabelColor: ColorConstant.blackGreyColor.withValues(alpha: 0.65),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      tabs: const [
        Tab(text: 'Active'),
        Tab(text: 'Completed'),
        Tab(text: 'Cancelled'),
      ],
    );
  }
}
