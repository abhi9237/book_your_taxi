import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../core/route/route_constant/route_constant.dart';

class SplashController extends GetxController {
  BuildContext context;
  SplashController({required this.context});


  @override
  void onInit() {
    super.onInit();
    initSplashScreen(context);
  }
  Future<void> initSplashScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    if (context.mounted) {
      context.go(RouteConstant.getStarted);
    }
  }

}
