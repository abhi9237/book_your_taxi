import 'package:flutter/material.dart';

Future<void> openBookMiniBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(),
    // const RideBookingSheet(),
  );
}
