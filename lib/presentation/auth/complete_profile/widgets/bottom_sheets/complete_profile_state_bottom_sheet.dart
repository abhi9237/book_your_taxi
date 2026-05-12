import 'package:flutter/material.dart';

import '../../../../../../controller/passenger_auth_controller.dart';
import '../../../../../../core/color_constant/color_constant.dart';

Future<void> openCompleteProfileStateBottomSheet(
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
      return _CompleteProfileStateBottomSheet(controller: controller);
    },
  );
}

class _CompleteProfileStateBottomSheet extends StatefulWidget {
  final PassengerAuthController controller;

  const _CompleteProfileStateBottomSheet({required this.controller});

  @override
  State<_CompleteProfileStateBottomSheet> createState() =>
      _CompleteProfileStateBottomSheetState();
}

class _CompleteProfileStateBottomSheetState
    extends State<_CompleteProfileStateBottomSheet> {
  static const List<String> _indianStatesAndUts = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Delhi',
    'Jammu and Kashmir',
    'Ladakh',
    'Lakshadweep',
    'Puducherry',
  ];

  String? selectedState;

  @override
  void initState() {
    super.initState();
    final value = widget.controller.completeProfileLocationController.value.text
        .trim();
    selectedState = value.isEmpty ? null : value;
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
              'Select State',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorConstant.blackColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose your driving state in India.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorConstant.blackGreyColor,
              ),
            ),
            const SizedBox(height: 14),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: _indianStatesAndUts.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final state = _indianStatesAndUts[index];
                  final isSelected = selectedState == state;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedState = state;
                      });
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected
                              ? ColorConstant.appColor
                              : ColorConstant.lightGreyColor.withValues(
                                  alpha: 0.2,
                                ),
                          width: 1.2,
                        ),
                        color: isSelected
                            ? ColorConstant.appColor.withValues(alpha: 0.08)
                            : ColorConstant.whiteColor,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
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
                                      height: 10,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorConstant.appColor,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              state,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                      side: BorderSide(
                        color: ColorConstant.lightGreyColor.withValues(
                          alpha: 0.25,
                        ),
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
                    onPressed: selectedState == null
                        ? null
                        : () {
                            widget.controller.selectDrivingState(selectedState!);
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
}
