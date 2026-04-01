import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/office_details.dart';
import 'package:shimmer/shimmer.dart';

class OfficeCard extends StatelessWidget {
  final OfficeDataEntity office;
  const OfficeCard({super.key, required this.office});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => NV.nextScreen(
          context,
          OfficeDetailsScreen(
            office: office,
            rebuild: () =>
                context.read<OfficesBloc>().add(const GetOfficesEvent()),
          )),
      child: Material(
        elevation: 5,
        shadowColor: theme.primaryColor,
        color: theme.colorScheme.secondary.withOpacity(.5),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: theme.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  office.name!,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.primaryColor),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Gif(
                    image: AssetImage(
                      AppImages.office,
                    ),
                    autostart: Autostart.once,
                    fit: BoxFit.fitHeight,
                    fps: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Icon(Icons.crisis_alert_outlined),
                    5.pw,
                    Text('${office.radius} m'),
                    const Spacer(),
                    const Icon(Icons.person),
                    5.pw,
                    Text(office.employeeCount.toString()),
                  ],
                ),
              ),

              // Row(
              //   children: [

              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class OfficesIndicator extends StatelessWidget {
  const OfficesIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade700,
            highlightColor: theme.cardColor,
            direction: ShimmerDirection.rtl,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade700,
                        blurRadius: 3,
                        spreadRadius: 2,
                        blurStyle: BlurStyle.inner)
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: const SizedBox(height: 10),
            ),
          ),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: theme.cardColor,
              direction: ShimmerDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  // margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade700
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Colors
                      //           .grey.shade700,
                      //       blurRadius: 7,
                      //       spreadRadius: 5,
                      //       blurStyle:
                      //           BlurStyle.inner)
                      // ]
                      ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade700,
                highlightColor: theme.cardColor,
                direction: ShimmerDirection.rtl,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade700,
                            blurRadius: 3,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.inner)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const SizedBox(height: 10),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade700,
                highlightColor: theme.cardColor,
                direction: ShimmerDirection.rtl,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 50, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade700,
                            blurRadius: 3,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.inner)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const SizedBox(height: 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
