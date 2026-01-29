import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

class OnTheAirCubit extends Cubit<OnTheAirState> {
  final GetOnTheAirTVSeries _getOnTheAirTVSeries;

  OnTheAirCubit(this._getOnTheAirTVSeries)
    : super(const OnTheAirState.initial());

  Future<void> fetchOnTheAirTVSeries() async {
    emit(const OnTheAirState.loading());

    final result = await _getOnTheAirTVSeries.execute();

    result.fold(
      (failure) => emit(OnTheAirState.error(failure.message)),
      (movies) => emit(OnTheAirState.loaded(movies)),
    );
  }
}
