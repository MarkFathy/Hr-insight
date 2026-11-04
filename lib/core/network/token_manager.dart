import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages and caches the authentication token in memory to avoid
/// reading and parsing SharedPreferences JSON on every network request.
class TokenManager {
  final SharedPreferences? _prefs;
  String? _cachedToken;

  TokenManager([this._prefs]);

  /// Returns the current JWT token, using in-memory cache if available.
  String get getToken {
    if (_cachedToken != null) {
      return _cachedToken!;
    }
    _cachedToken = _readTokenFromPrefs();
    return _cachedToken ?? '';
  }

  /// Updates the cached token (e.g., after successful login or profile refresh).
  void setToken(String token) {
    _cachedToken = token;
  }

  /// Clears the cached token (e.g., on logout).
  void clearToken() {
    _cachedToken = '';
  }

  /// Invalidates the cache so it will be reloaded from storage on next access.
  void invalidate() {
    _cachedToken = null;
  }

  String? _readTokenFromPrefs() {
    try {
      final prefs = _prefs;
      if (prefs == null) return null;
      final rawAuth = prefs.getString('/auth');
      if (rawAuth == null) return null;
      final decoded = json.decode(rawAuth);
      if (decoded is Map<String, dynamic>) {
        final data1 = decoded['data'];
        if (data1 is Map<String, dynamic>) {
          final data2 = data1['data'];
          if (data2 is Map<String, dynamic>) {
            final tokenValue = data2['token'];
            if (tokenValue is String) {
              return tokenValue;
            }
          }
        }
      }
    } on Exception catch (_) {
      // Return null on parsing errors
    }
    return null;
  }
}

typedef Token = TokenManager;
