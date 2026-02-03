import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

import '../../json_reader.dart';

void main() {
  const tTVSeriesModel = TVSeriesModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originCountry: ['US'],
    originalLanguage: 'en',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1.0,
    posterPath: 'posterPath',
    firstAirDate: '2022-01-01',
    name: 'name',
    voteAverage: 1.0,
    voteCount: 1,
  );

  const tSeasonModel = SeasonModel(
    airDate: '2022-01-01',
    episodeCount: 10,
    id: 1,
    name: 'Season 1',
    overview: 'overview',
    posterPath: 'posterPath',
    seasonNumber: 1,
    voteAverage: 8.0,
  );

  const tTVSeriesDetailResponse = TVSeriesDetailResponse(
    adult: false,
    backdropPath: 'backdropPath',
    episodeRunTime: [60],
    firstAirDate: '2022-01-01',
    genres: [GenreModel(id: 1, name: 'Action')],
    homepage: 'https://homepage.com',
    id: 1,
    inProduction: true,
    languages: ['en'],
    lastAirDate: '2022-12-31',
    name: 'name',
    nextEpisodeToAir: null,
    numberOfEpisodes: 10,
    numberOfSeasons: 1,
    originCountry: ['US'],
    originalLanguage: 'en',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1.0,
    posterPath: 'posterPath',
    seasons: [tSeasonModel],
    status: 'Ended',
    tagline: 'Tagline',
    type: 'Scripted',
    voteAverage: 1.0,
    voteCount: 1,
  );

  const tTVSeriesTable = TVSeriesTable(
    id: 1,
    name: 'name',
    posterPath: 'posterPath',
    overview: 'overview',
  );

  group('TV Series Models Tests', () {
    test('should parse TVSeriesResponse from json correctly', () {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('dummy_data/on_the_air.json'),
      );

      // Act
      final result = TVSeriesResponse.fromJson(jsonMap);

      // Assert
      expect(result, isA<TVSeriesResponse>());
    });

    test('should parse TVSeriesDetailResponse from json correctly', () {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('dummy_data/tv_series_detail.json'),
      );

      // Act
      final result = TVSeriesDetailResponse.fromJson(jsonMap);

      // Assert
      expect(result, isA<TVSeriesDetailResponse>());
    });

    test('should return TVSeriesTable from Json', () {
      // Arrange
      final Map<String, dynamic> jsonMap = {
        'id': 1,
        'name': 'name',
        'posterPath': 'posterPath',
        'overview': 'overview',
      };

      // Act
      final result = TVSeriesTable.fromJson(jsonMap);

      // Assert
      expect(result, tTVSeriesTable);
    });

    test('should convert TVSeriesTable to json', () {
      // Act
      final result = tTVSeriesTable.toJson();

      // Assert
      final expectedJsonMap = {
        'id': 1,
        'name': 'name',
        'posterPath': 'posterPath',
        'overview': 'overview',
      };
      expect(result, expectedJsonMap);
    });

    test('should convert SeasonModel to Entity', () {
      final entity = tSeasonModel.toEntity();
      expect(entity, isA<Season>());
    });

    test('should convert TVSeriesDetailResponse to Entity', () {
      final entity = tTVSeriesDetailResponse.toEntity();
      expect(entity, isA<TVSeriesDetail>());
    });

    test('should convert TVSeriesModel to Entity', () {
      final entity = tTVSeriesModel.toEntity();
      expect(entity, isA<TVSeries>());
    });

    test('should convert TVSeriesTable from Entity', () {
      final detailEntity = tTVSeriesDetailResponse.toEntity();
      final table = TVSeriesTable.fromEntity(detailEntity);
      expect(table, isA<TVSeriesTable>());
    });
  });
}
