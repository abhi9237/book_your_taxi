import 'package:flutter/material.dart';
import '../../../../../../controller/passenger_auth_controller.dart';
import '../../../../../../core/color_constant/color_constant.dart';

Future<void> openCompleteProfileGenderBottomSheet(
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
      return _CompleteProfileGenderBottomSheet(controller: controller);
    },
  );
}

class _CompleteProfileGenderBottomSheet extends StatefulWidget {
  final PassengerAuthController controller;

  const _CompleteProfileGenderBottomSheet({required this.controller});

  @override
  State<_CompleteProfileGenderBottomSheet> createState() =>
      _CompleteProfileGenderBottomSheetState();
}

class _CompleteProfileGenderBottomSheetState
    extends State<_CompleteProfileGenderBottomSheet> {
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.controller.selectedGender.value.isEmpty
        ? null
        : widget.controller.selectedGender.value;
  }

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
              'Select Gender',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorConstant.blackColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose the option that best describes you.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorConstant.blackGreyColor,
              ),
            ),
            const SizedBox(height: 20),
            _buildGenderOption('Male'),
            const SizedBox(height: 12),
            _buildGenderOption('Female'),
            const SizedBox(height: 12),
            _buildGenderOption('Other'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                      side: BorderSide(
                        color: ColorConstant.lightGreyColor.withValues(alpha: 0.25),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: ColorConstant.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: MaterialButton(
                    onPressed: selectedGender == null
                        ? null
                        : () {
                            widget.controller.selectGender(selectedGender!);
                            Navigator.pop(context);
                          },
                    height: 52,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: ColorConstant.appColor,
                    disabledColor: ColorConstant.appColor.withValues(alpha: 0.4),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: ColorConstant.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    final bool isSelected = selectedGender == gender;

    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? ColorConstant.appColor
                : ColorConstant.lightGreyColor.withValues(alpha: 0.2),
            width: 1.2,
          ),
          color: isSelected
              ? ColorConstant.appColor.withValues(alpha: 0.08)
              : ColorConstant.whiteColor,
        ),
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
                      : ColorConstant.lightGreyColor,
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
            const SizedBox(width: 12),
            Text(
              gender,
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
