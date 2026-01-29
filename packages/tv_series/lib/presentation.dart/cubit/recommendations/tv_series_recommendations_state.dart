import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_recommendations_state.freezed.dart';

@freezed
class TVSeriesRecommendationsState with _$TVSeriesRecommendationsState {
  const factory TVSeriesRecommendationsState.initial() = _Initial;
  const factory TVSeriesRecommendationsState.loading() = _Loading;
  const factory TVSeriesRecommendationsState.loaded(List<TVSeries> movies) =
      _Loaded;
  const factory TVSeriesRecommendationsState.empty() = _Empty;
  const factory TVSeriesRecommendationsState.error(String message) = _Error;
}
