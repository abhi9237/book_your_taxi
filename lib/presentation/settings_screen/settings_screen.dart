import 'package:flutter/material.dart';

import '../../core/color_constant/color_constant.dart';
import 'widgets/settings_header_widget.dart';
import 'widgets/settings_item_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <SettingsItemData>[
      SettingsItemData(
        icon: Icons.notifications_none_outlined,
        title: 'Notification Settings',
      ),
      SettingsItemData(
        icon: Icons.lock_outline,
        title: 'Password Manager',
      ),
      SettingsItemData(
        icon: Icons.delete_outline,
        title: 'Delete Account',
      ),
    ];

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            children: [
              SettingsHeaderWidget(
                onBackTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 22),
              Container(
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.10),
                  ),
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < items.length; i++) ...[
                      SettingsItemWidget(item: items[i]),
                      if (i != items.length - 1)
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
                        ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
