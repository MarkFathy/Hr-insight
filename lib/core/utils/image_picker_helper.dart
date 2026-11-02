import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static Future<File?> pickAndCropImage({
    required BuildContext context,
    ImageSource source = ImageSource.gallery,
    CropStyle cropStyle = CropStyle.circle,
  }) async {
    final primaryColor = Theme.of(context).primaryColor;

    final pickedFile = await ImagePicker().pickImage(
      source: source,
      maxWidth: 1080,
      maxHeight: 1080,
      imageQuality: 85,
    );
    if (pickedFile == null) return null;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      compressQuality: 85,
      maxWidth: 1080,
      maxHeight: 1080,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'تعديل الصورة',
          toolbarColor: primaryColor,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: primaryColor,
          initAspectRatio: CropAspectRatioPreset.square,
          cropStyle: cropStyle,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
        IOSUiSettings(
          title: 'تعديل الصورة',
          doneButtonTitle: 'تم',
          cancelButtonTitle: 'إلغاء',
          cropStyle: cropStyle,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }
}
