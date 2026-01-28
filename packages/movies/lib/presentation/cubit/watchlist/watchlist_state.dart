import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_state.freezed.dart';

@freezed
class WatchlistStatusState with _$WatchlistStatusState {
  const factory WatchlistStatusState.initial() = _Initial;
  const factory WatchlistStatusState.loading() = _Loading;
  const factory WatchlistStatusState.isAdded(bool isAdded) = _IsAdded;
  const factory WatchlistStatusState.message(String message) = _Message;
}
