import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/service/internet_connection_service.dart';
import 'package:hr_app/core/utils/context_extensions.dart';

/// Root-level UI wrapper around [MaterialApp.builder] that displays an animated
/// status banner for disconnected, unstable, and restored network states.
class InternetConnectionWrapper extends StatefulWidget {
  const InternetConnectionWrapper({
    required this.child,
    super.key,
    this.connectionService,
  });

  final Widget child;
  final IInternetConnectionService? connectionService;

  @override
  State<InternetConnectionWrapper> createState() =>
      _InternetConnectionWrapperState();
}

class _InternetConnectionWrapperState extends State<InternetConnectionWrapper> {
  late final IInternetConnectionService _service;
  late NetworkState _state;
  StreamSubscription<NetworkState>? _subscription;
  bool _showRestored = false;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _service =
        widget.connectionService ??
        (sl.isRegistered<IInternetConnectionService>()
            ? sl<IInternetConnectionService>()
            : sl.isRegistered<InternetConnectionService>()
            ? sl<InternetConnectionService>()
            : InternetConnectionService(registerObserver: false));
    _state = _service.currentState;

    _subscription = _service.stateStream.listen((newState) {
      if (!mounted) return;
      final previousState = _state;
      setState(() {
        _state = newState;
        if (previousState == NetworkState.disconnected &&
            newState == NetworkState.connected) {
          _showRestored = true;
          _hideTimer?.cancel();
          _hideTimer = Timer(const Duration(milliseconds: 1800), () {
            if (mounted) {
              setState(() => _showRestored = false);
            }
          });
        } else if (newState == NetworkState.disconnected ||
            newState == NetworkState.unstable) {
          _showRestored = false;
          _hideTimer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    _hideTimer?.cancel();
    super.dispose();
  }

  bool get _shouldShowBanner =>
      _showRestored ||
      _state == NetworkState.disconnected ||
      _state == NetworkState.unstable;

  @override
  Widget build(BuildContext context) {
    final showBanner = _shouldShowBanner;
    return Column(
      children: [
        AnimatedSize(
          duration: context.durations.normal,
          curve: Curves.easeInOut,
          child: showBanner
              ? _NetworkBanner(
                  state: _state,
                  issue: _service.lastIssue,
                  isRestored: _showRestored,
                  onTap: () => unawaited(_service.checkNow()),
                )
              : const SizedBox.shrink(),
        ),
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: showBanner,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

class _NetworkBanner extends StatelessWidget {
  const _NetworkBanner({
    required this.state,
    required this.issue,
    required this.isRestored,
    required this.onTap,
  });

  final NetworkState state;
  final NetworkIssue issue;
  final bool isRestored;
  final VoidCallback onTap;

  ({Color color, IconData icon, String message}) _resolveContent(
    BuildContext context,
  ) {
    final l10n = context.l10n;
    if (isRestored) {
      return (
        color: context.colors.success,
        icon: Icons.check_circle_outline_rounded,
        message:
            l10n?.internet_restored_banner ?? 'Internet connection restored',
      );
    }

    if (state == NetworkState.unstable) {
      return (
        color: context.colors.warning,
        icon: Icons.wifi_protected_setup_rounded,
        message:
            l10n?.internet_unstable_banner ??
            'Unstable internet connection — loading may be slow',
      );
    }

    switch (issue) {
      case NetworkIssue.captivePortal:
        return (
          color: context.colors.warning,
          icon: Icons.wifi_lock_rounded,
          message:
              l10n?.internet_captive_portal_banner ??
              'Network needs sign-in or has no data balance — tap to check',
        );
      case NetworkIssue.noInternet:
        return (
          color: context.colors.warning,
          icon: Icons.wifi_find_rounded,
          message:
              l10n?.internet_no_access_banner ??
              'Connected to the network but no internet — check your data balance',
        );
      case NetworkIssue.noInterface:
      case NetworkIssue.none:
        final fallback =
            l10n?.no_internet_title != null && l10n?.try_again_text != null
            ? '${l10n!.no_internet_title} — ${l10n.try_again_text}'
            : 'No Internet Connection — Try Again';
        return (
          color: context.colors.error,
          icon: Icons.wifi_off_rounded,
          message: l10n?.internet_disconnected_banner ?? fallback,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = _resolveContent(context);

    return Material(
      color: content.color,
      child: InkWell(
        onTap: onTap,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(content.icon, color: Colors.white, size: 18.r),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    content.message,
                    textAlign: TextAlign.center,
                    style: context.typography.bodySmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
