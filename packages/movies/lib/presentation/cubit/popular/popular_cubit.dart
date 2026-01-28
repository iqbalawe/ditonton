import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';

import 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final GetPopularMovies _getPopularMovies;

  PopularCubit(this._getPopularMovies) : super(const PopularState.initial());

  Future<void> fetchPopularMovies() async {
    emit(const PopularState.loading());

    final result = await _getPopularMovies.execute();

    result.fold(
      (failure) => emit(PopularState.error(failure.message)),
      (movies) => emit(PopularState.loaded(movies)),
    );
  }
}
