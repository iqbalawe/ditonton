import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsHelper {
  static FirebaseAnalytics? _mockAnalytics;

  static FirebaseAnalytics get _analytics =>
      _mockAnalytics ?? FirebaseAnalytics.instance;

  static void setMockInstance(FirebaseAnalytics mock) {
    _mockAnalytics = mock;
  }

  static Future<void> logWatchlistAction({
    required String type,
    required String title,
    required bool isAdded,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'watchlist_update',
        parameters: {
          'content_type': type,
          'title': title,
          'action': isAdded ? 'added' : 'removed',
        },
      );
    } catch (e) {
      log('Firebase Analytics tidak aktif: $e');
    }
  }
}
