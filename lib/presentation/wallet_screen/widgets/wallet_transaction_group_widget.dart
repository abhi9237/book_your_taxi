import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class WalletTransactionGroupData {
  final String title;
  final List<WalletTransactionData> transactions;

  WalletTransactionGroupData({
    required this.title,
    required this.transactions,
  });
}

class WalletTransactionData {
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final String balance;

  WalletTransactionData({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.balance,
  });
}

class WalletTransactionGroupWidget extends StatelessWidget {
  final WalletTransactionGroupData group;

  const WalletTransactionGroupWidget({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 10, top: 8),
          child: Text(
            group.title,
            style: const TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        for (int index = 0; index < group.transactions.length; index++) ...[
          _WalletTransactionTile(transaction: group.transactions[index]),
          if (index != group.transactions.length - 1) const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _WalletTransactionTile extends StatelessWidget {
  final WalletTransactionData transaction;

  const _WalletTransactionTile({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    color: ColorConstant.blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction.subtitle,
                  style: TextStyle(
                    color: ColorConstant.blackGreyColor.withValues(alpha: 0.55),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                transaction.amount,
                style: TextStyle(
                  color: transaction.amountColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                transaction.balance,
                style: TextStyle(
                  color: ColorConstant.blackGreyColor.withValues(alpha: 0.55),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
