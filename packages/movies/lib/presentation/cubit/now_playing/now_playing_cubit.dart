import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';

import 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  NowPlayingCubit(this._getNowPlayingMovies)
    : super(const NowPlayingState.initial());

  Future<void> fetchNowPlayingMovies() async {
    emit(const NowPlayingState.loading());

    final result = await _getNowPlayingMovies.execute();

    result.fold(
      (failure) => emit(NowPlayingState.error(failure.message)),
      (movies) => emit(NowPlayingState.loaded(movies)),
    );
  }
}
