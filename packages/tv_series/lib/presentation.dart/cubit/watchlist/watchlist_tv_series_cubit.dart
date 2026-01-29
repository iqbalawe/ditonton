import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

class WatchlistTVSeriesCubit extends Cubit<WatchlistTVSeriesState> {
  final GetWatchlistTVSeries _getWatchlistTVSeries;

  WatchlistTVSeriesCubit(this._getWatchlistTVSeries)
    : super(const WatchlistTVSeriesState.initial());

  Future<void> fetchWatchlistTVSeries() async {
    emit(const WatchlistTVSeriesState.loading());

    final result = await _getWatchlistTVSeries.execute();

    result.fold(
      (failure) => emit(WatchlistTVSeriesState.error(failure.message)),
      (movies) {
        if (movies.isEmpty) {
          emit(const WatchlistTVSeriesState.empty());
        } else {
          emit(WatchlistTVSeriesState.loaded(movies));
        }
      },
    );
  }
}
