import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

class SearchTVSeriesCubit extends Cubit<SearchTVSeriesState> {
  final SearchTVSeries _searchTVSeries;

  SearchTVSeriesCubit(this._searchTVSeries)
    : super(const SearchTVSeriesState.initial());

  Future<void> onQueryChanged(String query) async {
    if (query.isEmpty) {
      emit(const SearchTVSeriesState.initial());
      return;
    }

    emit(const SearchTVSeriesState.loading());
    final result = await _searchTVSeries.execute(query);

    result.fold((failure) => emit(SearchTVSeriesState.error(failure.message)), (
      data,
    ) {
      if (data.isEmpty) {
        emit(const SearchTVSeriesState.empty());
      } else {
        emit(SearchTVSeriesState.loaded(data));
      }
    });
  }
}
