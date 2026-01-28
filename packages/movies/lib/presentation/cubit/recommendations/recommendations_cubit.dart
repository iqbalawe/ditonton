import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';

import 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  final GetMovieRecommendations _getMovieRecommendations;

  RecommendationsCubit(this._getMovieRecommendations)
    : super(const RecommendationsState.initial());

  Future<void> fetchMovieRecommendations(int id) async {
    emit(const RecommendationsState.loading());

    final result = await _getMovieRecommendations.execute(id);

    result.fold(
      (failure) => emit(RecommendationsState.error(failure.message)),
      (movies) {
        if (movies.isEmpty) {
          emit(const RecommendationsState.empty());
        } else {
          emit(RecommendationsState.loaded(movies));
        }
      },
    );
  }
}
