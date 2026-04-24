import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller/tip_for_driver_controller.dart';

class AddTipForDriver extends StatelessWidget {
  final TipForDriverController controller;
  const AddTipForDriver({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Container(
          height: 1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Add a tip for your driver',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.amounts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 12,
            childAspectRatio: 1.6,
          ),
          itemBuilder: (context, index) {
            final amount = controller.amounts[index];
            final isSelected = controller.selectedAmount == amount;

            return GestureDetector(
              onTap: () {
                // selectedAmount = amount;
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.orange.withOpacity(0.15)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Colors.orange : Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  "US \$$amount",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.orange : Colors.black87,
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        Text(
          'Enter Custom Amount',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.appColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
