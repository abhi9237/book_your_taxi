import 'package:flutter/material.dart';
import '../../../common/common_widget.dart';
import '../../../core/color_constant/color_constant.dart';

class DestinationSavedPlacesWidget extends StatelessWidget {
  const DestinationSavedPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonShaderContainer(
      child: Row(
        children: [
          Icon(Icons.bookmark, color: ColorConstant.appColor),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              'Saved Places',
              style: TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.navigate_next),
        ],
      ),
    );
  }
}
