import 'package:flutter/material.dart';

class DriverHomeRecentBookingsCard extends StatelessWidget {
  const DriverHomeRecentBookingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Recent Bookings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              'VIEW ALL',
              style: TextStyle(
                color: const Color(0xFFFF7A00),
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 166,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _BookingCard(
                title: 'TODAY, 4:30 PM',
                status: 'Scheduled',
                pickup: 'Downtown',
                drop: 'LAX Terminal 4',
                fare: '\$54.20',
                borderColor: Color(0xFFFF7A00),
              ),
              SizedBox(width: 12),
              _BookingCard(
                title: 'TOMORROW, 8:00 AM',
                status: 'Upcoming',
                pickup: 'Santa Monica',
                drop: 'Westwood',
                fare: '\$31.90',
                borderColor: Color(0xFF9CA9FF),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BookingCard extends StatelessWidget {
  final String title;
  final String status;
  final String pickup;
  final String drop;
  final String fare;
  final Color borderColor;

  const _BookingCard({
    required this.title,
    required this.status,
    required this.pickup,
    required this.drop,
    required this.fare,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF12151B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.75),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF7A00).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Scheduled',
                        style: TextStyle(
                          color: Color(0xFFFF7A00),
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _lineItem(Icons.circle_outlined, pickup),
                const SizedBox(height: 6),
                _lineItem(Icons.location_on_outlined, drop),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'Est. Fare',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.65),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      fare,
                      style: const TextStyle(
                        color: Color(0xFFFF7A00),
                        fontSize: 40 / 1.6,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _lineItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 15, color: Colors.white.withValues(alpha: 0.85)),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
