import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'movie_detail_model.freezed.dart';
part 'movie_detail_model.g.dart';

@freezed
abstract class MovieDetailResponse with _$MovieDetailResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieDetailResponse({
    required bool adult,
    required String backdropPath,
    required int budget,
    required List<GenreModel> genres,
    required String homepage,
    required int id,
    required String imdbId,
    required List<String> originCountry,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required String releaseDate,
    required int revenue,
    required int runtime,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) = _MovieDetailResponse;

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);
}

extension MovieDetailResponseX on MovieDetailResponse {
  MovieDetail toEntity() {
    return MovieDetail(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      genres: genres.map((model) => model.toEntity()).toList(),
      runtime: runtime,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
