import 'package:flutter/material.dart';

class DriverHomeHubCard extends StatelessWidget {
  const DriverHomeHubCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF15181E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Driver Hub',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16 / 1.2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _post(
            title:
                'Avoid the construction on I-5 North near stadium. Added 15 mins to my last run.',
            author: 'Marcus J.',
            time: '3h ago',
          ),
          const SizedBox(height: 10),
          _post(
            title: 'Just hit 500 trips this month! Bonus payout just dropped.',
            author: 'Elena K.',
            time: '1h ago',
          ),
          const SizedBox(height: 12),
          Container(
            height: 36,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF1E2127),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              'JOIN DISCUSSION',
              style: TextStyle(
                color: Color(0xFFFF7A00),
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _post({
    required String title,
    required String author,
    required String time,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 8,
              backgroundColor: Color(0x22FF7A00),
              child: Icon(Icons.person, size: 10, color: Color(0xFFFF7A00)),
            ),
            const SizedBox(width: 6),
            Text(
              author,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '| $time',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.82),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}
