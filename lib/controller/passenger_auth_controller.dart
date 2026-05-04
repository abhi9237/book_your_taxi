import 'dart:async';
import 'dart:developer';
import 'package:book_your_taxi/core/image_constant/image_constant.dart';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../common/common_methods.dart';
import '../core/country_code_json/country_code_json.dart';
import '../models/common/country_model.dart';

class PassengerAuthController extends GetxController {
  final PageController pageController = PageController();
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> searchCountryController =
      TextEditingController().obs;
  final Rx<TextEditingController> otpFilledController =
      TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final Rx<TextEditingController> nameController = TextEditingController().obs;
  final Rx<TextEditingController> completeProfilePhoneController =
      TextEditingController().obs;
  final Rx<TextEditingController> completeProfileGenderController =
      TextEditingController().obs;
  final RxString selectedCountryCode = '+91'.obs;
  final RxString selectedCountryName = 'India'.obs;
  final Rxn<XFile> profileImage = Rxn<XFile>();
  final RxString selectedGender = ''.obs;
  final RxBool isObsecureValue = true.obs;
  bool isChecked = false;
  final RxBool isSignInFlow = false.obs;
  RxBool isSendVerificationEmail = false.obs;
  final String? selectedUserRole;
  var seconds = 30.obs;
  Timer? _timer;
  List<Country> countryCodeList = [];
  RxList<Country> dummyCountryCodeList = <Country>[].obs;
  RxInt currentIndex = 0.obs;

  BuildContext context;
  PassengerAuthController({required this.context, this.selectedUserRole});

