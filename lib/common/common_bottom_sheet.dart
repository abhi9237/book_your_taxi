import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'common_widget.dart';

Future<void> openBookMiniBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorConstant.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height *0.7,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10),
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
                            
                    /// Pickup
                    Container(
                      padding:
                      const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstant.lightGreyColor
                                .withValues(alpha: 0.3),
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
                      child: Row(
                        children: [
                          Icon(Icons.timer,
                              color: ColorConstant.appColor),
                          const SizedBox(width: 5),
                          const Expanded(
                            child: Text(
                              'Now',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                  color: ColorConstant.blackColor
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
                      height:
                      MediaQuery.sizeOf(context).height * 0.16,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
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
                      child: Row(
                        children: [
                          Icon(Icons.wallet,
                              color: ColorConstant.appColor),
                          const SizedBox(width: 5),
                          const Expanded(
                            child: Text(
                              'Cash',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                  color: ColorConstant.blackColor
                              ),
                            ),
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                            
                    /// Book For
                    CommonShaderContainer(
                      child: Row(
                        children: [
                          Icon(Icons.person,
                              color: ColorConstant.appColor),
                          const SizedBox(width: 5),
                          const Expanded(
                            child: Text(
                              'Book for self',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                  color: ColorConstant.blackColor
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
                          Icon(Icons.discount,
                              color: ColorConstant.appColor),
                          const SizedBox(width: 5),
                           Expanded(
                            child: Text(
                              'Apply Coupon',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.blackColor
                              ),
                            ),
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

