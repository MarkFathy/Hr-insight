import 'package:flutter/material.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:shimmer/shimmer.dart';

class ListIndicator extends StatelessWidget {
  const ListIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
          borderOnForeground: true,
          color: theme.colorScheme.secondary,
          elevation: 6,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Shimmer.fromColors(
                          baseColor: theme.colorScheme.secondary,
                          highlightColor: theme.primaryColor,
                          child: const Divider(thickness: 12)),
                      Shimmer.fromColors(
                          baseColor: theme.colorScheme.secondary,
                          highlightColor: theme.primaryColor,
                          child: const Divider(thickness: 6)),
                      Shimmer.fromColors(
                          baseColor: theme.colorScheme.secondary,
                          highlightColor: theme.primaryColor,
                          child: const Divider(thickness: 6)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Shimmer.fromColors(
                        baseColor: theme.colorScheme.secondary,
                        highlightColor: theme.primaryColor,
                        child: const Text('نوع الإجازة')),
                    10.pw,
                    Container(
                        decoration: BoxDecoration(
                          color: theme.scaffoldBackgroundColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Shimmer.fromColors(
                          baseColor: theme.colorScheme.secondary,
                          highlightColor: theme.primaryColor,
                          child: const Row(
                            children: [
                              Icon(
                                Icons.pending_actions_rounded,
                                size: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text('------------'),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
