import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class AddressTypeSelectorWidget extends StatelessWidget {
  final List<String> types;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const AddressTypeSelectorWidget({
    super.key,
    required this.types,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: types.length,
        separatorBuilder: (context, childIndex) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final selected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? ColorConstant.appColor : ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: selected
                      ? ColorConstant.appColor
                      : ColorConstant.lightGreyColor.withValues(alpha: 0.16),
                ),
              ),
              child: Text(
                types[index],
                style: TextStyle(
                  color: selected ? ColorConstant.whiteColor : ColorConstant.blackColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
