import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final GetTopRatedMovies _getTopRatedMovies;

  TopRatedCubit(this._getTopRatedMovies) : super(const TopRatedState.initial());

  Future<void> fetchTopRatedMovies() async {
    emit(const TopRatedState.loading());

    final result = await _getTopRatedMovies.execute();

    result.fold(
      (failure) => emit(TopRatedState.error(failure.message)),
      (movies) => emit(TopRatedState.loaded(movies)),
    );
  }
}
