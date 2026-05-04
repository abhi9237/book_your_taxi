import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/controller/upload_profile_picture_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/driver/upload_profile_picture/widget/upload_profile_picture_guideline_item.dart';
import 'package:book_your_taxi/presentation/driver/upload_profile_picture/widget/upload_profile_picture_widget.dart';
import 'package:book_your_taxi/presentation/driver/upload_profile_picture/widget/upload_profile_selected_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class UploadProfilePictureScreen extends StatelessWidget {
  const UploadProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadProfilePictureController>(
      init: UploadProfilePictureController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(999),
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFE9E9E9),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.04,
                                      ),
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 16,
                                  color: Color(0xFF2B2B2B),
                                ),
                              ),
                            ),
                            Text(
                              'Profile Picture',
                              style: TextStyle(
                                color: ColorConstant.blackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 35),
                          ],
                        ),

                        const SizedBox(height: 28),
                        const GuidelineItem(
                          text: 'Please Upload a Clear Selfie',
                        ),
                        const SizedBox(height: 16),
                        const GuidelineItem(
                          text:
                              'The Selfie Should have the applicants face alone',
                        ),
                        const SizedBox(height: 16),
                        const GuidelineItem(text: 'Upload PDF / JPEG / PNG'),
                        const SizedBox(height: 22),
                        Divider(
                          height: 1,
                          color: Colors.black.withValues(alpha: 0.08),
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          'Profile Picture',
                          style: TextStyle(
                            color: ColorConstant.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 14),
                        UploadDropZone(
                          onTap: () => _showPickerSheet(context, controller),
                        ),
                        const SizedBox(height: 20),
                        if (controller.selectedFile.value != null)
                          SelectedFileCard(
                            file: controller.selectedFile.value!,
                            onRemove: controller.removeSelectedFile,
                          ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteColor,
                    border: Border(
                      top: BorderSide(
                        color: Colors.black.withValues(alpha: 0.04),
                      ),
                    ),
                  ),
                  child: SafeArea(
                    top: false,
                    child: CommonButton(
                      buttonText: 'Done',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      gradientColors: const [
                        Color(0xFFF59B0B),
                        Color(0xFFF59B0B),
                      ],
                      height: 52,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPickerSheet(
    BuildContext context,
    UploadProfilePictureController controller,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorConstant.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 56,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 18),
                _BottomActionItem(
                  icon: Icons.photo_library_outlined,
                  title: 'Choose from gallery',
                  onTap: () async {
                    Navigator.of(sheetContext).pop();
                    await controller.pickFromGallery();
                  },
                ),
                const SizedBox(height: 12),
                _BottomActionItem(
                  icon: Icons.camera_alt_outlined,
                  title: 'Take a photo',
                  onTap: () async {
                    Navigator.of(sheetContext).pop();
                    await controller.pickFromCamera();
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BottomActionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _BottomActionItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.18),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.appColor.withValues(alpha: 0.12),
              ),
              child: Icon(icon, color: ColorConstant.appColor),
            ),
            const SizedBox(width: 14),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: ColorConstant.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
