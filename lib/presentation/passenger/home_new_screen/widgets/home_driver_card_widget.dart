import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';
import '../home_new_screen.dart';

class DriverRideCard extends StatelessWidget {
  final DriverRideData ride;

  const DriverRideCard({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  color: ride.accentColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    ride.driverInitials,
                    style: TextStyle(
                      color: ride.accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
                            ride.driverName,
                            style: const TextStyle(
                              color: ColorConstant.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        _StatusChip(label: ride.statusLabel),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFF5A623),
                          size: 18,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${ride.rating}',
                          style: const TextStyle(
                            color: ColorConstant.blackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${ride.reviews} reviews)',
                          style: TextStyle(
                            color: ColorConstant.lightGreyColor.withValues(
                              alpha: 0.9,
                            ),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${ride.carName} • ${ride.plateNumber}',
                      style: TextStyle(
                        color: ColorConstant.lightGreyColor.withValues(
                          alpha: 0.95,
                        ),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7FB),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                _RideDetailRow(
                  icon: Icons.trip_origin_rounded,
                  label: 'From',
                  value: ride.pickup,
                ),
                const SizedBox(height: 10),
                _RideDetailRow(
                  icon: Icons.location_on_rounded,
                  label: 'To',
                  value: ride.dropOff,
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _RideMetaChip(
                icon: Icons.access_time_rounded,
                text: '${ride.etaMinutes} mins away',
              ),
              const SizedBox(width: 8),
              _RideMetaChip(
                icon: Icons.event_seat_outlined,
                text: '${ride.seats} seats',
              ),
              const SizedBox(width: 8),
              _RideMetaChip(
                icon: Icons.luggage_outlined,
                text: '${ride.luggage} bag',
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimated fare',
                    style: TextStyle(
                      color: ColorConstant.lightGreyColor.withValues(
                        alpha: 0.9,
                      ),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '\$${ride.fare.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: ColorConstant.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.appColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  'View Ride',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RideDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _RideDetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(icon, size: 16, color: ColorConstant.appColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: ColorConstant.lightGreyColor.withValues(alpha: 0.85),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RideMetaChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _RideMetaChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7FB),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: ColorConstant.appColor),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;

  const _StatusChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: ColorConstant.appColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: ColorConstant.appColor,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}