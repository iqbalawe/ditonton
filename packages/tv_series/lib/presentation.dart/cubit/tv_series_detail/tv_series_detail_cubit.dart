import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

class TVSeriesDetailCubit extends Cubit<TVSeriesDetailState> {
  final GetTVSeriesDetail _getTvSeriesDetail;

  TVSeriesDetailCubit(this._getTvSeriesDetail)
    : super(const TVSeriesDetailState.initial());

  Future<void> fetchTVSeriesDetail(int id) async {
    emit(const TVSeriesDetailState.loading());

    final result = await _getTvSeriesDetail.execute(id);

    result.fold(
      (failure) => emit(TVSeriesDetailState.error(failure.message)),
      (data) => emit(TVSeriesDetailState.loaded(data)),
    );
  }
}
