import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'search_tv_series_state.freezed.dart';

@freezed
class SearchTVSeriesState with _$SearchTVSeriesState {
  const factory SearchTVSeriesState.initial() = _Initial;
  const factory SearchTVSeriesState.loading() = _Loading;
  const factory SearchTVSeriesState.loaded(List<TVSeries> movies) = _Loaded;
  const factory SearchTVSeriesState.empty() = _Empty;
  const factory SearchTVSeriesState.error(String message) = _Error;
}
