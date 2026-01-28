// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TVSeriesDetailResponse _$TVSeriesDetailResponseFromJson(
  Map<String, dynamic> json,
) => _TVSeriesDetailResponse(
  adult: json['adult'] as bool,
  backdropPath: json['backdropPath'] as String,
  episodeRunTime: json['episodeRunTime'] as List<dynamic>,
  firstAirDate: DateTime.parse(json['firstAirDate'] as String),
  genres: (json['genres'] as List<dynamic>)
      .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  homepage: json['homepage'] as String,
  id: (json['id'] as num).toInt(),
  inProduction: json['inProduction'] as bool,
  languages: (json['languages'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  lastAirDate: DateTime.parse(json['lastAirDate'] as String),
  name: json['name'] as String,
  nextEpisodeToAir: json['nextEpisodeToAir'],
  numberOfEpisodes: (json['numberOfEpisodes'] as num).toInt(),
  numberOfSeasons: (json['numberOfSeasons'] as num).toInt(),
  originCountry: (json['originCountry'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  originalLanguage: json['originalLanguage'] as String,
  originalName: json['originalName'] as String,
  overview: json['overview'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  posterPath: json['posterPath'] as String,
  seasons: (json['seasons'] as List<dynamic>)
      .map((e) => SeasonModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String,
  tagline: json['tagline'] as String,
  type: json['type'] as String,
  voteAverage: (json['voteAverage'] as num).toDouble(),
  voteCount: (json['voteCount'] as num).toInt(),
);

Map<String, dynamic> _$TVSeriesDetailResponseToJson(
  _TVSeriesDetailResponse instance,
) => <String, dynamic>{
  'adult': instance.adult,
  'backdropPath': instance.backdropPath,
  'episodeRunTime': instance.episodeRunTime,
  'firstAirDate': instance.firstAirDate.toIso8601String(),
  'genres': instance.genres,
  'homepage': instance.homepage,
  'id': instance.id,
  'inProduction': instance.inProduction,
  'languages': instance.languages,
  'lastAirDate': instance.lastAirDate.toIso8601String(),
  'name': instance.name,
  'nextEpisodeToAir': instance.nextEpisodeToAir,
  'numberOfEpisodes': instance.numberOfEpisodes,
  'numberOfSeasons': instance.numberOfSeasons,
  'originCountry': instance.originCountry,
  'originalLanguage': instance.originalLanguage,
  'originalName': instance.originalName,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'posterPath': instance.posterPath,
  'seasons': instance.seasons,
  'status': instance.status,
  'tagline': instance.tagline,
  'type': instance.type,
  'voteAverage': instance.voteAverage,
  'voteCount': instance.voteCount,
};
