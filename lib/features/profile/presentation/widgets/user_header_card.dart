import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:hr_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:hr_app/features/profile/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:hr_app/features/profile/presentation/widgets/profile_image_dialog.dart';
import 'package:shimmer/shimmer.dart';

/// Top profile header displaying the user's avatar, name, role badge, and logout trigger.
class UserHeaderCard extends StatelessWidget {
  final bool isEmployee;

  const UserHeaderCard({required this.isEmployee, super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileBloc, ProfileState>(
    buildWhen: (prev, curr) =>
        curr is ProfileLoadingState ||
        curr is ProfileLoadedState ||
        curr is ProfileErrorState,
    builder: (context, state) {
      final imageUrl = isEmployee
          ? (state is ProfileLoadedState
                ? (state.employeeProfile?.data?.image.toValidImageUrl ?? '')
                : '')
          : (state is ProfileLoadedState
                ? (state.managerProfile?.data?.image.toValidImageUrl ?? '')
                : '');

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Material(
          color: context.colors.surface,
          elevation: 3,
          shadowColor: Colors.black.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: context.radius.mdBorder,
            side: BorderSide(
              color: context.colors.primary.withValues(alpha: 0.25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Avatar
                if (state is ProfileLoadingState)
                  Shimmer.fromColors(
                    baseColor: Colors.blueGrey.shade700,
                    highlightColor: context.colors.surface,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  )
                else ...[
                  GestureDetector(
                    onTap: imageUrl.isNotEmpty
                        ? () => ProfileImageDialog.show(context, imageUrl)
                        : null,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withValues(alpha: 0.25),
                        border: Border.all(
                          color: context.colors.primary,
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => ColoredBox(
                            color: Colors.grey.shade800,
                            child: const Icon(
                              Icons.person_2_outlined,
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) => ColoredBox(
                            color: Colors.grey.shade800,
                            child: const Icon(
                              Icons.person_2_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                14.pw,
                // Name & Role / Company
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state is ProfileLoadingState) ...[
                        Shimmer.fromColors(
                          baseColor: Colors.blueGrey.shade700,
                          highlightColor: context.colors.surface,
                          child: Container(
                            width: 120,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        6.ph,
                        Shimmer.fromColors(
                          baseColor: Colors.blueGrey.shade700,
                          highlightColor: context.colors.surface,
                          child: Container(
                            width: 80,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ] else if (isEmployee && state is ProfileLoadedState) ...[
                        Text(
                          state.employeeProfile?.data?.name ?? '',
                          style: context.typography.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        4.ph,
                        Text(
                          state.employeeProfile?.data?.email ?? '',
                          style: context.typography.bodySmall.copyWith(
                            color: Colors.white.withValues(alpha: 0.6),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        6.ph,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: context.colors.primary.withValues(
                              alpha: 0.15,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'موظف',
                            style: TextStyle(
                              color: context.colors.primary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ] else if (!isEmployee &&
                          state is ProfileLoadedState) ...[
                        Text(
                          state.managerProfile?.data?.name ?? 'المدير العام',
                          style: context.typography.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        4.ph,
                        Text(
                          'شركة: ${state.managerProfile?.data?.company ?? ''}',
                          style: context.typography.bodySmall.copyWith(
                            color: Colors.white.withValues(alpha: 0.6),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        6.ph,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'مسؤول النظام',
                            style: TextStyle(
                              color: Colors.cyanAccent,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                // Logout Button
                IconButton(
                  tooltip: 'تسجيل الخروج',
                  style: IconButton.styleFrom(
                    backgroundColor: context.colors.error.withValues(
                      alpha: 0.12,
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    final authBloc = context.read<AuthBloc>();
                    unawaited(
                      LogoutConfirmationDialog.show(
                        context,
                        onConfirm: () => authBloc.add(const SignOutEvent()),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.logout_rounded,
                    color: context.colors.error,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
