import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/shared_widgets/animated_swich.dart';
import 'package:hr_app/src/features/home/presentation/home_screen.dart';
import 'package:hr_app/src/features/profile/presentation/profile_screen.dart';

class NavigationScreen extends StatelessWidget {
  final bool isEmployee;
  static const routeName = '/nav';
  const NavigationScreen({super.key, required this.isEmployee});

  @override
  Widget build(BuildContext context) {
    int currentIndx = 0;
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: StatefulBuilder(builder: (context, changeState) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedSwitch(
              isFadeTransition: true,
              child: [
                HomeScreen(
                  isEmployee: isEmployee,
                ),
                ProfileScreen(isEmployee: isEmployee)
              ][currentIndx],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 18.r),
              child: Material(
                  elevation: 7,
                  borderRadius: BorderRadius.circular(30),
                  color: theme.colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => changeState(() => currentIndx = 0),
                          child:
                              BarItem(Icons.home, isSelected: currentIndx == 0),
                        ),
                        InkWell(
                          onTap: () => changeState(() => currentIndx = 1),
                          child: BarItem(Icons.more_horiz_sharp,
                              isSelected: currentIndx == 1),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        );
      }),
    );
  }
}

class BarItem extends StatelessWidget {
  final IconData child;
  final bool isSelected;
  const BarItem(this.child, {super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedSwitch(
        child: isSelected
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  child,
                  color: theme.colorScheme.secondary,
                  size: 30.r,
                ),
              )
            : Container(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  child,
                  size: 30.r,
                  color: theme.primaryColor,
                ),
              ));
  }
}
