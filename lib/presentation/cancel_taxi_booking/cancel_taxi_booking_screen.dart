import 'package:flutter/material.dart';

import '../../core/color_constant/color_constant.dart';
import 'widgets/cancel_taxi_booking_footer_widget.dart';
import 'widgets/cancel_taxi_booking_header_widget.dart';
import 'widgets/cancel_taxi_booking_reason_widget.dart';

class CancelTaxiBookingScreen extends StatefulWidget {
  const CancelTaxiBookingScreen({super.key});

  @override
  State<CancelTaxiBookingScreen> createState() => _CancelTaxiBookingScreenState();
}

class _CancelTaxiBookingScreenState extends State<CancelTaxiBookingScreen> {
  final TextEditingController reasonController = TextEditingController();
  int selectedReasonIndex = 0;

  final List<String> reasons = const [
    'Schedule Change',
    'Book Another Cab',
    'Found a better alternative',
    'Driver is taking too long',
    'My Reason is not listed',
    'Other',
  ];

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CancelTaxiBookingHeaderWidget(
                    onBackTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    'Please select the reason for cancellations:',
                    style: TextStyle(
                      color: ColorConstant.blackGreyColor.withValues(alpha: 0.72),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 18),
                  for (int index = 0; index < reasons.length; index++) ...[
                    CancelTaxiBookingReasonWidget(
                      title: reasons[index],
                      selected: selectedReasonIndex == index,
                      onTap: () {
                        setState(() {
                          selectedReasonIndex = index;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                  const SizedBox(height: 8),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Other',
                    style: TextStyle(
                      color: ColorConstant.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 170,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: ColorConstant.lightGreyColor.withValues(alpha: 0.18),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: reasonController,
                      maxLines: null,
                      expands: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                        hintText: 'Enter your Reason',
                        hintStyle: TextStyle(
                          color: ColorConstant.blackGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: const TextStyle(
                        color: ColorConstant.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CancelTaxiBookingFooterWidget(
                onCancelRideTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
