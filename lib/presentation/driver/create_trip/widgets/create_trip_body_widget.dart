import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import '../../../../controller/create_trip_controller.dart';

class CreateTripBodyWidget extends StatelessWidget {
  final CreateTripController? controller;
  const CreateTripBodyWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(controller!, context),
            const SizedBox(height: 18),
            const Text(
              'Publish a Trip',
              style: TextStyle(
                color: ColorConstant.whiteColor,
                fontSize: 42 / 1.6,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Share your journey and earn from empty\nseats.',
              style: TextStyle(
                color: ColorConstant.whiteColor.withValues(alpha: 0.86),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                const Text(
                  'Car Photos',
                  style: TextStyle(
                    color: ColorConstant.whiteColor,
                    fontSize: 30 / 1.7,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  'REQUIRED: 4',
                  style: TextStyle(
                    color: const Color(0xFFFF7A00).withValues(alpha: 0.95),
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.08,
              children: const [
                _PhotoTile(label: 'EXTERIOR FRONT'),
                _PhotoTile(label: 'INTERIOR DASH'),
                _PhotoTile(label: 'REAR VIEW'),
                _PhotoTile(label: 'SEATING AREA'),
              ],
            ),
            const SizedBox(height: 16),
            const _LabelText('TRIP TITLE'),
            const SizedBox(height: 8),
            _darkField('e.g. Weekend Trip to Coastal Bay'),
            const SizedBox(height: 12),
            const _LabelText('DESCRIPTION'),
            const SizedBox(height: 8),
            _darkField(
              'Tell passengers about the ride, music, or\nluggage space...',
              minHeight: 84,
            ),
            const SizedBox(height: 16),
            _routeCard(),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _miniField(
                    'DATE',
                    'dd/mm/yyyy',
                    Icons.calendar_today_outlined,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _miniField(
                    'DEPARTURE',
                    '--:-- --',
                    Icons.access_time_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _statCard(
                    'EST. DISTANCE',
                    '0',
                    suffix: 'KM',
                    icon: Icons.route_rounded,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _statCard(
                    'AVAILABLE SEATS',
                    '3',
                    icon: Icons.event_seat_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            _earningsCard(),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }

  Widget _topBar(CreateTripController controller, BuildContext context) {
    return Row(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            controller.onClickBack(context);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              border: Border.all(color: ColorConstant.lightGreyColor),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.keyboard_backspace_outlined),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFFF6A00), width: 1.1),
        color: Colors.black.withValues(alpha: 0.3),
      ),
      child: Icon(icon, size: 18, color: ColorConstant.whiteColor),
    );
  }

  Widget _darkField(String hint, {double minHeight = 52}) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF13151B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        hint,
        style: TextStyle(
          color: ColorConstant.whiteColor.withValues(alpha: 0.34),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _routeCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF15181E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.radio_button_checked,
                color: Color(0xFFFF7A00),
                size: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PICKUP POINT',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Text(
                    'Current location or city',
                    style: TextStyle(
                      color: ColorConstant.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(width: 2, height: 20, color: Colors.white24),
            ),
          ),
          Row(
            children: [
              const Icon(Icons.trip_origin, color: Color(0xFF005CFF), size: 20),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DROP-OFF DESTINATION',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Where are you heading?',
                    style: TextStyle(
                      color: ColorConstant.whiteColor.withValues(alpha: 0.56),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniField(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: const Color(0xFF15181E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Icon(icon, size: 14, color: Colors.white54),
              const SizedBox(width: 6),
              Text(
                value,
                style: const TextStyle(
                  color: ColorConstant.whiteColor,
                  fontSize: 20 / 1.35,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statCard(
    String title,
    String value, {
    String? suffix,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F26),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 16, color: const Color(0xFF23C3FF)),
                const SizedBox(width: 6),
              ],
              Text(
                value,
                style: const TextStyle(
                  color: ColorConstant.whiteColor,
                  fontSize: 30 / 1.4,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (suffix != null) ...[
                const SizedBox(width: 6),
                Text(
                  suffix,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _earningsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFF6A00),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'EARNINGS CONFIGURATION',
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 14 / 1.25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spacer(),
              Icon(
                Icons.payments_outlined,
                color: ColorConstant.blackColor,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _earningCol(label: 'PRICE PER SEAT', value: '\$ 25.00'),
              ),
              Container(width: 1, height: 42, color: Colors.black26),
              Expanded(
                child: _earningCol(label: 'TOTAL POTENTIAL', value: '\$ 75.00'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _earningCol({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.75),
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 30 / 1.5,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _LabelText extends StatelessWidget {
  final String text;
  const _LabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFFFF7A00).withValues(alpha: 0.95),
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.4,
      ),
    );
  }
}

class _PhotoTile extends StatelessWidget {
  final String label;
  const _PhotoTile({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF12141A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFFF7A00).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_camera_outlined,
            color: Colors.white.withValues(alpha: 0.45),
            size: 24,
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
