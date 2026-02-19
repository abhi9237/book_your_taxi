import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import '../../../controller/saved_places_controller.dart';

class SavedPlacesTopWidget extends StatelessWidget {
  final SavedPlacesController controller;
  const SavedPlacesTopWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              controller.onTapBackButton(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                border: Border.all(color: ColorConstant.lightGreyColor),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.keyboard_backspace_outlined),
            ),
          ),
          Text(
            'Save Places',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 45,)
        ],
      ),
    );
  }
}
