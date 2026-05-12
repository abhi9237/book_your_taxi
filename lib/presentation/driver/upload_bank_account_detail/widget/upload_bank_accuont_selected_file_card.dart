import 'dart:io';

import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadBankAccuontSelectedFileCard extends StatelessWidget {
  final XFile file;
  final VoidCallback onRemove;

  const UploadBankAccuontSelectedFileCard({
    super.key,
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final fileName = file.name;
    final extension = fileName.split('.').last.toUpperCase();
    final fileSizeKb = (File(file.path).lengthSync() / 1024).round();

    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 132,
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
                    width: 132,
                    height: 132,
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
            const Text(
              'Bank Cheque',
              style: TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '$extension • $fileSizeKb kb',
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.44),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