  final List<Map<String, String>> passengerPages = [
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

  final List<Map<String, String>> driverPages = [
    {
      "title": "Get Onboarded and Start",
      "subtitle": " Accepting Rides Instantly!",
      "desc":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "image": ImageConstant.onBoarding1,
    },
    {
      "title": "Effortless Monitor Your",
      "subtitle": " Booking Schedule",
      "desc":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "image": ImageConstant.onBoarding2,
    },
    {
      "title": "Keep Tabs on",
      "subtitle": " Your Earnings with Ease",
      "desc":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "image": ImageConstant.onBoarding3,
    },
  ];

  @override
  void onInit() {
    super.onInit();
    getDataList();
  }

  void getDataList() async {
    dummyCountryCodeList.clear();
    countryCodeList = countryCodes.map((e) => Country.fromMap(e)).toList();
    dummyCountryCodeList.addAll(countryCodeList);
  }

  void onChangedList(String v) {
    if (v.isNotEmpty) {
      dummyCountryCodeList.value = countryCodeList.where((element) {
        log(element.name.toString());
        log(v.toString());
        return element.name.toString().toLowerCase().contains(v.toLowerCase());
      }).toList();
      log(dummyCountryCodeList.length.toString());
    } else {
      log(countryCodeList.length.toString());
      dummyCountryCodeList.value = countryCodeList;
    }
    update();
  }

  void onTapSelectCountry(Country c) {
    selectedCountryCode.value = '+${c.phoneCode}';
    selectedCountryName.value = c.name ?? '';
    searchCountryController.value.clear();
    dummyCountryCodeList.value = countryCodeList;
    Navigator.of(context).pop();
    update();
  }

  void startTimer() {
    seconds.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value == 0) {
        timer.cancel();
      } else {
        seconds.value--;
      }
    });

    update();
  }

  void onTapSignIn({required bool isComingRegister}) {
    if (isComingRegister) {
      context.pop();
    } else {
      isSignInFlow.value = true;
      context.push(RouteConstant.verifyOtp);
    }
    update();
  }

  void onTabBackButton(BuildContext context) {
    context.pop();
  }

  void onTapVerifyButton() {
    if (otpFilledController.value.text.trim().length < 4) {
      showToastMessage(
        isError: true,
        context: context,
        titleMessage: 'Error',
        message: 'Please enter the 4 digit code',
      );
    } else {
      if (isSignInFlow.value) {
        context.go(RouteConstant.locationAccess);
      } else {
        context.push(RouteConstant.completeProfile);
      }
    }
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
    completeProfilePhoneController.value.clear();
    completeProfileGenderController.value.clear();
    selectedCountryName.value = 'India';
    selectedCountryCode.value = '+91';
    update();
  }

  Future<void> pickProfileImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (image != null) {
      profileImage.value = image;
      update();
    }
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
    completeProfileGenderController.value.text = gender;
    update();
  }

  void selectCountryCode({
    required String countryName,
    required String countryCode,
  }) {
    selectedCountryName.value = countryName;
    selectedCountryCode.value = countryCode;
    update();
  }

  Future<void> onBoardingPageSelection(int index) async {
    currentIndex.value = index;
    update();
  }

  void onTapCompleteProfileButton() {
    context.push(RouteConstant.locationAccess);
  }

  void onTapSignUp(BuildContext context) {
    context.push(RouteConstant.signUp);
  }

  void onTapUserRoleSelection(BuildContext context) {
    context.push(RouteConstant.authSelection);
  }

  void onTapAllowLocationAccess(BuildContext context) {
    context.push(RouteConstant.bottomNav);
  }

  void forwardToNextPage(BuildContext context) {
    if (currentIndex.value < passengerPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    } else {
      context.push(RouteConstant.login);
    }
  }

  void backwardToPreviousPage() {
    log('currentIndex.value ${currentIndex.value}');
    log('pages.length ${passengerPages.length - 1}');

    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  void onTapSignUpButton() async {
    if (nameController.value.text.trim().isEmpty) {
      showToastMessage(
        isError: true,
        context: context,
        titleMessage: 'Error',
        message: 'Please enter your name',
      );
    } else if (!isValidEmail(emailController.value.text.trim()) ||
        emailController.value.text.trim().isEmpty) {
      showToastMessage(
        isError: true,
        context: context,
        titleMessage: 'Error',
        message: 'Please enter your valid email',
      );
    } else if (passwordController.value.text.trim().isEmpty ||
        passwordController.value.text.trim().length < 6) {
      showToastMessage(
        isError: true,
        context: context,
        titleMessage: 'Error',
        message: 'Please enter password with at least 6 characters',
      );
    } else {
      await sendEmailForVerification();
    }
  }

  Future sendEmailForVerification() async {
    isSendVerificationEmail.value = true;
    log('Error${isSendVerificationEmail.value}');
    try {
      // final res = await signUpRepository.sendEmailVerification(
      //   emailController.value.text,
      // );
      // if (res != null) {
      startTimer();
      if (context.mounted) {
        context.push(
          RouteConstant.verifyOtp,
          extra: emailController.value.text.trim(),
        );
      }
      // }
    } on AuthApiException catch (e, _) {
      if (context.mounted) {
        showToastMessage(
          isError: true,
          context: context,
          titleMessage: 'Error',
          message: e.message.toString(),
        );
      }
      log('Error${e.toString()}');
    } finally {
      isSendVerificationEmail.value = false;
    }

    update();
  }

  Future completeUserProfile() async {
    try {
      // final res = await signUpRepository.completeUserProfile();
      //
      // if (res.isNotEmpty) {
      //   log('User added successfully');
      // } else {
      //   log('Insert failed');
      // }
    } on AuthApiException catch (e, _) {
      if (context.mounted) {
        showToastMessage(
          isError: true,
          context: context,
          titleMessage: 'Error',
          message: e.message.toString(),
        );
      }
      log('Error${e.toString()}');
    } finally {
      isSendVerificationEmail.value = false;
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    emailController.value.dispose();
    otpFilledController.value.dispose();
    passwordController.value.dispose();
    nameController.value.dispose();
    completeProfilePhoneController.value.dispose();
    completeProfileGenderController.value.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
