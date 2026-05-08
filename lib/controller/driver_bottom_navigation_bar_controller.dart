import 'package:book_your_taxi/presentation/driver/driver_home/driver_home_screen.dart';
import 'package:book_your_taxi/presentation/driver/driver_reels_feed/driver_reels_feed_screen.dart';
import 'package:book_your_taxi/presentation/passenger/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/driver/searching_ride/searching_ride.dart';

class DriverBottomNavigationBarController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> screenList = <Widget>[
    const DriverHomeScreen(),
    const DriverReelsFeedScreen(),
    const SearchingRideScreen(),
    const ChatScreen(),
    const _DriverProfilePlaceholder(),
  ];

  void onTapSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}

class _DriverActionPlaceholder extends StatelessWidget {
  const _DriverActionPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const _DriverPlaceholder(title: 'Action');
  }
}

class _DriverMessagesPlaceholder extends StatelessWidget {
  const _DriverMessagesPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const _DriverPlaceholder(title: 'Messages');
  }
}

class _DriverProfilePlaceholder extends StatelessWidget {
  const _DriverProfilePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const _DriverPlaceholder(title: 'Profile');
  }
}

class _DriverPlaceholder extends StatelessWidget {
  final String title;

  const _DriverPlaceholder({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111216),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
