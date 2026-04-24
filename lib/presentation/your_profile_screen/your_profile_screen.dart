import 'package:flutter/material.dart';

import '../../common/common_button.dart';
import '../../core/color_constant/color_constant.dart';
import 'widgets/your_profile_avatar_widget.dart';
import 'widgets/your_profile_field_widget.dart';
import 'widgets/your_profile_header_widget.dart';

class YourProfileScreen extends StatelessWidget {
  const YourProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YourProfileHeaderWidget(
                    onBackTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: YourProfileAvatarWidget(),
                  ),
                  const SizedBox(height: 40),
                  const YourProfileFieldWidget(
                    label: 'Name',
                    value: 'Esther Howard',
                  ),
                  const SizedBox(height: 18),
                  const YourProfileFieldWidget(
                    label: 'Phone Number',
                    value: '603.555.0123',
                    trailingText: 'Change',
                  ),
                  const SizedBox(height: 18),
                  const YourProfileFieldWidget(
                    label: 'Email',
                    value: 'example@gmail.com',
                    hintText: 'example@gmail.com',
                  ),
                  const SizedBox(height: 18),
                  const YourProfileFieldWidget(
                    label: 'Gender',
                    value: 'Select',
                    showDropdown: true,
                    hintText: 'Select',
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 16,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: CommonButton(
                  buttonText: 'Update',
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
