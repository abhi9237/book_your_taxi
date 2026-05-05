import 'package:flutter/material.dart';

class DriverHomeWeeklyChartCard extends StatelessWidget {
  const DriverHomeWeeklyChartCard({super.key});

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
          Row(
            children: [
              const Text(
                'Weekly Performance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16 / 1.2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                child: Text(
                  'Last 7 Days',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 118,
              width: double.infinity,
              child: CustomPaint(painter: _ChartPainter()),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _DayText('MON'),
              _DayText('TUE'),
              _DayText('WED'),
              _DayText('THU'),
              _DayText('FRI'),
              _DayText('SAT'),
              _DayText('SUN'),
            ],
          ),
        ],
      ),
    );
  }
}

class _DayText extends StatelessWidget {
  final String text;
  const _DayText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.45),
        fontSize: 9,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.82)
      ..cubicTo(
        size.width * 0.12,
        size.height * 0.45,
        size.width * 0.2,
        size.height * 0.22,
        size.width * 0.32,
        size.height * 0.5,
      )
      ..cubicTo(
        size.width * 0.45,
        size.height * 0.8,
        size.width * 0.58,
        size.height * 0.95,
        size.width * 0.7,
        size.height * 0.24,
      )
      ..cubicTo(
        size.width * 0.79,
        size.height * 0.02,
        size.width * 0.86,
        size.height * 0.08,
        size.width,
        size.height * 0.1,
      );

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0x55FF7A00), Color(0x11FF7A00)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Offset.zero & size)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = const Color(0xFFFF7A00)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = const Color(0xFF111318),
    );
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
