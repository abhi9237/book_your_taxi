import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

enum DrivingLicenceSide { front, back }

class UploadDrivingLicenceDetailController extends GetxController {
  final Rxn<XFile> frontFile = Rxn<XFile>();
  final Rxn<XFile> backFile = Rxn<XFile>();

  Future<void> pickFromGallery(DrivingLicenceSide side) async {
    await _pickFile(ImageSource.gallery, side);
  }

  Future<void> pickFromCamera(DrivingLicenceSide side) async {
    await _pickFile(ImageSource.camera, side);
  }

  Future<void> _pickFile(ImageSource source, DrivingLicenceSide side) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (file != null) {
      if (side == DrivingLicenceSide.front) {
        frontFile.value = file;
      } else {
        backFile.value = file;
      }
      update();
    }
  }

  void removeFile(DrivingLicenceSide side) {
    if (side == DrivingLicenceSide.front) {
      frontFile.value = null;
    } else {
      backFile.value = null;
    }
    update();
  }

  DrivingLicenceSide nextPendingSide() {
    if (frontFile.value == null) {
      return DrivingLicenceSide.front;
    }
    return DrivingLicenceSide.back;
  }
}
