import 'package:flutter/cupertino.dart';
import '../core/color_constant/color_constant.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final Color? textColor;
  final List<Color>? gradientColors;
  const CommonButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.textColor,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors:
                gradientColors ??
                [ColorConstant.appColor, ColorConstant.appColor],
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: textColor ?? ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}

class CommonCircularButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconImg;
  const CommonCircularButton({super.key, required this.iconImg, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstant.appColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Image.asset(iconImg, color: ColorConstant.whiteColor),
        ),
      ),
    );
  }
}

class CommonSocialLoginButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconImg;
  const CommonSocialLoginButton({super.key, required this.iconImg, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorConstant.lightGreyColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(iconImg,),
        ),
      ),
    );
  }
}
