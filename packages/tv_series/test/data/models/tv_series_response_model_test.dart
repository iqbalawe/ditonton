import 'dart:convert';

import '../../../lib/data/models/tv_series_model.dart';
import '../../../lib/data/models/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/test/json_reader.dart';

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

  final tTvSeriesResponseModel = TvSeriesResponse(
    tvSeriesList: <TvSeriesModel>[tTvSeriesModel],
  );
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('dummy_data/on_the_air.json'),
      );
      // act
      final result = TvSeriesResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvSeriesResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvSeriesResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        'results': [
          {
            'adult': false,
            'backdrop_path': 'backdropPath',
            'first_air_date': 'firstAirDate',
            'genre_ids': [1, 2, 3],
            'original_name': 'originalName',
            'id': 1,
            'name': 'name',
            'overview': 'overview',
            'popularity': 1.0,
            'poster_path': 'posterPath',
            'vote_average': 1.0,
            'vote_count': 1,
          },
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
