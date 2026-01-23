import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  TvSeries({
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

  TvSeries.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
  });

  bool? adult;
  String? backdropPath;
  String? firstAirDate;
  List<int>? genreIds;
  String? originalName;
  int id;
  String? name;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        firstAirDate,
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
