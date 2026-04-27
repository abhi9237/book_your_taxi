import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

import '../../../../common/common_text_form_filled.dart';

class DriverOverallRatingWidget extends StatelessWidget {
  DriverOverallRatingWidget({super.key});
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorConstant.lightGreyColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your overall rating',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstant.lightGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              RatingBar(
                size: 38,
                filledColor: ColorConstant.appColor,
                alignment: Alignment.center,
                filledIcon: Icons.star_sharp,
                emptyIcon: Icons.star_border,
                onRatingChanged: (value) => debugPrint('$value'),
                initialRating: 3,
                maxRating: 5,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Add detailed review',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        CommonDescriptionTextFormFilled(
          hintText: '',
          controller: descriptionController,
        ),
      ],
    );
  }
}
