import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import '../entities/tv_series.dart';
import '../repositories/tv_series_repository.dart';

class GetWatchlistTVSeries {
  final TVSeriesRepository _repository;

  GetWatchlistTVSeries(this._repository);

  Future<Either<Failure, List<TVSeries>>> execute() {
    return _repository.getWatchlistTVSeries();
  }
}
