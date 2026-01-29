import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'popular_tv_series_state.freezed.dart';

@freezed
class PopularTVSeriesState with _$PopularTVSeriesState {
  const factory PopularTVSeriesState.initial() = _Initial;
  const factory PopularTVSeriesState.loading() = _Loading;
  const factory PopularTVSeriesState.loaded(List<TVSeries> movies) = _Loaded;
  const factory PopularTVSeriesState.error(String message) = _Error;
}
