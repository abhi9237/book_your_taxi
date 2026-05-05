import 'package:flutter/material.dart';

class DriverReelsFeedActionColumn extends StatelessWidget {
  const DriverReelsFeedActionColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _actionCircle(icon: Icons.favorite_border_rounded, label: '24.5K'),
        const SizedBox(height: 14),
        _actionCircle(icon: Icons.chat_bubble_outline_rounded, label: '842'),
        const SizedBox(height: 14),
        _actionCircle(icon: Icons.share_outlined, label: 'Share'),
        const SizedBox(height: 14),
        Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withValues(alpha: 0.28),
            border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
          ),
          child: const Icon(
            Icons.music_note,
            color: Color(0xFFFF7A00),
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _actionCircle({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withValues(alpha: 0.28),
            border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
          ),
          child: Icon(
            icon,
            color: Colors.white.withValues(alpha: 0.9),
            size: 28,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17 / 1.6,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
