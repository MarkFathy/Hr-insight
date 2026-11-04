import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';

class EmployeePickerTile extends StatelessWidget {
  final bool isSelected;
  final String name;
  final String subtitle;
  final VoidCallback onTap;
  final String? imageUrl;
  final IconData? icon;

  const EmployeePickerTile({
    required this.isSelected,
    required this.name,
    required this.subtitle,
    required this.onTap,
    super.key,
    this.imageUrl,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final validImageUrl = imageUrl.toValidImageUrl;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: isSelected
            ? context.colors.primary.withValues(alpha: 0.12)
            : context.colors.surface.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: isSelected ? context.colors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 4,
          ),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.primary.withValues(alpha: 0.15),
              border: Border.all(
                color: isSelected
                    ? context.colors.primary
                    : context.colors.primary.withValues(alpha: 0.4),
                width: 1.5,
              ),
            ),
            child: ClipOval(
              child: validImageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: validImageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => ColoredBox(
                        color: context.colors.surface,
                        child: Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (_, _, _) => Icon(
                        Icons.person_rounded,
                        color: context.colors.primary,
                        size: 24,
                      ),
                    )
                  : Icon(
                      icon ?? Icons.person_rounded,
                      color: context.colors.primary,
                      size: 24,
                    ),
            ),
          ),
          title: Text(
            name,
            style: context.typography.titleSmall.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              color: isSelected ? context.colors.primary : Colors.white,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: context.typography.bodySmall.copyWith(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 11,
            ),
          ),
          trailing: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? context.colors.primary : Colors.transparent,
              border: Border.all(
                color: isSelected
                    ? context.colors.primary
                    : Colors.white.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: isSelected
                ? const Icon(Icons.check_rounded, size: 16, color: Colors.black)
                : null,
          ),
        ),
      ),
    );
  }
}
