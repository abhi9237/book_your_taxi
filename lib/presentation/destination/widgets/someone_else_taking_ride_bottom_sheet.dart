import 'package:flutter/material.dart';
import '../../../common/common_button.dart';
import '../../../core/color_constant/color_constant.dart';

Future<void> openSomeoneElseTakingRideBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorConstant.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return const SomeoneElseTakingRideBottomSheet();
    },
  );
}

class SomeoneElseTakingRideBottomSheet extends StatefulWidget {
  const SomeoneElseTakingRideBottomSheet({super.key});

  @override
  State<SomeoneElseTakingRideBottomSheet> createState() =>
      _SomeoneElseTakingRideBottomSheetState();
}

class _SomeoneElseTakingRideBottomSheetState
    extends State<SomeoneElseTakingRideBottomSheet> {
  int selectedIndex = 0;

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
            const SizedBox(height: 25),
            const Text(
              'Someone else taking this ride?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorConstant.blackColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Choose a contact so that they also get driver number, vehicle details and ride OTP via SMS.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorConstant.blackGreyColor.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 20),
            _buildOption(
              index: 0,
              icon: Icons.person,
              title: 'My Self',
              iconColor: ColorConstant.appColor,
            ),
            const Divider(height: 1),
            _buildOption(
              index: 1,
              icon: Icons.person,
              title: 'John Doe',
              subtitle: '• (239) 555-0108',
              iconColor: ColorConstant.appColor,
              avatarText: 'J',
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                // TODO: Implement contact selection
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorConstant.appColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.contact_phone_outlined,
                      color: ColorConstant.appColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Choose another contacts',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CommonButton(
              buttonText: 'Confirm',
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

  Widget _buildOption({
    required int index,
    required IconData icon,
    required String title,
    String? subtitle,
    required Color iconColor,
    String? avatarText,
  }) {
    bool isSelected = selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? ColorConstant.appColor
                      : ColorConstant.lightGreyColor.withValues(alpha: 0.5),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.appColor,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 15),
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: avatarText != null
                    ? ColorConstant.appColor
                    : ColorConstant.appColor.withValues(alpha: 0.2),
              ),
              child: Center(
                child: avatarText != null
                    ? Text(
                        avatarText,
                        style: const TextStyle(
                          color: ColorConstant.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Icon(icon, color: iconColor, size: 20),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.blackColor,
                      ),
                    ),
                    if (subtitle != null)
                      TextSpan(
                        text: ' $subtitle',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.blackGreyColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
