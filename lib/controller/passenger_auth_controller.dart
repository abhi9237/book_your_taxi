import 'dart:async';
import 'dart:developer';
import 'package:book_your_taxi/core/image_constant/image_constant.dart';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:book_your_taxi/core/storage/hive_storage_service.dart';
import 'package:book_your_taxi/models/response/app_error_reponse.dart';
import 'package:book_your_taxi/models/response/sign_up_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import '../common/common_methods.dart';
import '../core/country_code_json/country_code_json.dart';
import '../models/common/country_model.dart';
import '../repository/auth_repo/auth_repo.dart';

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
  AuthRepository repository = AuthRepository();

  final RxString selectedCountryCode = '+91'.obs;
  final RxString selectedCountryName = 'India'.obs;
  final Rxn<XFile> profileImage = Rxn<XFile>();
  final RxString selectedGender = ''.obs;
  final RxBool isObsecureValue = true.obs;
  bool isChecked = false;
  final RxBool isSignInFlow = false.obs;
  RxBool isSendVerificationEmail = false.obs;
  RxBool isVerifyOtp = false.obs;
  String? selectedUserRole;
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
    loadInitUserType();
  }

  void loadInitUserType() {
    if (HiveStorageService.getUserType() != null) {
      selectedUserRole = HiveStorageService.getUserType() ?? '';
    }
    log('selected Role ${selectedUserRole}');
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
    if (otpFilledController.value.text.trim().length < 6) {
      showToastMessage(
        isError: true,
        context: context,
        titleMessage: 'Error',
        message: 'Please enter the 6 digit code',
      );
    } else {
      verifyOtp();
      //
      // if (isSignInFlow.value) {
      //   context.go(RouteConstant.locationAccess, extra: 'passenger');
      // } else {
      //   context.push(RouteConstant.completeProfile);
      // }
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
    if (selectedUserRole == 'passenger') {
      context.push(RouteConstant.locationAccess, extra: 'passenger');
    } else {
      context.push(RouteConstant.verificationRequiredSteps);
    }
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
    } else if (isChecked == false) {
      showToastMessage(
        isError: true,
        context: context,
        titleMessage: 'Error',
        message: 'Please agree to the terms and conditions',
      );
    } else {
      await sendEmailForVerification();
    }
  }

  Future sendEmailForVerification() async {
    isSendVerificationEmail.value = true;
    try {
      // startTimer();
      // context.push(
      //   RouteConstant.verifyOtp,
      //   extra: emailController.value.text.trim(),
      // );

      final res = await repository.sendOtp(
        email: emailController.value.text.trim(),
        password: passwordController.value.text.trim(),
      );

      if (res.statusCode == 200) {
        startTimer();
        if (context.mounted) {
          context.push(
            RouteConstant.verifyOtp,
            extra: emailController.value.text.trim(),
          );
        }
      }
    } on AppErrorResponse catch (e, _) {
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

  Future verifyOtp() async {
    isVerifyOtp.value = true;
    try {
      final res = await repository.verifyOtp(
        email: emailController.value.text.trim(),
        otp: otpFilledController.value.text.trim(),
      );

      SignUpResponse response = SignUpResponse.fromJson(res.data ?? {});

      if (res.statusCode == 200 || res.statusCode == 202) {
        HiveStorageService.storeEmailVerified(
          response.user?.emailVerified ?? true,
        );
        HiveStorageService.storeUserToken(response.accessToken ?? '');

        if (context.mounted) {
          if (isSignInFlow.value) {
            context.go(RouteConstant.locationAccess, extra: 'passenger');
          } else {
            context.push(RouteConstant.completeProfile);
          }
        }
      }
    } on AppErrorResponse catch (e, _) {
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
      isVerifyOtp.value = false;
      log('${isVerifyOtp.value}');
    }
    update();
  }

  Future resendOtp() async {
    isVerifyOtp.value = true;
    try {
      final res = await repository.resendOtp(
        email: emailController.value.text.trim(),
      );

      if (res.statusCode == 200 || res.statusCode == 202) {
        startTimer();
        final data = res.data;
        final messageFromApi = data?['message']?.toString();
        final message = (messageFromApi?.trim().isNotEmpty ?? false)
            ? messageFromApi!
            : 'OTP sent successfully';

        if (context.mounted) {
          showToastMessage(
            context: context,
            titleMessage: 'Success',
            message: message,
            isError: false,
          );
        }
      }
    } on AppErrorResponse catch (e, _) {
      if (context.mounted) {
        showToastMessage(
          isError: true,
          context: context,
          titleMessage: 'Error',
          message: e.message.toString(),
        );
      }
      log('Error${e.toString()}');
    } catch (e) {
      if (context.mounted) {
        showToastMessage(
          isError: true,
          context: context,
          titleMessage: 'Error',
          message: e.toString().replaceFirst('Exception: ', ''),
        );
      }
    } finally {
      isVerifyOtp.value = false;
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
    } catch (e, _) {
      if (context.mounted) {
        showToastMessage(
          isError: true,
          context: context,
          titleMessage: 'Error',
          message: e.toString(),
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
