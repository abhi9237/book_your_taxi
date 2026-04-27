import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class CompletedBookingCardWidget extends StatelessWidget {
  final String driverName;
  final String vehicleType;
  final String avatarLabel;
  final Color mapAccent;

  const CompletedBookingCardWidget({
    super.key,
    required this.driverName,
    required this.vehicleType,
    required this.avatarLabel,
    required this.mapAccent,
  });

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
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: const Color(0xFFD9D9D9),
                child: Text(
                  avatarLabel,
                  style: const TextStyle(
                    color: ColorConstant.blackColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      driverName,
                      style: const TextStyle(
                        color: ColorConstant.blackColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      vehicleType,
                      style: const TextStyle(
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
          ),
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
          const SizedBox(height: 12),
          Center(
            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: ColorConstant.blackGreyColor.withValues(alpha: 0.9),
              size: 28,
            ),
          ),
          const SizedBox(height: 2),
          _MiniMapPreview(accentColor: mapAccent),
        ],
      ),
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

class _MiniMapPreview extends StatelessWidget {
  final Color accentColor;

  const _MiniMapPreview({required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: double.infinity,
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Container(
          height: 3,
          width: 42,
          decoration: BoxDecoration(
            color: ColorConstant.blackGreyColor.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
    );
  }
}
