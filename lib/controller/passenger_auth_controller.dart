import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:book_your_taxi/core/image_constant/image_constant.dart';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:book_your_taxi/core/storage/hive_storage_service.dart';
import 'package:book_your_taxi/models/common/user_image.dart';
import 'package:book_your_taxi/models/response/app_error_reponse.dart';
import 'package:book_your_taxi/models/response/login_response.dart';
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
import 'package:dio/dio.dart' as dio;

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
  final Rx<TextEditingController> completeProfileLocationController =
      TextEditingController().obs;
  final RxString selectedDrivingState = ''.obs;
  AuthRepository repository = AuthRepository();

  final RxString selectedCountryCode = '+91'.obs;
  final RxString selectedCountryName = 'India'.obs;
  final Rxn<XFile> profileImage = Rxn<XFile>();
  final RxString selectedGender = ''.obs;
  final RxBool isObsecureValue = true.obs;
  final RxBool isLoadingUserProfile = false.obs;

  bool isChecked = false;
  final RxBool isSignInFlow = false.obs;
  RxBool isSendVerificationEmail = false.obs;
  RxBool isVerifyOtp = false.obs;
  RxBool isLoginLoading = false.obs;
  String? selectedUserRole;
  String uploadUrl = '';
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

  void clearControllers() {
    emailController.value.clear();
    passwordController.value.clear();
    otpFilledController.value.clear();
    completeProfileGenderController.value.clear();
    completeProfilePhoneController.value.clear();
    completeProfileLocationController.value.clear();
    selectedDrivingState.value = '';
    nameController.value.clear();
    selectedCountryCode.value = '+91';
    selectedCountryName.value = 'India';
    profileImage.value = null;
    update();
  }

  void loadInitUserType() {
    if (HiveStorageService.getUserType() != null) {
      selectedUserRole = HiveStorageService.getUserType() ?? '';
      emailController.value.text = HiveStorageService.getUserEmail() ?? '';
    }
    if (HiveStorageService.getUserEmail() != null) {
      emailController.value.text = HiveStorageService.getUserEmail() ?? '';
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
      if (emailController.value.text.trim().isEmpty ||
          !isValidEmail(emailController.value.text.trim())) {
        showToastMessage(
          isError: true,
          context: context,
          titleMessage: 'Error',
          message: 'Please enter your email to continue',
        );
        return;
      } else if (passwordController.value.text.trim().isEmpty) {
        showToastMessage(
          isError: true,
          context: context,
          titleMessage: 'Error',
          message: 'Please enter your password to continue',
        );
        return;
      } else {
        login();
      }
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
    completeProfileLocationController.value.clear();
    selectedDrivingState.value = '';
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

  void selectDrivingState(String state) {
    selectedDrivingState.value = state;
    completeProfileLocationController.value.text = state;
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

  Future completePassengerProfile() async {
    try {
      isLoadingUserProfile.value = true;
      if (profileImage.value != null) {
        uploadUrl = await uploadUserProfileImage(
          File(profileImage.value?.path ?? ''),
        );
      }
      if (uploadUrl.isNotEmpty) {
        Map<String, dynamic> data = <String, dynamic>{
          "id": HiveStorageService.getUserId(),
          "name": nameController.value.text.trim(),
          "email": emailController.value.text.trim(),
          "phone_number": completeProfilePhoneController.value.text.trim(),
          "gender": completeProfileGenderController.value.text.trim(),
          'type': HiveStorageService.getUserType(),
          'city_you_drive': completeProfileLocationController.value.text.trim(),
          'aceept_t_c': isChecked,
        };

        final res = await repository.addPassengerProfile(data: data);

        if (res.statusCode == 200 || res.statusCode == 201) {
          HiveStorageService.storeCompleteProfile(true);
          log('User added successfully');
          if (context.mounted) {
            context.push(RouteConstant.locationAccess, extra: 'passenger');
          }
        } else {
          log('Insert failed');
        }
      } else if (selectedUserRole == 'driver') {
        Map<String, dynamic> data = <String, dynamic>{
          "id": HiveStorageService.getUserId(),
          "name": nameController.value.text.trim(),
          "email": emailController.value.text.trim(),
          "phone_number": completeProfilePhoneController.value.text.trim(),
          "gender": completeProfileGenderController.value.text.trim(),
          'type': HiveStorageService.getUserType(),
          'city_you_drive': completeProfileLocationController.value.text.trim(),
          'aceept_t_c': isChecked,
        };

        final res = await repository.addPassengerProfile(data: data);

        if (res.statusCode == 200 || res.statusCode == 201) {
          HiveStorageService.storeCompleteProfile(true);
          if (context.mounted) {
            context.push(
              RouteConstant.verificationRequiredSteps,
              extra: nameController.value.text.trim(),
            );
          }
        } else {
          log('Insert failed');
        }
      }
    } on AppErrorResponse catch (e, _) {
      log('Insert failed${e.message.toString()}');
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
      isLoadingUserProfile.value = false;
    }

    update();
  }

  Future<String> uploadUserProfileImage(File image) async {
    try {
      String fileName = image.path.split('/').last;
      final formData = dio.FormData.fromMap({
        'file': await dio.MultipartFile.fromFile(
          image.path,
          filename: fileName,
        ),
      });

      final res = await repository.uploadUserProfileImage(formData);
      final UserImage response = UserImage.fromJson(res.data ?? {});
      log('response.url===>${response.url}');
      if (res.statusCode == 200 || res.statusCode == 201) {
        return response.url ?? '';
      }
    } on AppErrorResponse catch (e, _) {
      log('response.url===>${e.message.toString()}');
      if (context.mounted) {
        showToastMessage(
          isError: true,
          context: context,
          titleMessage: 'Error',
          message: e.message.toString(),
        );
      }
    } finally {
      isSendVerificationEmail.value = false;
    }
    return '';
  }

  Future<void> onBoardingPageSelection(int index) async {
    currentIndex.value = index;
    update();
  }

  void onTapCompleteProfileButton() async {
    if (selectedUserRole == 'passenger') {
      if ((profileImage.value?.path ?? '').isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please select your profile image',
          context: context,
          isError: true,
        );
      } else if (nameController.value.text.trim().isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please enter your name',
          context: context,
          isError: true,
        );
      } else if (emailController.value.text.trim().isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please enter your email address',
          context: context,
          isError: true,
        );
      } else if (completeProfilePhoneController.value.text.trim().isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please enter your phone number',
          context: context,
          isError: true,
        );
      } else if (completeProfileGenderController.value.text.isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please select your gender',
          context: context,
          isError: true,
        );
      } else {
        await completePassengerProfile();
      }
    } else {
      if (nameController.value.text.trim().isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please enter your name',
          context: context,
          isError: true,
        );
      } else if (emailController.value.text.trim().isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please enter your email address',
          context: context,
          isError: true,
        );
      } else if (completeProfilePhoneController.value.text.trim().isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please enter your phone number',
          context: context,
          isError: true,
        );
      } else if (completeProfileGenderController.value.text.isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please select your gender',
          context: context,
          isError: true,
        );
      } else if (completeProfileGenderController.value.text.isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please select your gender',
          context: context,
          isError: true,
        );
      } else if (completeProfileLocationController.value.text.trim().isEmpty) {
        showToastMessage(
          titleMessage: 'Error',
          message: 'Please select your city',
          context: context,
          isError: true,
        );
      } else {
        log('ebt3er');
        await completePassengerProfile();
      }
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

  Future login() async {
    isLoginLoading.value = true;
    try {
      final res = await repository.logInUser(
        email: emailController.value.text.trim(),
        password: passwordController.value.text.trim(),
      );

      LoginResponse response = LoginResponse.fromJson(res.data ?? {});

      if (res.statusCode == 200 || res.statusCode == 201) {
        HiveStorageService.storeEmailVerified(
          response.user?.emailVerified ?? true,
        );
        HiveStorageService.storeUserToken(response.accessToken ?? '');
        HiveStorageService.storeRefreshToken(response.csrfToken ?? '');
        HiveStorageService.storeCurrentUserId(response.user?.id ?? '');
        HiveStorageService.storeUserEmail(response.user?.email ?? '');
        clearControllers();

        if (context.mounted) {
          context.push(RouteConstant.bottomNav);
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
      isLoginLoading.value = false;
    }
    update();
  }

  Future verifyOtp() async {
    isVerifyOtp.value = true;
    try {
      // context.push(RouteConstant.completeProfile);

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
        HiveStorageService.storeRefreshToken(response.csrfToken ?? '');
        HiveStorageService.storeCurrentUserId(response.user?.id ?? '');
        HiveStorageService.storeUserEmail(response.user?.email ?? '');

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
