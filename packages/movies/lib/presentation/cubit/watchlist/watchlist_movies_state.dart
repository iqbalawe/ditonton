import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'watchlist_movies_state.freezed.dart';

@freezed
class WatchlistMoviesState with _$WatchlistMoviesState {
  const factory WatchlistMoviesState.initial() = _Initial;
  const factory WatchlistMoviesState.loading() = _Loading;
  const factory WatchlistMoviesState.loaded(List<Movie> movies) = _Loaded;
  const factory WatchlistMoviesState.empty() = _Empty;
  const factory WatchlistMoviesState.error(String message) = _Error;
}
