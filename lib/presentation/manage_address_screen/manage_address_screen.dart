import 'package:flutter/material.dart';

import '../../common/common_button.dart';
import '../../core/color_constant/color_constant.dart';
import 'widgets/manage_address_header_widget.dart';
import 'widgets/manage_address_item_widget.dart';

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = <ManageAddressItemData>[
      ManageAddressItemData(
        title: 'Home',
        subtitle: '1901 Thornridge Cir, Shiloh, Hawaii 81063',
      ),
      ManageAddressItemData(
        title: 'Office',
        subtitle: '4517 Washington Ave, Manchester, Kentucky 39495',
      ),
      ManageAddressItemData(
        title: "Parent's House",
        subtitle: '8502 Preston Rd, Inglewood, Maine 98380',
      ),
      ManageAddressItemData(
        title: "Friend's House",
        subtitle: '2464 Royal Ln, Mesa, New Jersey 45463',
      ),
    ];

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
                  ManageAddressHeaderWidget(
                    onBackTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
                      ),
                    ),
                    child: Column(
                      children: [
                        for (int i = 0; i < addresses.length; i++) ...[
                          ManageAddressItemWidget(item: addresses[i]),
                          if (i != addresses.length - 1)
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
                            ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  _AddAddressButton(
                    onTap: () {},
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
                  buttonText: 'Apply',
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

class _AddAddressButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddAddressButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ColorConstant.appColor.withValues(alpha: 0.45),
            style: BorderStyle.solid,
            width: 1.2,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: ColorConstant.appColor, size: 20),
            SizedBox(width: 8),
            Text(
              'Add New Address',
              style: TextStyle(
                color: ColorConstant.appColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
