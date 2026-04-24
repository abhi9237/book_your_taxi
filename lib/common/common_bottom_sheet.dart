import 'dart:developer';

import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/core/icons/app_icons.dart';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'common_wheel_time_picker.dart';
import 'common_widget.dart';

Future<void> openBookMiniBottomSheet(
  BuildContext context, {
  VoidCallback? onTapScheduleButton,
  VoidCallback? onTapPayment,
  VoidCallback? onTapBookNow,
  VoidCallback? onTapBookForSelf,
}) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorConstant.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Top Indicator
                Container(
                  height: 3,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                /// Pickup
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstant.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstant.lightGreyColor.withValues(
                          alpha: 0.3,
                        ),
                        offset: const Offset(0, 1),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: PickUpWidget(),
                ),

                const SizedBox(height: 15),

                /// Now
                CommonShaderContainer(
                  onTap: () {
                    openScheduleBottomSheet(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.timer, color: ColorConstant.appColor),
                      const SizedBox(width: 5),
                      const Expanded(
                        child: Text(
                          'Now',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blackColor,
                          ),
                        ),
                      ),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                /// Taxi List
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.16,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CommonTaxiWidget(),
                      SizedBox(width: 10),
                      CommonTaxiWidget(),
                      SizedBox(width: 10),
                      CommonTaxiWidget(),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                /// Payment
                CommonShaderContainer(
                  onTap: onTapPayment,
                  child: Row(
                    children: [
                      Icon(Icons.wallet, color: ColorConstant.appColor),
                      const SizedBox(width: 5),
                      const Expanded(
                        child: Text(
                          'Cash',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blackColor,
                          ),
                        ),
                      ),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),

                /// Book For
                CommonShaderContainer(
                  onTap: onTapBookForSelf,
                  child: Row(
                    children: [
                      Icon(Icons.person, color: ColorConstant.appColor),
                      const SizedBox(width: 5),
                      const Expanded(
                        child: Text(
                          'Book for self',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blackColor,
                          ),
                        ),
                      ),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),

                /// Coupon
                CommonShaderContainer(
                  child: Row(
                    children: [
                      Icon(Icons.discount, color: ColorConstant.appColor),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Apply Coupon',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blackColor,
                          ),
                        ),
                      ),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CommonButton(buttonText: 'Book Mini', onTap: onTapBookNow),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> openRideFoundedBottomSheet(
  BuildContext context, {
  required VoidCallback onTap,
}) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorConstant.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 3,
                width: MediaQuery.sizeOf(context).width * 0.2,
                decoration: BoxDecoration(
                  color: ColorConstant.lightGreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ride Founded',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  Text(
                    '5 min Away',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.blackGreyColor.withValues(
                        alpha: 0.7,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.35),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstant.appColor,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jenny Wilson',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.blackColor,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Sedan (4 Seater)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.blackGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$1.25/ per mile',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: ColorConstant.blackColor,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'GR 678-UVW X',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blackGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CommonButton(buttonText: 'Request Ride', onTap: onTap),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> openScheduleBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: ColorConstant.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Top Indicator
                Container(
                  height: 3,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Schedule Ride',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.blackColor,
                        ),
                      ),
                    ),
                    Text(
                      'RIDE NOW',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.appColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  height: 2,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: WheelDateTimePicker(
                    onChanged: (v) {
                      log('Return ${v.hour}:${v.minute}');
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CommonButton(buttonText: 'Confirm'),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future openDriverArrivingBottomSheet(
  BuildContext context, {
  bool isArrived = false,
  VoidCallback? onTapCancelRide,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 3,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isArrived ? 'Driver Arrived' : 'Driver is Arriving...',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: ColorConstant.blackColor,
                      ),
                    ),
                    isArrived
                        ? Text(
                            '5 min Away',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.blackGreyColor.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: ColorConstant.lightGreyColor),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstant.appColor,
                      ),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jenny Wilson',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.blackColor,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Sedan',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.blackGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildCircleIcon(Icons.message, ColorConstant.appColor),
                    const SizedBox(width: 10),
                    buildCircleIcon(Icons.call, ColorConstant.appColor),
                  ],
                ),
                const SizedBox(height: 25),
                if (isArrived == true)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                Icons.radio_button_checked,
                                size: 20,
                                color: ColorConstant.blackColor,
                              ),
                              Container(
                                height: 40,
                                width: 1,
                                decoration: BoxDecoration(
                                  color: ColorConstant.lightGreyColor,
                                  border: Border.all(
                                    color: ColorConstant.lightGreyColor,
                                    width: 0.5,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                child: CustomPaint(painter: DashLinePainter()),
                              ),
                              const Icon(
                                Icons.location_on,
                                size: 20,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '6391 Elgin St. Celina, Delawa...',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstant.blackColor.withValues(
                                      alpha: 0.8,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.lightGreyColor
                                          .withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      'OTP - 8546',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: ColorConstant.blackGreyColor
                                            .withValues(alpha: 0.6),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '1901 Thornridge Cir. Sh...',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstant.blackColor.withValues(
                                      alpha: 0.8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Divider(
                        color: ColorConstant.lightGreyColor,
                        thickness: 0.5,
                      ),
                    ],
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatsBox('Rate per', '\$1.25'),
                    _buildStatsBox('Car Number', 'GR 678-UVWX'),
                    _buildStatsBox('No. of Seats', '4 Seats'),
                  ],
                ),
                const SizedBox(height: 25),
                CommonButton(
                  buttonText: 'Cancel Ride',
                  onTap: onTapCancelRide ?? () => Navigator.pop(context),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget buildCircleIcon(IconData icon, Color color) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
    ),
    child: Icon(icon, color: color, size: 18),
  );
}

Widget _buildStatsBox(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: ColorConstant.blackGreyColor.withValues(alpha: 0.6),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        value,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: ColorConstant.blackColor,
        ),
      ),
    ],
  );
}

Future openRideNotFoundBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset('assets/images/ride_not_found.png', height: 180),
                const SizedBox(height: 30),
                const Text(
                  'Ride Not Found',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorConstant.blackColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'please try again in a few minutes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.blackGreyColor.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 30),
                CommonButton(
                  buttonText: 'Try Again',
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future arrivedAtDestination(
  BuildContext context, {
  VoidCallback? onTapPayCash,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 30),
                Icon(
                  Icons.location_on_rounded,
                  color: ColorConstant.appColor,
                  size: 80,
                ),

                const SizedBox(height: 30),
                const Text(
                  'Arrived at Destination',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorConstant.blackColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '1601 Thornridge Cir. Shiloh, Hawaii 81063',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.blackGreyColor.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 30),
                CommonButton(
                  buttonText: 'Pay Cash \$12.50',
                  onTap: onTapPayCash,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class DashLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = ColorConstant.lightGreyColor
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
