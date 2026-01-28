import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'top_rated_state.freezed.dart';

@freezed
class TopRatedState with _$TopRatedState {
  const factory TopRatedState.initial() = _Initial;
  const factory TopRatedState.loading() = _Loading;
  const factory TopRatedState.loaded(List<Movie> movies) = _Loaded;
  const factory TopRatedState.error(String message) = _Error;
}
