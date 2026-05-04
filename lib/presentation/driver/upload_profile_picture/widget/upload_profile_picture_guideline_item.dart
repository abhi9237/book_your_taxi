
import 'package:flutter/material.dart';

class GuidelineItem extends StatelessWidget {
  final String text;

  const GuidelineItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 22,
          width: 22,
          decoration: const BoxDecoration(
            color: Color(0xFFF59B0B),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 14,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.48),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}