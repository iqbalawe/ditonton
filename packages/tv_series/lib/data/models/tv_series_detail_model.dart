import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_detail_model.freezed.dart';
part 'tv_series_detail_model.g.dart';

@freezed
abstract class TVSeriesDetailResponse with _$TVSeriesDetailResponse {
  const factory TVSeriesDetailResponse({
    required bool adult,
    required String backdropPath,
    required List<dynamic> episodeRunTime,
    required DateTime firstAirDate,
    required List<GenreModel> genres,
    required String homepage,
    required int id,
    required bool inProduction,
    required List<String> languages,
    required DateTime lastAirDate,
    required String name,
    required dynamic nextEpisodeToAir,
    required int numberOfEpisodes,
    required int numberOfSeasons,
    required List<String> originCountry,
    required String originalLanguage,
    required String originalName,
    required String overview,
    required double popularity,
    required String posterPath,
    required List<SeasonModel> seasons,
    required String status,
    required String tagline,
    required String type,
    required double voteAverage,
    required int voteCount,
  }) = _TVSeriesDetailResponse;

  factory TVSeriesDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TVSeriesDetailResponseFromJson(json);
}

extension TVSeriesDetailResponseX on TVSeriesDetailResponse {
  TVSeriesDetail toEntity() {
    return TVSeriesDetail(
      adult: adult,
      backdropPath: backdropPath,
      genres: genres.map((model) => model.toEntity()).toList(),
      id: id,
      name: name,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
      seasons: seasons.map((season) => season.toEntity()).toList(),
    );
  }
}
