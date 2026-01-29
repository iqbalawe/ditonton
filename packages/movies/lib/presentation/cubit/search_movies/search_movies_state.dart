import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'search_movies_state.freezed.dart';

@freezed
class SearchMoviesState with _$SearchMoviesState {
  const factory SearchMoviesState.initial() = _Initial;
  const factory SearchMoviesState.loading() = _Loading;
  const factory SearchMoviesState.loaded(List<Movie> movies) = _Loaded;
  const factory SearchMoviesState.empty() = _Empty;
  const factory SearchMoviesState.error(String message) = _Error;
}
