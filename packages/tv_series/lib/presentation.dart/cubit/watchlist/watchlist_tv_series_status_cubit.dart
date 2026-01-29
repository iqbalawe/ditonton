import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

class WatchlistTVSeriesStatusCubit extends Cubit<WatchlistTVSeriesStatusState> {
  final GetWatchListStatusTVSeries getWatchListStatusTVSeries;
  final SaveWatchlistTVSeries saveWatchlistTVSeries;
  final RemoveWatchlistTVSeries removeWatchlistTVSeries;

  WatchlistTVSeriesStatusCubit({
    required this.getWatchListStatusTVSeries,
    required this.saveWatchlistTVSeries,
    required this.removeWatchlistTVSeries,
  }) : super(const WatchlistTVSeriesStatusState.initial());

  void loadWatchlistStatus(int id) async {
    final result = await getWatchListStatusTVSeries.execute(id);
    emit(WatchlistTVSeriesStatusState.isAdded(result));
  }

  Future<void> addWatchlist(TVSeriesDetail tvSeries) async {
    final result = await saveWatchlistTVSeries.execute(tvSeries);

    result.fold(
      (failure) => emit(WatchlistTVSeriesStatusState.message(failure.message)),
      (successMessage) {
        emit(WatchlistTVSeriesStatusState.message(successMessage));
        loadWatchlistStatus(tvSeries.id);
      },
    );
  }

  Future<void> removeFromWatchlist(TVSeriesDetail tvSeries) async {
    final result = await removeWatchlistTVSeries.execute(tvSeries);

    result.fold(
      (failure) => emit(WatchlistTVSeriesStatusState.message(failure.message)),
      (successMessage) {
        emit(WatchlistTVSeriesStatusState.message(successMessage));
        loadWatchlistStatus(tvSeries.id);
      },
    );
  }
}
