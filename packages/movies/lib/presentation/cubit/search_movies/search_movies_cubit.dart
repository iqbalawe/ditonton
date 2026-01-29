import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecases/search_movies.dart';

import 'search_movies_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final SearchMovies _searchMovies;

  SearchMoviesCubit(this._searchMovies)
    : super(const SearchMoviesState.initial());

  Future<void> onQueryChanged(String query) async {
    if (query.isEmpty) {
      emit(const SearchMoviesState.initial());
      return;
    }

    emit(const SearchMoviesState.loading());
    final result = await _searchMovies.execute(query);

    result.fold((failure) => emit(SearchMoviesState.error(failure.message)), (
      data,
    ) {
      if (data.isEmpty) {
        emit(const SearchMoviesState.empty());
      } else {
        emit(SearchMoviesState.loaded(data));
      }
    });
  }
}
