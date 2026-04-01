import 'package:flutter/material.dart';
import 'package:hr_app/src/core/consts/app_images.dart';
import 'package:shimmer/shimmer.dart';

class ListIndicator extends StatelessWidget {
  const ListIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 8, top: 8, bottom: 8),
      child: Stack(
        // alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Shimmer.fromColors(
            baseColor: theme.colorScheme.secondary,
            highlightColor: theme.primaryColor,
            child: Material(
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: theme.primaryColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                // color: theme.colorScheme.secondary,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  leading: Image.asset(
                    AppImages.leave,
                  ),
                  subtitle: const Material(
                    color: Colors.grey,
                    child: SizedBox(
                      height: 15,
                    ),
                  ),
                  title: const Material(
                    color: Colors.grey,
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                )),
          ),
          Positioned(
            left: -23,
            top: 0,
            bottom: 0,
            child: Shimmer.fromColors(
              baseColor: theme.cardColor,
              highlightColor: theme.primaryColor,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.cardColor,
                    border: Border.all(width: 3, color: theme.primaryColor)),
                padding: const EdgeInsets.all(12),
                child:
                    Icon(Icons.pending_actions_sharp, color: theme.primaryColor
                        // color: Colors.red,
                        ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
