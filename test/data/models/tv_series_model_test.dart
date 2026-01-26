import 'package:ditonton/data/models/tv_series_model.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvSeriesModel = TvSeriesModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Movie entity', () async {
    final result = tTvSeriesModel.toEntity();
    expect(result, tTvSeries);
  });

  test('should return a valid model from JSON', () async {
    // Arrange
    final Map<String, dynamic> jsonMap = {
      'adult': false,
      'backdrop_path': 'backdropPath',
      'genre_ids': [1, 2, 3],
      'id': 1,
      'overview': 'overview',
      'popularity': 1.0,
      'poster_path': 'posterPath',
      'vote_average': 1.0,
      'vote_count': 1,
      'first_air_date': '2022-01-01',
      'name': 'name',
      'original_name': 'originalName',
      'origin_country': ['US']
    };
    // Act
    final result = TvSeriesModel.fromJson(jsonMap);
    // Assert
    expect(result, tTvSeriesModel);
  });

  test('should return a JSON map containing proper data', () async {
    // Arrange
    final result = tTvSeriesModel.toJson();
    // Assert
    final expectedJsonMap = {
      'adult': false,
      'backdrop_path': 'backdropPath',
      'genre_ids': [1, 2, 3],
      'id': 1,
      'overview': 'overview',
      'popularity': 1.0,
      'poster_path': 'posterPath',
      'vote_average': 1.0,
      'vote_count': 1,
      'first_air_date': 'firstAirDate',
      'name': 'name',
      'original_name': 'originalName',
    };
    expect(result, expectedJsonMap);
  });
}
