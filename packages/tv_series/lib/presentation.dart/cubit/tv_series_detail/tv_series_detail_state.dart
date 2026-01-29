import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_detail_state.freezed.dart';

@freezed
class TVSeriesDetailState with _$TVSeriesDetailState {
  const factory TVSeriesDetailState.initial() = _Initial;
  const factory TVSeriesDetailState.loading() = _Loading;
  const factory TVSeriesDetailState.loaded(TVSeriesDetail movieDetail) =
      _Loaded;
  const factory TVSeriesDetailState.error(String message) = _Error;
}
