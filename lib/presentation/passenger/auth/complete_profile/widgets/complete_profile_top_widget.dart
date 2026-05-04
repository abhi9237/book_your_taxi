import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../controller/passenger_auth_controller.dart';
import '../../../../../core/color_constant/color_constant.dart';
import 'bottom_sheets/complete_profile_image_bottom_sheet.dart';

class CompleteProfileTopWidget extends StatelessWidget {
  final PassengerAuthController controller;
  const CompleteProfileTopWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              controller.onTabBackButton(context);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorConstant.lightGreyColor),
              ),
              child: Icon(Icons.keyboard_backspace, size: 22),
            ),
          ),
        ),

        SizedBox(height: 10),
        Text(
          'Complete Your Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Don't worry, only you can see your personal data. No one else will be able to see it.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: ColorConstant.blackGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        if(controller.selectedUserRole == 'passenger')
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                openCompleteProfileImageBottomSheet(context, controller);
              },
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
                  border: Border.all(
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
                  ),
                  image: controller.profileImage.value != null
                      ? DecorationImage(
                          image: FileImage(
                            File(controller.profileImage.value!.path),
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: controller.profileImage.value == null
                    ? const Icon(
                        Icons.person,
                        size: 50,
                        color: ColorConstant.lightGreyColor,
                      )
                    : null,
              ),
            ),

            Positioned(
              bottom: 0,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  openCompleteProfileImageBottomSheet(context, controller);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstant.appColor,
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 18,
                    color: ColorConstant.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        if(controller.selectedUserRole == 'passenger')
        SizedBox(height: 20),
      ],
    );
  }
}
