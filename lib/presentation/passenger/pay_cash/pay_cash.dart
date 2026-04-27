import 'package:book_your_taxi/presentation/passenger/pay_cash/widgets/pay_cash_location_widget.dart';
import 'package:book_your_taxi/presentation/passenger/pay_cash/widgets/pay_cash_otp_widget.dart';
import 'package:book_your_taxi/presentation/passenger/pay_cash/widgets/pay_cash_top_widget.dart';
import 'package:book_your_taxi/presentation/passenger/pay_cash/widgets/pay_cash_user_widget.dart';
import 'package:flutter/material.dart';

import '../../../common/common_button.dart';

class PayCashScreen extends StatelessWidget {
  const PayCashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CommonButton(
            buttonText: 'Cash Paid',
            onTap: () {
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                PayCashTopWidget(),
                PayCashLocationWidget(),
                PayCashUserWidget(),
                PayCashOtpWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
