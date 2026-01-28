import 'package:equatable/equatable.dart';

class TVSeries extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final String? firstAirDate;
  final List<int>? genreIds;
  final String? originalName;
  final int id;
  final String? name;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;

  const TVSeries({
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

  const TVSeries.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
  }) : adult = null,
       backdropPath = null,
       firstAirDate = null,
       genreIds = null,
       originalName = null,
       popularity = null,
       voteAverage = null,
       voteCount = null;

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
