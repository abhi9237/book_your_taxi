import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../common/common_text_form_filled.dart';
import '../../../../../controller/passenger_auth_controller.dart';
import '../../../../../core/color_constant/color_constant.dart';
import 'bottom_sheets/complete_profile_country_code_bottom_sheet.dart';
import 'bottom_sheets/complete_profile_gender_bottom_sheet.dart';
import 'bottom_sheets/complete_profile_state_bottom_sheet.dart';

class CompleteProfileTextFilledWidget extends StatelessWidget {
  final PassengerAuthController controller;
  const CompleteProfileTextFilledWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        CommonTextFormFilled(
          hintText: 'Enter your name',
          controller: controller.nameController.value,
        ),
        SizedBox(height: 10),
        Text(
          'Email',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        CommonTextFormFilled(
          readOnly: true,
          hintText: 'Enter your email',
          controller: controller.emailController.value,
        ),
        SizedBox(height: 10),
        Text(
          'Phone Number',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        CommonTextFormFilled(
          keyBoardType: TextInputType.number,
          prefixIcon: GestureDetector(
            onTap: () {
              openCompleteProfileCountryCodeBottomSheet(context, controller);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: ColorConstant.blackColor,
                    size: 20,
                  ),
                  Text(
                    controller.selectedCountryCode.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: 1.5,
                    color: ColorConstant.lightGreyColor,
                  ),
                ],
              ),
            ),
          ),
          hintText: 'Enter your phone number',
          controller: controller.completeProfilePhoneController.value,
          maxLength: 10,
        ),
        SizedBox(height: 10),
        Text(
          'Gender',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        CommonTextFormFilled(
          onTap: () {
            openCompleteProfileGenderBottomSheet(context, controller);
          },
          suffixIcon: Icons.arrow_drop_down_sharp,
          hintText: 'Select',
          controller: controller.completeProfileGenderController.value,
          readOnly: true,
        ),
        if (controller.selectedUserRole == 'driver')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'City You Drive in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              CommonTextFormFilled(
                onTap: () {
                  openCompleteProfileStateBottomSheet(context, controller);
                },
                suffixIcon: Icons.arrow_drop_down_sharp,
                hintText: 'Select state',
                controller: controller.completeProfileLocationController.value,
                readOnly: true,
              ),
            ],
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: ColorConstant.appColor,
              value: controller.isChecked,
              onChanged: (v) {
                controller.onTapAgreeTermsCondition(v ?? false);
              },
            ),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "By Accept, you agree to Company ",
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorConstant.appColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.onTapSignUp(context);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
