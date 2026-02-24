import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AddCardController extends GetxController {
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  bool saveCard = true;

  void onTapBack(BuildContext context) {
    context.pop();
  }

  void onTapSaveCard(bool value) {
    saveCard = value;
    update();
  }

  void onTapAddCard() {
    update();
  }

  @override
  void onClose() {
    cardHolderController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.onClose();
  }
}
