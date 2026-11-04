import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:hr_app/features/profile/presentation/widgets/info_item.dart';

/// Card presenting professional credentials, company data, and organizational placement.
class UserDetailsCard extends StatelessWidget {
  final bool isEmployee;

  const UserDetailsCard({required this.isEmployee, super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileBloc, ProfileState>(
    buildWhen: (prev, curr) =>
        curr is ProfileLoadingState ||
        curr is ProfileLoadedState ||
        curr is ProfileErrorState,
    builder: (context, state) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      height: 14,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                    ProfileInfoItem(
                      title: 'القسم',
                      value: (state is ProfileLoadedState)
                          ? (state.employeeProfile?.data?.department?.name ??
                                'غير متوفر')
                          : '',
                    ),
                    Divider(
                      height: 14,
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
                      height: 14,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                    ProfileInfoItem(
                      title: 'رقم الهاتف',
                      value: (state is ProfileLoadedState)
                          ? (state.employeeProfile?.data?.phone ?? 'غير متوفر')
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
                      height: 14,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                    ProfileInfoItem(
                      title: 'رقم الهاتف',
                      value: (state is ProfileLoadedState)
                          ? (state.managerProfile?.data?.phone ?? 'غير متوفر')
                          : '',
                    ),
                    Divider(
                      height: 14,
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
  );
}
