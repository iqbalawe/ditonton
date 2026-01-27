import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import '../../../../tv_series/lib/domain/entities/tv_series.dart';
import '../../../../tv_series/lib/domain/repositories/tv_series_repository.dart';

class SearchTvSeries {
  final TvSeriesRepository repository;

  SearchTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute(String query) {
    return repository.searchTvSeries(query);
  }
}
