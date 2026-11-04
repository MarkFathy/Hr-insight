import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';

/// Modal dialog that presents an interactive zoomable view of a user avatar or photo.
class ProfileImageDialog extends StatelessWidget {
  final String imageUrl;

  const ProfileImageDialog({required this.imageUrl, super.key});

  static Future<void> show(BuildContext context, String imageUrl) =>
      showDialog<void>(
        context: context,
        builder: (ctx) => ProfileImageDialog(imageUrl: imageUrl),
      );

  @override
  Widget build(BuildContext context) => Dialog(
    insetPadding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(Icons.close_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        ClipRRect(
          borderRadius: context.radius.mdBorder,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.7,
            ),
            color: context.colors.surface,
            child: InteractiveViewer(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: CircularProgressIndicator(
                      color: context.colors.primary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Icon(
                      Icons.error_outline,
                      color: context.colors.error,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
