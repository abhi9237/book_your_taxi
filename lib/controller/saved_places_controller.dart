import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SavedPlacesController extends GetxController {
  void onTapBackButton(BuildContext context) {
    context.pop();
  }
}
