import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../presentation/home/home_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  List<Widget> screenList = <Widget>[
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void onTapSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
