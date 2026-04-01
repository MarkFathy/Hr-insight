import 'package:flutter/material.dart';
import 'package:hr_app/src/core/utils/entrance_fader.dart';

class MoreCard extends StatelessWidget {
  final String title;
  final Function() onTap;
  const MoreCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: EntranceFader(
          delay: const Duration(milliseconds: 200),
          child: Material(
            color: theme.colorScheme.secondary,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.elliptical(25, 8),
                topLeft: Radius.elliptical(25, 8)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: theme.primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
