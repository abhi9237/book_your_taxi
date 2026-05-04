import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const AppLoader({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main UI
        child,
        // Loader Overlay
        if (isLoading)
          Positioned.fill(
            child: AbsorbPointer(
              absorbing: true,
              child: Container(
                color: Colors.black.withOpacity(0.4),
                child: Center(
                  child: LoadingAnimationWidget.newtonCradle(
                    color: ColorConstant.appColor,
                    size: 120,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
