import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadProfilePictureController extends GetxController {
  final Rxn<XFile> selectedFile = Rxn<XFile>();

  Future<void> pickFromGallery() async {
    await _pickImage(ImageSource.gallery);
  }

  Future<void> pickFromCamera() async {
    await _pickImage(ImageSource.camera);
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (file != null) {
      selectedFile.value = file;
      update();
    }
  }

  void removeSelectedFile() {
    selectedFile.value = null;
    update();
  }
}
