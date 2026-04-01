import 'package:flutter/material.dart';

void showBar(String text, BuildContext context) {
  final theme = Theme.of(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: theme.colorScheme.secondary,
    content: Text(
      text,
      style: theme.textTheme.labelLarge!.copyWith(color: theme.primaryColor),
      overflow: TextOverflow.ellipsis,
    ),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    margin: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * .08, left: 10, right: 10),
  ));
}
