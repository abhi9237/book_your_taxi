import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../controller/passenger_auth_controller.dart';

Future<void> openCompleteProfileImageBottomSheet(
  BuildContext context,
    PassengerAuthController controller,
) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorConstant.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return _CompleteProfileImageBottomSheet(controller: controller);
    },
  );
}

class _CompleteProfileImageBottomSheet extends StatelessWidget {
  final PassengerAuthController controller;

  const _CompleteProfileImageBottomSheet({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 3,
                width: MediaQuery.sizeOf(context).width * 0.2,
                decoration: BoxDecoration(
                  color: ColorConstant.lightGreyColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Add Profile Photo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorConstant.blackColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose a photo from your gallery or camera.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorConstant.blackGreyColor,
              ),
            ),
            const SizedBox(height: 20),
            _buildAction(
              icon: Icons.photo_library_outlined,
              title: 'Choose from gallery',
              onTap: () async {
                Navigator.pop(context);
                await controller.pickProfileImage(ImageSource.gallery);
              },
            ),
            const SizedBox(height: 12),
            _buildAction(
              icon: Icons.camera_alt_outlined,
              title: 'Take a photo',
              onTap: () async {
                Navigator.pop(context);
                await controller.pickProfileImage(ImageSource.camera);
              },
            ),
            const SizedBox(height: 20),
            CommonButton(
              buttonText: 'Cancel',
              textColor: ColorConstant.blackColor,
              gradientColors: [
                ColorConstant.lightGreyColor.withValues(alpha: 0.12),
                ColorConstant.lightGreyColor.withValues(alpha: 0.12),
              ],
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildAction({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
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
