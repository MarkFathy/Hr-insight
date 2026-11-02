import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/service/internet_connection_service.dart';

/// Mixin for [State] widgets that triggers a callback when real internet connectivity
/// is restored after being disconnected.
mixin AutoConnectivityRestoreMixin<T extends StatefulWidget> on State<T> {
  StreamSubscription<void>? _connectivityRestoreSub;

  @override
  void initState() {
    super.initState();
    if (sl.isRegistered<IInternetConnectionService>()) {
      _connectivityRestoreSub = sl<IInternetConnectionService>()
          .connectivityRestoredStream
          .listen((_) {
            if (mounted) {
              onConnectivityRestored();
            }
          });
    }
  }

  /// Callback executed when real internet reachability is restored.
  void onConnectivityRestored();

  @override
  void dispose() {
    unawaited(_connectivityRestoreSub?.cancel());
    super.dispose();
  }
}
