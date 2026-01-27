import 'package:core/domain/entities/tv_series.dart';
import 'package:equatable/equatable.dart';

class TvSeriesModel extends Equatable {
  const TvSeriesModel({
    required this.adult,
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.originalName,
    required this.id,
    required this.name,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final String? firstAirDate;
  final List<int> genreIds;
  final String originalName;
  final int id;
  final String name;
  final String overview;
  final double popularity;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) => TvSeriesModel(
    adult: json['adult'],
    backdropPath: json['backdrop_path'],
    firstAirDate: json['first_air_date'],
    genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
    originalName: json['original_name'],
    id: json['id'],
    name: json['name'],
    overview: json['overview'],
    popularity: json['popularity'].toDouble(),
    posterPath: json['poster_path'],
    voteAverage: json['vote_average'].toDouble(),
    voteCount: json['vote_count'],
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'first_air_date': firstAirDate,
    'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
    'original_name': originalName,
    'id': id,
    'name': name,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };

  TvSeries toEntity() {
    return TvSeries(
      adult: adult,
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      genreIds: genreIds,
      originalName: originalName,
      id: id,
      name: name,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    genreIds,
    originalName,
    id,
    name,
    overview,
    popularity,
    posterPath,
    voteAverage,
    voteCount,
  ];
}
