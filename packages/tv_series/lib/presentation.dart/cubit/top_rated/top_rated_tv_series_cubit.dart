import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

class TopRatedTVSeriesCubit extends Cubit<TopRatedTVSeriesState> {
  final GetTopRatedTVSeries _getTopRatedTVSeries;

  TopRatedTVSeriesCubit(this._getTopRatedTVSeries)
    : super(const TopRatedTVSeriesState.initial());

  Future<void> fetchTopRatedTVSeries() async {
    emit(const TopRatedTVSeriesState.loading());

    final result = await _getTopRatedTVSeries.execute();

    result.fold(
      (failure) => emit(TopRatedTVSeriesState.error(failure.message)),
      (movies) => emit(TopRatedTVSeriesState.loaded(movies)),
    );
  }
}
