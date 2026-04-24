import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverDetailController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? tabController;
  TabController? reviewTabController;
  RxInt selectedReviewTabIndex = 0.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    reviewTabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  void onTapReviewTab(int index) {
    selectedReviewTabIndex.value = index;
    update();
  }



  @override
  void dispose() {
    tabController?.dispose();
    reviewTabController?.dispose();
    super.dispose();
  }
}
