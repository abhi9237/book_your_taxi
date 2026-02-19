import 'dart:developer';

import 'package:book_your_taxi/core/image_constant/image_constant.dart';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  final PageController pageController = PageController();
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final Rx<TextEditingController> nameController = TextEditingController().obs;
  final RxBool isObsecureValue = true.obs;
  bool isChecked = false;

  RxInt currentIndex = 0.obs;

  BuildContext context;
  AuthController({required this.context});

  final List<Map<String, String>> pages = [
    {
      "title": "Book a Ride ",
      "subtitle": "Anywhere, Anytime!",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "image": ImageConstant.onBoarding1,
    },
    {
      "title": "Choose Your Comfort: ",
      "subtitle": "Enjoy a Luxurious Ride",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "image": ImageConstant.onBoarding2,
    },
    {
      "title": "Elevate Your ",
      "subtitle": "Ride Tracking Experience",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "image": ImageConstant.onBoarding3,
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void onTapSignIn() {
    context.pop();
  }

  void onTabBackButton(BuildContext context) {
    context.pop();
  }

  void onTapVerifyButton(){
    context.push(RouteConstant.locationAccess);
  }

  void onTapAgreeTermsCondition(bool value) {
    isChecked = value;
    update();
  }

  void onClickEyeIcon() {
    isObsecureValue.value = !isObsecureValue.value;
    update();
  }

  void clearController() {
    emailController.value.clear();
    passwordController.value.clear();
    nameController.value.clear();
    update();
  }

  Future<void> onBoardingPageSelection(int index) async {
    currentIndex.value = index;
    update();
  }

  void onTapGetStarted(BuildContext context) {
    context.go(RouteConstant.onBoardingPages);
  }

  void onTapCompleteProfileButton() {
    context.push(RouteConstant.verifyOtp);
  }

  void onTapSignUp() {
    context.push(RouteConstant.signUp);
  }

  void onTapAllowLocationAccess(BuildContext context){
    context.push(RouteConstant.bottomNav);
  }

  void forwardToNextPage(BuildContext context) {
    if (currentIndex.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    } else {
      context.go(RouteConstant.login);
    }
  }

  void backwardToPreviousPage() {
    log('currentIndex.value ${currentIndex.value}');
    log('pages.length ${pages.length - 1}');

    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  void onTapSignUpButton() {
    context.push(RouteConstant.completeProfile);
  }
}
