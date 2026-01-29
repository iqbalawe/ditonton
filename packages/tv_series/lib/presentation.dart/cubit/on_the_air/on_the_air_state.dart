import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'on_the_air_state.freezed.dart';

@freezed
class OnTheAirState with _$OnTheAirState {
  const factory OnTheAirState.initial() = _Initial;
  const factory OnTheAirState.loading() = _Loading;
  const factory OnTheAirState.loaded(List<TVSeries> tvSeries) = _Loaded;
  const factory OnTheAirState.error(String message) = _Error;
}
