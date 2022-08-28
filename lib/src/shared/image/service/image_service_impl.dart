import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rareview_app/src/shared/image/service/image_service.dart';
import 'package:rareview_app/src/shared/models/failure.dart';

const _errorMessage = 'An error occuried';

class ImageServiceImpl implements ImageService {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<File?> pickImageFromCamera() async {
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.camera);
      if (image == null) {
        return null;
      }
      return File(image.path);
    } on Exception {
      throw Failure(_errorMessage);
    }
  }

  @override
  Future<File?> pickImageFromGallery() async {
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return null;
      }
      return File(image.path);
    } on Exception {
      throw Failure(_errorMessage);
    }
  }
}
