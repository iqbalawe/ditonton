import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

class PopularTVSeriesCubit extends Cubit<PopularTVSeriesState> {
  final GetPopularTVSeries _getPopularTVSeries;

  PopularTVSeriesCubit(this._getPopularTVSeries)
    : super(const PopularTVSeriesState.initial());

  Future<void> fetchPopularTVSeries() async {
    emit(const PopularTVSeriesState.loading());

    final result = await _getPopularTVSeries.execute();

    result.fold(
      (failure) => emit(PopularTVSeriesState.error(failure.message)),
      (movies) => emit(PopularTVSeriesState.loaded(movies)),
    );
  }
}
