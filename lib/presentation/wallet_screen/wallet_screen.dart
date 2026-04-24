import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import 'widgets/wallet_balance_widget.dart';
import 'widgets/wallet_header_widget.dart';
import 'widgets/wallet_transaction_group_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = <WalletTransactionGroupData>[
      WalletTransactionGroupData(
        title: 'Today',
        transactions: [
          WalletTransactionData(
            title: 'Money Added to Wallet',
            subtitle: '24 September | 7:30 AM',
            amount: '+ \$500.00',
            amountColor: const Color(0xFF2BAE7A),
            balance: 'Balance \$12,000.00',
          ),
        ],
      ),
      WalletTransactionGroupData(
        title: 'Yesterday',
        transactions: [
          WalletTransactionData(
            title: 'Booking No #34234',
            subtitle: '23 September | 5:30 AM',
            amount: '- \$500.00',
            amountColor: const Color(0xFFE05454),
            balance: 'Balance \$11,250.00',
          ),
        ],
      ),
      WalletTransactionGroupData(
        title: '22 September 2023',
        transactions: [
          WalletTransactionData(
            title: 'Refund for Booking #34234',
            subtitle: '22 September | 7:30 AM',
            amount: '+ \$500.00',
            amountColor: const Color(0xFF2BAE7A),
            balance: 'Balance \$11,250.00',
          ),
          WalletTransactionData(
            title: 'Booking #34234',
            subtitle: '22 September | 7:30 AM',
            amount: '- \$250.00',
            amountColor: const Color(0xFFE05454),
            balance: 'Balance \$11,250.00',
          ),
          WalletTransactionData(
            title: 'Booking #34234',
            subtitle: '22 September | 7:30 AM',
            amount: '- \$250.00',
            amountColor: const Color(0xFFE05454),
            balance: 'Balance \$11,250.00',
          ),
          WalletTransactionData(
            title: 'Booking #34234',
            subtitle: '22 September | 7:30 AM',
            amount: '- \$250.00',
            amountColor: const Color(0xFFE05454),
            balance: 'Balance \$11,250.00',
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 150),
              child: Column(
                children: [
                  WalletHeaderWidget(onBackTap: () => Navigator.pop(context)),
                  SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18),
                          const WalletBalanceWidget(),
                          const SizedBox(height: 18),
                          for (final group in groups) ...[
                            WalletTransactionGroupWidget(group: group),
                            const SizedBox(height: 8),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
