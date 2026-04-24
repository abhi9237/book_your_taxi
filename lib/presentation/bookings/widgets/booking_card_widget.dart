import 'package:flutter/material.dart';

import '../../../common/common_button.dart';
import '../../../core/color_constant/color_constant.dart';

class BookingCardWidget extends StatelessWidget {
  const BookingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: ColorConstant.lightGreyColor.withValues(alpha: 0.14),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          _DriverRow(),
          const SizedBox(height: 16),
          const Divider(height: 1, thickness: 1, color: Color(0xFFEAEAEA)),
          const SizedBox(height: 14),
          const _TripStatsRow(),
          const SizedBox(height: 12),
          const _DateTimeRow(),
          const SizedBox(height: 14),
          const _LocationRow(
            icon: Icons.radio_button_checked,
            iconColor: Color(0xFF303030),
            address: '6391 Elgin St. Celina, Delawa...',
          ),
          const SizedBox(height: 14),
          const _LocationRow(
            icon: Icons.location_on,
            iconColor: ColorConstant.appColor,
            address: '1901 Thornridge Cir. Sh...',
          ),
          const SizedBox(height: 14),
          const _CarNumberRow(),
          const SizedBox(height: 14),
          const _MapPreview(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  title: 'Cancel',
                  backgroundColor: Color(0xFFF4F4F4),
                  textColor: ColorConstant.appColor,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _ActionButton(
                  title: 'Reschedule',
                  backgroundColor: ColorConstant.appColor,
                  textColor: ColorConstant.whiteColor,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DriverRow extends StatelessWidget {
  const _DriverRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundColor: Color(0xFFD9D9D9),
          child: Text(
            'JW',
            style: TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jenny Wilson',
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Sedan ( 4 Seater)',
                style: TextStyle(
                  color: ColorConstant.blackGreyColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: const [
            Icon(Icons.star, color: ColorConstant.appColor, size: 22),
            SizedBox(width: 4),
            Text(
              '5.0',
              style: TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TripStatsRow extends StatelessWidget {
  const _TripStatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _TripStat(icon: Icons.location_on_outlined, text: '4.5 Mile'),
        _TripStat(icon: Icons.access_time, text: '4 mins'),
        _TripStat(icon: Icons.card_travel, text: '\$1.25 /mile'),
      ],
    );
  }
}

class _TripStat extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TripStat({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: ColorConstant.appColor, size: 20),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _DateTimeRow extends StatelessWidget {
  const _DateTimeRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Date & Time',
          style: TextStyle(
            color: ColorConstant.blackGreyColor,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Oct 18, 2023 | 08:00 AM',
          style: TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _LocationRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String address;

  const _LocationRow({
    required this.icon,
    required this.iconColor,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconColor.withValues(alpha: 0.12),
          ),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            address,
            style: const TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _CarNumberRow extends StatelessWidget {
  const _CarNumberRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Car Number',
          style: TextStyle(
            color: ColorConstant.blackGreyColor,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'GR 678-UVWX',
          style: TextStyle(
            color: ColorConstant.blackColor,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _MapPreview extends StatelessWidget {
  const _MapPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ColorConstant.lightGreyColor.withValues(alpha: 0.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            ..._buildRoads(),
            Positioned(
              left: 38,
              top: 72,
              child: _Marker(
                color: ColorConstant.appColor,
                innerColor: ColorConstant.whiteColor,
              ),
            ),
            Positioned(
              right: 34,
              top: 58,
              child: _Marker(
                color: ColorConstant.appColor,
                innerColor: ColorConstant.whiteColor,
              ),
            ),
            Positioned(
              left: 72,
              top: 35,
              child: Transform.rotate(
                angle: -0.8,
                child: Container(
                  width: 122,
                  height: 2,
                  color: const Color(0xFF6A6A6A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRoads() {
    return [
      Positioned(
        left: -20,
        top: 18,
        child: Transform.rotate(
          angle: -0.7,
          child: Container(width: 180, height: 8, color: Colors.white.withValues(alpha: 0.86)),
        ),
      ),
      Positioned(
        left: 40,
        top: 0,
        child: Transform.rotate(
          angle: -0.2,
          child: Container(width: 170, height: 8, color: Colors.white.withValues(alpha: 0.8)),
        ),
      ),
      Positioned(
        right: -12,
        top: 20,
        child: Transform.rotate(
          angle: 0.45,
          child: Container(width: 180, height: 8, color: Colors.white.withValues(alpha: 0.84)),
        ),
      ),
      Positioned(
        right: 12,
        bottom: 8,
        child: Transform.rotate(
          angle: 0.28,
          child: Container(width: 170, height: 8, color: Colors.white.withValues(alpha: 0.8)),
        ),
      ),
      Positioned(
        left: 8,
        top: 88,
        child: Container(width: 120, height: 4, color: Colors.white.withValues(alpha: 0.85)),
      ),
    ];
  }
}

class _Marker extends StatelessWidget {
  final Color color;
  final Color innerColor;

  const _Marker({required this.color, required this.innerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: innerColor,
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 3),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      buttonText: title,
      onTap: onTap,
      textColor: textColor,
      gradientColors: [backgroundColor, backgroundColor],
    );
  }
}
