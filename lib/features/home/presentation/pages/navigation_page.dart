import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/home/presentation/pages/home_page.dart';
import 'package:hr_app/features/profile/presentation/pages/profile_page.dart';

class NavigationPage extends StatefulWidget {
  final bool isEmployee;
  static const routeName = '/nav';
  const NavigationPage({required this.isEmployee, super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with AutoConnectivityRestoreMixin {
  int _currentIndex = 0;

  @override
  void onConnectivityRestored() {}

  @override
  Widget build(BuildContext context) => Scaffold(
    extendBody: true,
    body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        IndexedStack(
          index: _currentIndex,
          children: [
            HomePage(isEmployee: widget.isEmployee),
            ProfilePage(isEmployee: widget.isEmployee),
          ],
        ),
        SafeArea(
          child: ResponsiveContainer(
            maxWidth: 500,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.surface.withValues(alpha: 0.88),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: context.colors.primary.withValues(alpha: 0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _NavItem(
                        icon: Icons.grid_view_rounded,
                        selectedIcon: Icons.grid_view_rounded,
                        label: 'الرئيسية',
                        isSelected: _currentIndex == 0,
                        onTap: () => setState(() => _currentIndex = 0),
                      ),
                      _NavItem(
                        icon: Icons.person_outline_rounded,
                        selectedIcon: Icons.person_rounded,
                        label: 'الملف الشخصي',
                        isSelected: _currentIndex == 1,
                        onTap: () => setState(() => _currentIndex = 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(18),
    child: AnimatedContainer(
      duration: context.durations.normal,
      curve: Curves.easeInOutCubic,
      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 22 : 16,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: isSelected ? context.colors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: context.colors.primary.withValues(alpha: 0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? selectedIcon : icon,
            color: isSelected ? Colors.black : context.colors.textSecondary,
            size: 24,
          ),
          if (isSelected) ...[
            8.pw,
            Text(
              label,
              style: context.typography.labelMedium.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    ),
  );
}

typedef NavigationScreen = NavigationPage;
