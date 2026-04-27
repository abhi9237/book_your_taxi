import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';
import 'widgets/completed_booking_card_widget.dart';
import 'widgets/booking_card_widget.dart';
import 'widgets/bookings_header_widget.dart';
import 'widgets/bookings_tab_bar_widget.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              BookingsHeaderWidget(
                onBackTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 18),
              const BookingsTabBarWidget(),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFFEAEAEA),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView(
                      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                      children: const [
                        BookingCardWidget(),
                      ],
                    ),
                    ListView(
                      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                      children: const [
                        CompletedBookingCardWidget(
                          driverName: 'Byron Barlow',
                          vehicleType: 'MPV ( 5 Seater)',
                          avatarLabel: 'BB',
                          mapAccent: Color(0xFF85D3D4),
                        ),
                        SizedBox(height: 14),
                        CompletedBookingCardWidget(
                          driverName: 'Robert Fox',
                          vehicleType: 'MPV ( 5 Seater)',
                          avatarLabel: 'RF',
                          mapAccent: Color(0xFFD8B26E),
                        ),
                      ],
                    ),
                    const _PlaceholderBookingsView(
                      message: 'No cancelled bookings yet',
                    ),
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

class _PlaceholderBookingsView extends StatelessWidget {
  final String message;

  const _PlaceholderBookingsView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          color: ColorConstant.blackGreyColor.withValues(alpha: 0.7),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
