import 'package:flutter/cupertino.dart';

import '../../../../common/app_font.dart';
import '../../../../core/color_constant/color_constant.dart';
import '../../../../core/image_constant/image_constant.dart';

class GetStartedBottomWidget extends StatelessWidget {
  const GetStartedBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height *0.55,
      width: MediaQuery.sizeOf(context).width,
      child:  ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Image.asset(
          ImageConstant.getStartedImg,
          fit: BoxFit.cover,
          height: MediaQuery.sizeOf(context).height * 0.5,
        ),
      ),
    );
  }
}
