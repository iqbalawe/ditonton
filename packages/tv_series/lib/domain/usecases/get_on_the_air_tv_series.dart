import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import '../entities/tv_series.dart';
import '../repositories/tv_series_repository.dart';

class GetOnTheAirTVSeries {
  final TVSeriesRepository repository;

  GetOnTheAirTVSeries(this.repository);

  Future<Either<Failure, List<TVSeries>>> execute() {
    return repository.getOnTheAirTVSeries();
  }
}
