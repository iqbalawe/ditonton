import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_tv_series_status_state.freezed.dart';

@freezed
class WatchlistTVSeriesStatusState with _$WatchlistTVSeriesStatusState {
  const factory WatchlistTVSeriesStatusState.initial() = _Initial;
  const factory WatchlistTVSeriesStatusState.loading() = _Loading;
  const factory WatchlistTVSeriesStatusState.isAdded(bool isAdded) = _IsAdded;
  const factory WatchlistTVSeriesStatusState.message(String message) = _Message;
}
