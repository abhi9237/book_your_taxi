import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/controller/add_card_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/passenger/add_card/widgets/add_card_form_widget.dart';
import 'package:book_your_taxi/presentation/passenger/add_card/widgets/add_card_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCardController>(
      init: AddCardController(),
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
              buttonText: 'Add Card',
              onTap: controller.onTapAddCard,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  AddCardTopWidget(controller: controller),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 12),
                      child: AddCardFormWidget(controller: controller),
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
