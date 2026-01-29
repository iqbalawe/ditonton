import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

class TVSeriesRecommendationsCubit extends Cubit<TVSeriesRecommendationsState> {
  final GetTVSeriesRecommendations _getTVSeriesRecommendations;

  TVSeriesRecommendationsCubit(this._getTVSeriesRecommendations)
    : super(const TVSeriesRecommendationsState.initial());

  Future<void> fetchTVSeriesRecommendations(int id) async {
    emit(const TVSeriesRecommendationsState.loading());

    final result = await _getTVSeriesRecommendations.execute(id);

    result.fold(
      (failure) => emit(TVSeriesRecommendationsState.error(failure.message)),
      (movies) {
        if (movies.isEmpty) {
          emit(const TVSeriesRecommendationsState.empty());
        } else {
          emit(TVSeriesRecommendationsState.loaded(movies));
        }
      },
    );
  }
}
