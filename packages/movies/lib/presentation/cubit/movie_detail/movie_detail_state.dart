import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'movie_detail_state.freezed.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState.initial() = _Initial;
  const factory MovieDetailState.loading() = _Loading;
  const factory MovieDetailState.loaded(MovieDetail movieDetail) = _Loaded;
  const factory MovieDetailState.error(String message) = _Error;
}
