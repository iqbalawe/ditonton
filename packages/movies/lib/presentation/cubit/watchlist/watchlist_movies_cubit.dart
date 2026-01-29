import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';

class WatchlistMoviesCubit extends Cubit<WatchlistMoviesState> {
  final GetWatchlistMovies _getWatchlistMovies;

  WatchlistMoviesCubit(this._getWatchlistMovies)
    : super(const WatchlistMoviesState.initial());

  Future<void> fetchWatchlistMovies() async {
    emit(const WatchlistMoviesState.loading());

    final result = await _getWatchlistMovies.execute();

    result.fold(
      (failure) => emit(WatchlistMoviesState.error(failure.message)),
      (movies) {
        if (movies.isEmpty) {
          emit(const WatchlistMoviesState.empty());
        } else {
          emit(WatchlistMoviesState.loaded(movies));
        }
      },
    );
  }
}
