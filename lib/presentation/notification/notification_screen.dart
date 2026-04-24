import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/notification/widget/notification_header_widget.dart';
import 'package:book_your_taxi/presentation/notification/widget/notification_section_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = <NotificationSection>[
      NotificationSection(
        title: 'TODAY',
        actionText: 'Mark all as read',
        items: [
          NotificationItemData(
            icon: Icons.event_available_outlined,
            title: 'Ride Booked Successfully',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            time: '1h',
          ),
          NotificationItemData(
            icon: Icons.confirmation_number_outlined,
            title: '50% Off on First Ride',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            time: '1h',
          ),
          NotificationItemData(
            icon: Icons.star_outline_rounded,
            title: 'Ride Review Request',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis',
            time: '1h',
          ),
        ],
      ),
      NotificationSection(
        title: 'YESTERDAY',
        actionText: 'Mark all as read',
        items: [
          NotificationItemData(
            icon: Icons.event_available_outlined,
            title: 'Taxi Booked Successfully',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            time: '1d',
          ),
          NotificationItemData(
            icon: Icons.account_balance_wallet_outlined,
            title: 'New Paypal Added',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            time: '1d',
          ),
          NotificationItemData(
            icon: Icons.event_available_outlined,
            title: 'Taxi Booked Successfully',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            time: '1d',
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            children: [
              NotificationHeader(onBackTap: () => Navigator.pop(context)),
              SizedBox(height: 5),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 22),
                    for (final section in sections)
                      NotificationSectionView(section: section),
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

class NotificationSection {
  final String title;
  final String actionText;
  final List<NotificationItemData> items;

  NotificationSection({
    required this.title,
    required this.actionText,
    required this.items,
  });
}

class NotificationItemData {
  final IconData icon;
  final String title;
  final String description;
  final String time;

  NotificationItemData({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
  });
}

extension WidgetWrap on Widget {
  Widget wrapWith({EdgeInsetsGeometry? padding, Decoration? decoration}) {
    return Container(padding: padding, decoration: decoration, child: this);
  }
}
