import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class CommonTextFormFilled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? isObscureIcon;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffixWidget;
  final VoidCallback? onTapSuffixIcon;
  final VoidCallback? onTapPrefixIcon;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyBoardType;
  final Color? hintTextColor;
  final bool readOnly;
  final VoidCallback? onTap;

  const CommonTextFormFilled({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureIcon,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.onTapPrefixIcon,
    this.prefixIcon,
    this.maxLength,
    this.maxLines,
    this.keyBoardType,
    this.hintTextColor,
    this.suffixWidget,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      maxLength: maxLength,
      maxLines: maxLines,
      keyboardType: keyBoardType,
      style: TextStyle(color: ColorConstant.blackColor),
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      obscureText: isObscureIcon ?? false,
      controller: controller,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8, top: 3, bottom: 3),
          child:
              suffixWidget ??
              GestureDetector(onTap: onTapSuffixIcon, child: Icon(suffixIcon)),
        ),
      ),
      validator: (v) {
        if (v!.isEmpty) {
          return '$hintText is missing';
        }
        return null;
      },
    );
  }
}

class CommonDescriptionTextFormFilled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? isObscureText;
  const CommonDescriptionTextFormFilled({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText ?? false,
      controller: controller,
      maxLines: 4,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}

class CommonMapTextFormFilled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? isObscureIcon;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTapSuffixIcon;
  final VoidCallback? onTapPrefixIcon;
  final VoidCallback? onTap;
  final Function(String)? onChangeText;
  final int? maxLength;
  final TextInputType? keyBoardType;
  final Color? fillColor;
  final bool readOnly;

  const CommonMapTextFormFilled({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureIcon,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.onTapPrefixIcon,
    this.onTap,
    this.prefixIcon,
    this.maxLength,
    this.keyBoardType,
    this.fillColor,
    this.onChangeText,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChangeText,
      onTap: onTap,
      readOnly: readOnly,
      maxLength: maxLength,
      keyboardType: keyBoardType,
      style: TextStyle(color: ColorConstant.blackColor),
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      obscureText: isObscureIcon ?? false,
      controller: controller,
      decoration: InputDecoration(
        fillColor: fillColor ?? ColorConstant.whiteColor,
        filled: true,
        counterText: '',
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: onTapSuffixIcon,
          child: Icon(suffixIcon),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (v) {
        if (v!.isEmpty) {
          return '$hintText is missing';
        }
        return null;
      },
    );
  }
}
