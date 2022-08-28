import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:rareview_app/src/shared/image/service/image_service.dart';
import 'package:rareview_app/src/shared/models/failure.dart';

class ImageController extends ChangeNotifier {
  final ImageService _imageService;

  ImageController({required ImageService imageService}) : _imageService = imageService;

  Future<File?> pickImageFromGallery() async {
    try {
      return await _imageService.pickImageFromGallery();
    } on Failure {
      rethrow;
    }
  }

  Future<File?> pickImageFromCamera() async {
    try {
      return await _imageService.pickImageFromCamera();
    } on Failure {
      rethrow;
    }
  }
}
