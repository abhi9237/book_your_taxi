import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../common/common_bottom_sheet.dart';

class DestinationPickupController extends GetxController {

  void onTapConfirmLocation(BuildContext context) {
    openBookMiniBottomSheet(context);
  }

}
