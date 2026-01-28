import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'popular_state.freezed.dart';

@freezed
class PopularState with _$PopularState {
  const factory PopularState.initial() = _Initial;
  const factory PopularState.loading() = _Loading;
  const factory PopularState.loaded(List<Movie> movies) = _Loaded;
  const factory PopularState.error(String message) = _Error;
}
