import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../presentation/home/home_screen.dart';
import '../presentation/payment_methods/payment_methods.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  List<Widget> screenList = <Widget>[
    HomeScreen(),
    PaymentMethodsScreen(),
    Container(),
    Container(),
    Container(),
  ];

  void onTapSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
