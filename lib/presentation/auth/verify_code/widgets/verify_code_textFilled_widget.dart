import 'package:flutter/cupertino.dart';
import 'package:pinput/pinput.dart';
import '../../../../../common/pin_put_theme.dart';
import '../../../../../controller/passenger_auth_controller.dart';

class VerifyCodeTextFilledWidget extends StatelessWidget {
  final PassengerAuthController controller;
  const VerifyCodeTextFilledWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Pinput(length: 6,
        controller: controller.otpFilledController.value,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        // validator: (s) {
        //   return s == '2222' ? null : 'Pin is incorrect';
        // },
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        onCompleted: (pin) => print(pin),
      ),
    );
  }
}
