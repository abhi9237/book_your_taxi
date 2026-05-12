import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../core/route/route_constant/route_constant.dart';

enum DrivingLicenceSide { front, back }

class VerificationRequiredStepsController extends GetxController {
  final String driverName = 'Esther';
  final Rxn<XFile> selectedProfileFile = Rxn<XFile>();
  final Rxn<XFile> selectedBankAccountFile = Rxn<XFile>();
  final Rxn<XFile> licenceFrontFile = Rxn<XFile>();
  final Rxn<XFile> licenceBackFile = Rxn<XFile>();

  final List<String> requiredSteps = const [
    'Profile Picture',
    'Bank Account Details',
    'Driving Details',
  ];

  final List<String> submittedSteps = const ['Government ID'];

  void onTapBack(BuildContext context) {
    context.pop();
  }

  void onTapStep(BuildContext context, String stepTitle) {
    if (stepTitle == 'Profile Picture') {
      context.push(RouteConstant.uploadProfilePicture);
    } else if (stepTitle == 'Bank Account Details') {
      context.push(RouteConstant.uploadBankAccuontDetail);
    } else if (stepTitle == 'Driving Details') {
      context.push(RouteConstant.uploadDrivingLicenceDetail);
    } else if (stepTitle == 'Government ID') {
      context.push(RouteConstant.uploadGovernmentId);
    }
  }

  void onTapContinue(BuildContext context) {
    context.push(RouteConstant.onBoardingPages, extra: 'driver');
  }

  void onTapSignIn(BuildContext context) {
    context.push(RouteConstant.login);
  }

  void onTapVerificationContinue(BuildContext context) {
    context.push(RouteConstant.locationAccess, extra: 'driver');
  }

  Future<void> pickFromGallery(String type, {DrivingLicenceSide? side}) async {
    if (type == 'licence') {
      await _pickImage(ImageSource.gallery, type, side: side);
    } else {
      await _pickImage(ImageSource.gallery, type);
    }
  }

  Future<void> pickFromCamera(String type, {DrivingLicenceSide? side}) async {
    if (type == 'licence') {
      await _pickImage(ImageSource.camera, type, side: side);
    } else {
      await _pickImage(ImageSource.camera, type);
    }
  }

  Future<void> _pickImage(
    ImageSource source,
    String type, {
    DrivingLicenceSide? side,
  }) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (file != null) {
      if (type == 'licence') {
        if (side == DrivingLicenceSide.front) {
          licenceFrontFile.value = file;
        } else {
          licenceBackFile.value = file;
        }
      } else if (type == 'profile') {
        selectedProfileFile.value = file;
      } else if (type == 'bank') {
        selectedBankAccountFile.value = file;
      }
      update();
    }
  }

  void removeSelectedFile(String type, {DrivingLicenceSide? side}) {
    if (type == 'profile') {
      selectedProfileFile.value = null;
    } else if (type == 'bank') {
      selectedBankAccountFile.value = null;
    }
    if (type == 'licence') {
      if (side == DrivingLicenceSide.front) {
        licenceFrontFile.value = null;
      } else {
        licenceBackFile.value = null;
      }
    }
    update();
  }

  DrivingLicenceSide nextPendingSide() {
    if (licenceFrontFile.value == null) {
      return DrivingLicenceSide.front;
    }
    return DrivingLicenceSide.back;
  }
}
