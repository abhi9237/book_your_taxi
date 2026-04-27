import 'package:book_your_taxi/presentation/passenger/bookings/bookings_screen.dart';
import 'package:book_your_taxi/presentation/passenger/chat_screen/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../presentation/passenger/home/home_screen.dart';
import '../presentation/passenger/payment_methods/payment_methods.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  List<Widget> screenList = <Widget>[
    HomeScreen(),
    PaymentMethodsScreen(),
    BookingsScreen(),
    ChatScreen(),
    Container(),
  ];

  void onTapSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
