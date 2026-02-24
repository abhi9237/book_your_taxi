import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../core/route/route_constant/route_constant.dart';

class PaymentMethodsController extends GetxController {
  final String cashMethod = 'Cash';
  final String walletMethod = 'Wallet';
  final String cardMethod = 'Card';
  final String paypalMethod = 'PayPal';

  String selectedMethod = 'Cash';

  void onTapBack(BuildContext context) {
    context.pop();
  }

  void onTapPaymentMethod(String method) {
    selectedMethod = method;
    update();
  }

  void onTapAddCard(BuildContext context) {
    onTapPaymentMethod(cardMethod);
    context.push(RouteConstant.addCard);
  }

  void onTapPaypal() {
    onTapPaymentMethod(paypalMethod);
  }

  void onTapContinue() {
    update();
  }
}
