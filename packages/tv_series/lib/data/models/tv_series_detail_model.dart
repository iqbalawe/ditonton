import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/tv_series.dart';

class TVSeriesDetailResponse extends Equatable {
  const TVSeriesDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.seasons,
  });

  final bool adult;
  final String? backdropPath;
  final List<GenreModel> genres;
  final int id;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final List<SeasonModel> seasons;

  factory TVSeriesDetailResponse.fromJson(Map<String, dynamic> json) =>
      TVSeriesDetailResponse(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genres: List<GenreModel>.from(
          json['genres'].map((x) => GenreModel.fromJson(x)),
        ),
        id: json['id'],
        name: json['name'],
        numberOfEpisodes: json['number_of_episodes'],
        numberOfSeasons: json['number_of_seasons'],
        originalLanguage: json['original_language'],
        originalName: json['original_name'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
        seasons: List<SeasonModel>.from(
          json['seasons'].map((x) => SeasonModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
    'id': id,
    'name': name,
    'number_of_episodes': numberOfEpisodes,
    'number_of_seasons': numberOfSeasons,
    'original_language': originalLanguage,
    'original_name': originalName,
    'overview': overview,
    'poster_path': posterPath,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'seasons': List<dynamic>.from(seasons.map((x) => x.toJson())),
  };

  TVSeriesDetail toEntity() {
    return TVSeriesDetail(
      adult: adult,
      backdropPath: backdropPath,
      genres: genres.map((genre) => genre.toEntity()).toList(),
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

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    genres,
    id,
    name,
    numberOfEpisodes,
    numberOfSeasons,
    originalLanguage,
    originalName,
    overview,
    posterPath,
    voteAverage,
    voteCount,
    seasons,
  ];
}
