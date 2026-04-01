import 'package:flutter/material.dart';
import 'package:hr_app/src/core/utils/nav.dart';

class SBackButton extends StatelessWidget {
  const SBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InkWell(
        onTap: () => NV.pop(context),
        child: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
