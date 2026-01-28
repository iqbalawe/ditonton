import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'now_playing_state.freezed.dart';

@freezed
class NowPlayingState with _$NowPlayingState {
  const factory NowPlayingState.initial() = _Initial;
  const factory NowPlayingState.loading() = _Loading;
  const factory NowPlayingState.loaded(List<Movie> movies) = _Loaded;
  const factory NowPlayingState.error(String message) = _Error;
}
