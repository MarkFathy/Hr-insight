import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:hr_app/src/core/utils/entrance_fader.dart';
import 'package:hr_app/src/core/utils/extentions.dart';

class GridItem extends StatelessWidget {
  const GridItem(
      {super.key,
      required this.asset,
      required this.title,
      required this.onTap});
  final String asset;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return EntranceFader(
      child: InkWell(
        onTap: onTap,
        child: Material(
          elevation: 5,
          shadowColor: theme.primaryColor,
          color: theme.colorScheme.secondary.withOpacity(.5),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: theme.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Gif(
                      image: AssetImage(
                        asset,
                      ),
                      autostart: Autostart.once,
                      fps: 30,
                    )),
              ),
              Text(
                title,
                style:const TextStyle(
                  color: Colors.white
                ) //theme.textTheme.labelLarge,
              ),
              15.ph,
            ],
          ),
        ),
      ),
    );
  }
}
