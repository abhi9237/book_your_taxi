import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/controller/upload_driving_licence_detail_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/presentation/driver/upload_driving_licence_detail/widget/upload_driving_licence_drop_zone.dart';
import 'package:book_your_taxi/presentation/driver/upload_driving_licence_detail/widget/upload_driving_licence_guideline_item.dart';
import 'package:book_your_taxi/presentation/driver/upload_driving_licence_detail/widget/upload_driving_licence_selected_file_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class UploadDrivingLicenceDetailScreen extends StatelessWidget {
  const UploadDrivingLicenceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadDrivingLicenceDetailController>(
      init: UploadDrivingLicenceDetailController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: 100,
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
                  offset: Offset(0, -2),
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                CommonButton(
                  buttonText: 'Done',
                  onTap: () {
                    // controller.onTapAllowLocationAccess(context);
                  },
                ),

              ],
            ),
          ),
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
                            const Text(
                              'Driving License',
                              style: TextStyle(
                                color: ColorConstant.blackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 35),
                          ],
                        ),
                        const SizedBox(height: 28),
                        const UploadDrivingLicenceGuidelineItem(
                          text:
                              'Photocopies and printouts of documents will not be accepted.',
                        ),
                        const SizedBox(height: 16),
                        const UploadDrivingLicenceGuidelineItem(
                          text:
                              'The photo and all details must be clearly visible.',
                        ),
                        const SizedBox(height: 16),
                        const UploadDrivingLicenceGuidelineItem(
                          text:
                              'Only documents that are less than 10 MB in size and in JPG, JPEG, PNG, or PDF format will be accepted.',
                        ),
                        const SizedBox(height: 22),
                        Divider(
                          height: 1,
                          color: Colors.black.withValues(alpha: 0.08),
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          'Attach Driving License',
                          style: TextStyle(
                            color: ColorConstant.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 14),
                        UploadDrivingLicenceDropZone(
                          onTap: () => _showPickerSheet(
                            context,
                            controller,
                            controller.nextPendingSide(),
                          ),
                        ),
                        const SizedBox(height: 14),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black.withValues(alpha: 0.66),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            children: const [
                              TextSpan(
                                text: 'Note : ',
                                style: TextStyle(
                                  color: Color(0xFFF59B0B),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Please upload both sides of Driving License',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            if (controller.frontFile.value != null)
                              UploadDrivingLicenceSelectedFileCard(
                                file: controller.frontFile.value!,
                                label: 'Front',
                                onRemove: () => controller.removeFile(
                                  DrivingLicenceSide.front,
                                ),
                              ),
                            if (controller.frontFile.value != null &&
                                controller.backFile.value != null)
                              const SizedBox(width: 18),
                            if (controller.backFile.value != null)
                              UploadDrivingLicenceSelectedFileCard(
                                file: controller.backFile.value!,
                                label: 'Back',
                                onRemove: () => controller.removeFile(
                                  DrivingLicenceSide.back,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
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
    UploadDrivingLicenceDetailController controller,
    DrivingLicenceSide side,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorConstant.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        final title = side == DrivingLicenceSide.front
            ? 'Upload front side'
            : 'Upload back side';
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 56,
                    decoration: BoxDecoration(
                      color: ColorConstant.lightGreyColor.withValues(
                        alpha: 0.3,
                      ),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: ColorConstant.blackColor,
                  ),
                ),
                const SizedBox(height: 14),
                _BottomActionItem(
                  icon: Icons.photo_library_outlined,
                  title: 'Choose from gallery',
                  onTap: () async {
                    Navigator.of(sheetContext).pop();
                    await controller.pickFromGallery(side);
                  },
                ),
                const SizedBox(height: 12),
                _BottomActionItem(
                  icon: Icons.camera_alt_outlined,
                  title: 'Take a photo',
                  onTap: () async {
                    Navigator.of(sheetContext).pop();
                    await controller.pickFromCamera(side);
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
