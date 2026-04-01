import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/profile/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/profile/presentation/conponents/info_item.dart';
import 'package:hr_app/src/injector.dart';
import 'package:shimmer/shimmer.dart';

class UserCard extends StatelessWidget {
  final bool isEmployee;
  const UserCard({super.key, required this.isEmployee});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          sl<ProfileBloc>()..add(GetProfileEvent(isEmployee: isEmployee)),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Column(
            children: [
              if (isEmployee) ...[
                if (state is ProfileLoadingState)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.blueGrey.shade500,
                          highlightColor: theme.colorScheme.secondary,
                          child: Material(
                            shape: const CircleBorder(),
                            clipBehavior: Clip.hardEdge,
                            elevation: 4,
                            child: SizedBox(
                              height: 60.r,
                              width: 60.r,
                            ),
                          ),
                        ),
                        10.pw,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                                baseColor: Colors.blueGrey.shade500,
                                highlightColor: theme.colorScheme.secondary,
                                child: Text(
                                  'مرحبا , ',
                                  style: theme.textTheme.titleMedium,
                                )),
                            Shimmer.fromColors(
                              baseColor: Colors.blueGrey.shade500,
                              highlightColor: theme.colorScheme.secondary,
                              child: const Text('info@email.com'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                if (state is ProfileLoadedState)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: Row(
                      children: [
                        Material(
                          shape: const CircleBorder(),
                          clipBehavior: Clip.hardEdge,
                          elevation: 4,
                          child: CachedNetworkImage(
                            imageUrl: state.employeeProfile!.data!.image!,
                            width: 60.r,
                            height: 60.r,
                          ),
                        ),
                        10.pw,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'مرحباً ,${state.employeeProfile!.data!.name!}',
                              style: theme.textTheme.titleMedium,
                            ),
                            Text(state.employeeProfile!.data!.email!),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () =>
                                context.read<AuthBloc>().add(SignOutEvent()),
                            child: const Icon(Icons.logout_rounded))
                      ],
                    ),
                  ),
              ],
              if (!isEmployee) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (state is ProfileLoadedState)
                        Material(
                            color: theme.colorScheme.secondary,
                            shape: CircleBorder(
                                side: BorderSide(color: theme.primaryColor)),
                            child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: CachedNetworkImage(
                                  imageUrl: state.managerProfile!.data!.image!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    clipBehavior: Clip.hardEdge,
                                    height: 60.r,
                                    width: 60.r,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade700,
                                        border: Border.all(
                                            color: theme.primaryColor),
                                        image: DecorationImage(
                                            image: imageProvider),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade700,
                                              blurRadius: 7,
                                              spreadRadius: 5,
                                              blurStyle: BlurStyle.inner)
                                        ]),
                                  ),
                                  placeholder: (context, url) =>
                                      const Icon(Icons.person_2_outlined),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ))),
                      if (state is ProfileLoadingState)
                        Shimmer.fromColors(
                          baseColor: Colors.blueGrey.shade500,
                          highlightColor: theme.colorScheme.secondary,
                          child: Material(
                            shape: const CircleBorder(),
                            clipBehavior: Clip.hardEdge,
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SizedBox(
                                height: 60.r,
                                width: 60.r,
                              ),
                            ),
                          ),
                        ),
                      10.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state is! ProfileLoadingState
                              ? Text(
                                  'شركة : ${(state is ProfileLoadedState) ? state.managerProfile!.data!.company! : ''}',
                                  style: theme.textTheme.titleLarge,
                                )
                              : Shimmer.fromColors(
                                  baseColor: Colors.blueGrey.shade500,
                                  highlightColor: theme.colorScheme.secondary,
                                  child: Text(
                                    'شركة : ',
                                    style: theme.textTheme.titleLarge,
                                  )),
                          InkWell(
                            onTap: () =>
                                context.read<AuthBloc>().add(SignOutEvent()),
                            child: Text(
                              'تسجيل الخروج',
                              style: theme.textTheme.labelLarge!
                                  .copyWith(color: theme.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              10.ph,
              Material(
                color: MyColors.greyColor,
                child: (isEmployee)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 15),
                        child: Column(children: [
                          ProfileInfoItem(
                            title: 'المكتب',
                            value: (state is ProfileLoadedState)
                                ? state.employeeProfile!.data!.office != null
                                    ? state.employeeProfile!.data!.office!.name!
                                    : 'غير متوفر'
                                : '',
                          ),
                          Divider(thickness: 2, color: theme.primaryColor),
                          ProfileInfoItem(
                            title: 'القسم',
                            value: (state is ProfileLoadedState)
                                ? state.employeeProfile!.data!.department !=
                                        null
                                    ? state.employeeProfile!.data!.department!
                                        .name!
                                    : 'غير متوفر'
                                : '',
                          ),
                          Divider(thickness: 2, color: theme.primaryColor),
                          ProfileInfoItem(
                            title: 'المسمى الوظيفى',
                            value: (state is ProfileLoadedState)
                                ? state.employeeProfile!.data!.job == null
                                    ? 'غير متوفر'
                                    : state.employeeProfile!.data!.job!.title!
                                : '',
                          ),
                          Divider(thickness: 2, color: theme.primaryColor),
                          ProfileInfoItem(
                            title: 'الهاتف',
                            value: (state is ProfileLoadedState)
                                ? state.employeeProfile!.data!.phone!
                                : '',
                          ),
                          Divider(thickness: 2, color: theme.primaryColor),
                        ]),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 15),
                        child: Column(
                          children: [
                            Divider(thickness: 2, color: theme.primaryColor),
                            ProfileInfoItem(
                              title: 'البريد',
                              value: (state is ProfileLoadedState)
                                  ? state.managerProfile!.data!.email!
                                  : '',
                            ),
                            Divider(thickness: 2, color: theme.primaryColor),
                            ProfileInfoItem(
                              title: 'الهاتف',
                              value: (state is ProfileLoadedState)
                                  ? state.managerProfile!.data!.phone!
                                  : '',
                            ),
                            Divider(thickness: 2, color: theme.primaryColor),
                            ProfileInfoItem(
                              title: 'كود التسجيل',
                              selectable: true,
                              value: (state is ProfileLoadedState)
                                  ? state.managerProfile!.data!.pin!
                                  : '',
                            ),
                            Divider(thickness: 2, color: theme.primaryColor),
                          ],
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
