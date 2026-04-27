import 'package:book_your_taxi/controller/payment_methods_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/passenger/payment_methods/widgets/payment_methods_list_widget.dart';
import 'package:book_your_taxi/presentation/passenger/payment_methods/widgets/payment_methods_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../common/common_button.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodsController>(
      init: PaymentMethodsController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: 100,
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
                  offset: const Offset(0, -2),
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ],
            ),
            child: CommonButton(
              buttonText: 'Continue',
              onTap: controller.onTapContinue,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  PaymentMethodsTopWidget(controller: controller),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 12),
                      child: PaymentMethodsListWidget(controller: controller),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
