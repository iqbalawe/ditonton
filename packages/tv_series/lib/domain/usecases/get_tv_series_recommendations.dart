import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import '../entities/tv_series.dart';
import '../repositories/tv_series_repository.dart';

class GetTVSeriesRecommendations {
  final TVSeriesRepository repository;

  GetTVSeriesRecommendations(this.repository);

  Future<Either<Failure, List<TVSeries>>> execute(int id) {
    return repository.getTVSeriesRecommendations(id);
  }
}
