import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class SavedPlacesListWidget extends StatelessWidget {
  const SavedPlacesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SavedPlaces(onTapClose: () {});
        },
      ),
    );
  }
}

class SavedPlaces extends StatelessWidget {
  final VoidCallback onTapClose;
  const SavedPlaces({super.key, required this.onTapClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),

      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blackColor.withValues(alpha: .05),
            blurRadius: 4,
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorConstant.appColor),
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.appColor,
              ),
            ),
          ),
          SizedBox(width: 20),
          Text(
            '2972 Westimer Rd. an',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: onTapClose,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(2),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorConstant.appColor),
              ),
              child: Icon(Icons.close, size: 12, color: ColorConstant.appColor),
            ),
          ),
        ],
      ),
    );
  }
}
