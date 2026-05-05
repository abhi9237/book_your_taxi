import 'dart:io';

import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadDrivingLicenceSelectedFileCard extends StatelessWidget {
  final XFile file;
  final String label;
  final VoidCallback onRemove;

  const UploadDrivingLicenceSelectedFileCard({
    super.key,
    required this.file,
    required this.label,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final fileName = file.name;
    final extension = fileName.split('.').last.toUpperCase();
    final fileSizeKb = (File(file.path).lengthSync() / 1024).round();

    return SizedBox(
      width: 118,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(file.path),
                  width: 118,
                  height: 118,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: -8,
                right: -8,
                child: GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF59B0B),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 22 / 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$extension • $fileSizeKb kb',
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.44),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
