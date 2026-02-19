import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../controller/splash_controller.dart';
import '../../core/color_constant/color_constant.dart';
import '../../core/icons/app_icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(
        context: context
      ),
      builder: (controller) {
        return Scaffold(
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            color: ColorConstant.appColor,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AppIcons.appIcon, height: 35),
                ),

                Text(
                  'Taxi Booking',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstant.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
