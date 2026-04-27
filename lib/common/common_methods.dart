import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

Future<void> showToastMessage({
  required String titleMessage,
  required String message,
  required BuildContext context,
  required bool isError,
}) async {
  toastification.show(
    context: context,
    type: isError ? ToastificationType.error : ToastificationType.success,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 3),
    title: Text(
      titleMessage,
      style: TextStyle(
        fontSize: 16,
        color: ColorConstant.blackColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    description: RichText(
      text: TextSpan(
        text: message,
        style: TextStyle(
          fontSize: 14,
          color: ColorConstant.whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    alignment: Alignment.topCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0.3, end: 1.0).animate(animation),
        child: child,
      );
    },
    icon: isError
        ? const Icon(Icons.error, color: ColorConstant.whiteColor)
        : const Icon(Icons.check),
    showIcon: true, // show or hide the icon
    primaryColor: Colors.green,
    backgroundColor: isError ? ColorConstant.redColor : ColorConstant.appColor,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    showProgressBar: true,
    closeButton: ToastCloseButton(
      showType: CloseButtonShowType.onHover,
      buttonBuilder: (context, onClose) {
        return OutlinedButton.icon(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 20),
          label: const Text('Close'),
        );
      },
    ),
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    onHoverMouseCursor: SystemMouseCursors.click,
    callbacks: ToastificationCallbacks(
      onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
      onCloseButtonTap: (toastItem) =>
          print('Toast ${toastItem.id} close button tapped'),
      onAutoCompleteCompleted: (toastItem) =>
          print('Toast ${toastItem.id} auto complete completed'),
      onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    ),
  );
}

bool isValidEmail(String email) {
  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  return emailRegex.hasMatch(email);
}
