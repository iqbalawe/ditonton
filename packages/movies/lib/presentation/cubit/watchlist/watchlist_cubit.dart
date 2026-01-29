import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';

class WatchlistStatusCubit extends Cubit<WatchlistStatusState> {
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  WatchlistStatusCubit({
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(const WatchlistStatusState.initial());

  void loadWatchlistStatus(int id) async {
    final result = await getWatchListStatus.execute(id);
    emit(WatchlistStatusState.isAdded(result));
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);

    result.fold(
      (failure) => emit(WatchlistStatusState.message(failure.message)),
      (successMessage) {
        emit(WatchlistStatusState.message(successMessage));
        loadWatchlistStatus(movie.id);
      },
    );
  }

  Future<void> removeFromWatchlist(MovieDetail movie) async {
    final result = await removeWatchlist.execute(movie);

    result.fold(
      (failure) => emit(WatchlistStatusState.message(failure.message)),
      (successMessage) {
        emit(WatchlistStatusState.message(successMessage));
        loadWatchlistStatus(movie.id);
      },
    );
  }
}
