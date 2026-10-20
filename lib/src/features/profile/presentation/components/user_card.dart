import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/profile/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/profile/presentation/components/info_item.dart';
import 'package:shimmer/shimmer.dart';

class UserCard extends StatelessWidget {
  final bool isEmployee;
  const UserCard({required this.isEmployee, super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProfileBloc, ProfileState>(
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

          return Column(
        children: [
          // User Header Profile Card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
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
                padding: EdgeInsets.all(16.r),
                child: Row(
                  children: [
                    // Avatar
                    if (state is ProfileLoadingState)
                      Shimmer.fromColors(
                        baseColor: Colors.blueGrey.shade700,
                        highlightColor: context.colors.surface,
                        child: Container(
                          width: 60.r,
                          height: 60.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      )
                    else ...[
                      GestureDetector(
                        onTap: imageUrl.isNotEmpty
                            ? () => _showFullImageDialog(context, imageUrl)
                            : null,
                        child: Container(
                          width: 60.r,
                          height: 60.r,
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
                                width: 120.w,
                                height: 16.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                            6.ph,
                            Shimmer.fromColors(
                              baseColor: Colors.blueGrey.shade700,
                              highlightColor: context.colors.surface,
                              child: Container(
                                width: 80.w,
                                height: 12.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                          ] else if (isEmployee &&
                              state is ProfileLoadedState) ...[
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.r,
                                vertical: 2.r,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.primary.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Text(
                                'موظف',
                                style: TextStyle(
                                  color: context.colors.primary,
                                  fontSize: 10.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ] else if (!isEmployee &&
                              state is ProfileLoadedState) ...[
                            Text(
                              state.managerProfile?.data?.name ??
                                  'المدير العام',
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.r,
                                vertical: 2.r,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.cyanAccent.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
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
                        backgroundColor:
                            context.colors.error.withValues(alpha: 0.12),
                        padding: EdgeInsets.all(10.r),
                      ),
                      onPressed: () => _showLogoutConfirmationDialog(context),
                      icon: Icon(
                        Icons.logout_rounded,
                        color: context.colors.error,
                        size: 20.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Profile Details Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 4.r),
            child: Material(
              color: context.colors.surface,
              elevation: 2,
              shadowColor: Colors.black.withValues(alpha: 0.25),
              shape: RoundedRectangleBorder(
                borderRadius: context.radius.mdBorder,
                side: BorderSide(
                  color: context.colors.primary.withValues(alpha: 0.15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
                child: isEmployee
                    ? Column(
                        children: [
                          ProfileInfoItem(
                            title: 'المكتب',
                            value: (state is ProfileLoadedState)
                                ? (state.employeeProfile?.data?.office?.name ??
                                      'غير متوفر')
                                : '',
                          ),
                          Divider(
                            height: 14.r,
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                          ProfileInfoItem(
                            title: 'القسم',
                            value: (state is ProfileLoadedState)
                                ? (state
                                          .employeeProfile
                                          ?.data
                                          ?.department
                                          ?.name ??
                                      'غير متوفر')
                                : '',
                          ),
                          Divider(
                            height: 14.r,
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                          ProfileInfoItem(
                            title: 'المسمى الوظيفي',
                            value: (state is ProfileLoadedState)
                                ? (state.employeeProfile?.data?.job?.title ??
                                      'غير متوفر')
                                : '',
                          ),
                          Divider(
                            height: 14.r,
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                          ProfileInfoItem(
                            title: 'رقم الهاتف',
                            value: (state is ProfileLoadedState)
                                ? (state.employeeProfile?.data?.phone ??
                                      'غير متوفر')
                                : '',
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          ProfileInfoItem(
                            title: 'البريد الإلكتروني',
                            value: (state is ProfileLoadedState)
                                ? (state.managerProfile?.data?.email ?? '')
                                : '',
                          ),
                          Divider(
                            height: 14.r,
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                          ProfileInfoItem(
                            title: 'رقم الهاتف',
                            value: (state is ProfileLoadedState)
                                ? (state.managerProfile?.data?.phone ??
                                      'غير متوفر')
                                : '',
                          ),
                          Divider(
                            height: 14.r,
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                          ProfileInfoItem(
                            title: 'كود تسجيل الموظفين (PIN)',
                            selectable: true,
                            value: (state is ProfileLoadedState)
                                ? (state.managerProfile?.data?.pin ?? '')
                                : '',
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      );
    },
  );

  void _showLogoutConfirmationDialog(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    unawaited(
      showDialog<void>(
        context: context,
        builder: (ctx) => _LogoutConfirmationDialog(
          onConfirm: () => authBloc.add(const SignOutEvent()),
        ),
      ),
    );
  }

  void _showFullImageDialog(BuildContext context, String imageUrl) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (ctx) => Dialog(
          insetPadding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.white),
                  onPressed: () => Navigator.of(ctx).pop(),
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
                          padding: EdgeInsets.all(32.r),
                          child: CircularProgressIndicator(
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.r),
                          child: Icon(
                            Icons.error_outline,
                            color: context.colors.error,
                            size: 48.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const _LogoutConfirmationDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: context.radius.lgBorder,
          side: BorderSide(
            color: context.colors.error.withValues(alpha: 0.25),
          ),
        ),
        titlePadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 12.h),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        actionsPadding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: context.colors.error.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Icons.logout_rounded,
                color: context.colors.error,
                size: 20.r,
              ),
            ),
            12.pw,
            Text(
              'تسجيل الخروج',
              style: context.typography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        content: Text(
          'هل أنت متأكد من رغبتك في تسجيل الخروج من الحساب؟',
          style: context.typography.bodySmall.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'إلغاء',
              style: context.typography.labelMedium.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.error,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: context.radius.smBorder,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            ),
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
            child: Text(
              'تسجيل الخروج',
              style: context.typography.labelMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
}
