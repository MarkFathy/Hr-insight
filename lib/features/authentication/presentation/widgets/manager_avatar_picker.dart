import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/utils/image_picker_helper.dart';

class ManagerAvatarPicker extends StatelessWidget {
  final File? image;
  final ValueChanged<File> onImagePicked;

  const ManagerAvatarPicker({
    required this.image,
    required this.onImagePicked,
    super.key,
  });

  Future<void> _handlePick(BuildContext context) async {
    final picked = await ImagePickerHelper.pickAndCropImage(context: context);
    if (picked != null) {
      onImagePicked(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () => _handlePick(context),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primary.withValues(alpha: 0.06),
                border: Border.all(
                  color: colors.primary.withValues(alpha: 0.85),
                  width: 2.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.15),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipOval(
                child: image != null
                    ? Image.file(
                        image!,
                        width: 104,
                        height: 104,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Icon(
                          Icons.person_outline_rounded,
                          size: 55,
                          color: colors.primary.withValues(alpha: 0.6),
                        ),
                      ),
              ),
            ),
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: colors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.surface, width: 2.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
