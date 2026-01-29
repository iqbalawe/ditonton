import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'watchlist_tv_series_state.freezed.dart';

@freezed
class WatchlistTVSeriesState with _$WatchlistTVSeriesState {
  const factory WatchlistTVSeriesState.initial() = _Initial;
  const factory WatchlistTVSeriesState.loading() = _Loading;
  const factory WatchlistTVSeriesState.loaded(List<TVSeries> movies) = _Loaded;
  const factory WatchlistTVSeriesState.empty() = _Empty;
  const factory WatchlistTVSeriesState.error(String message) = _Error;
}
