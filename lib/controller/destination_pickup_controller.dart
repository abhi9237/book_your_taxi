import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../common/common_bottom_sheet.dart';
import '../core/route/route_constant/route_constant.dart';
import '../presentation/destination/widgets/someone_else_taking_ride_bottom_sheet.dart';

class DestinationPickupController extends GetxController {
  void onTapConfirmLocation(BuildContext context) {
    openBookMiniBottomSheet(
      context,
      onTapPayment: () {
        onTapPaymentMethods(context);
      },
      onTapBookNow: () {
        onTapBookMini(context);
      },
      onTapBookForSelf: () {
        openSomeoneElseTakingRideBottomSheet(context);
      },
    );
  }

  void onTapBackButton(BuildContext context) {
    context.pop();
  }

  void onTapPaymentMethods(BuildContext context) {
    context.pop();
    context.push(RouteConstant.paymentMethods);
  }

  void onTapBookMini(BuildContext context) {
    context.pop();
    context.push(RouteConstant.searchingRide, extra: 'ride');
  }
}
