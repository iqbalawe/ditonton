import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail _getMovieDetail;

  MovieDetailCubit(this._getMovieDetail)
    : super(const MovieDetailState.initial());

  Future<void> fetchMovieDetail(int id) async {
    emit(const MovieDetailState.loading());

    final result = await _getMovieDetail.execute(id);

    result.fold(
      (failure) => emit(MovieDetailState.error(failure.message)),
      (data) => emit(MovieDetailState.loaded(data)),
    );
  }
}
