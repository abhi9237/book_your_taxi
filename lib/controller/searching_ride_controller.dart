import 'dart:async';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../common/common_bottom_sheet.dart';


class SearchingRideController extends GetxController {
  Timer? _timer;
  BuildContext? context;
  SearchingRideController({this.context});

  void startRideSearchFlow(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      if (!context.mounted) {
        return;
      }
      // HomeController.openRideFoundedOnLoad = true;

      context.go(RouteConstant.bottomNav);
    });
  }

  @override
  void onInit() {
    startRideSearchFlow(context!);
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
