import 'package:flutter/material.dart';

class UploadGovernmentIdDropZone extends StatelessWidget {
  final VoidCallback onTap;

  const UploadGovernmentIdDropZone({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: CustomPaint(
        painter: _DashedRectPainter(color: const Color(0xFFD3D3D3)),
        child: Container(
          width: double.infinity,
          height: 200,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.file_upload_outlined,
                  color: Color(0xFF7E7E7E),
                  size: 30,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Upload Documents',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.44),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  final Color color;

  _DashedRectPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    const dashWidth = 8.0;
    const dashSpace = 6.0;
    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(12),
    );

    for (final metric in (Path()..addRRect(rect)).computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final double length = dashWidth < metric.length - distance
            ? dashWidth
            : metric.length - distance;
        canvas.drawPath(metric.extractPath(distance, distance + length), paint);
        distance += length + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
