import 'dart:async';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class SearchingRideController extends GetxController {
  Timer? _timer;
  BuildContext? context;
  String? searchingFor;
  SearchingRideController({this.context, this.searchingFor});

  void startRideSearchFlow(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      if (!context.mounted) {
        return;
      }
      if (searchingFor == 'ride') {
        context.pop();
        context.pop();
      } else {
        context.pushReplacement(RouteConstant.congratulations);
      }
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
