import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'top_rated_tv_series_state.freezed.dart';

@freezed
class TopRatedTVSeriesState with _$TopRatedTVSeriesState {
  const factory TopRatedTVSeriesState.initial() = _Initial;
  const factory TopRatedTVSeriesState.loading() = _Loading;
  const factory TopRatedTVSeriesState.loaded(List<TVSeries> movies) = _Loaded;
  const factory TopRatedTVSeriesState.error(String message) = _Error;
}
