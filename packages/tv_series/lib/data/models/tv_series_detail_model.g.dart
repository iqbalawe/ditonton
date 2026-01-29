// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TVSeriesDetailResponse _$TVSeriesDetailResponseFromJson(
  Map<String, dynamic> json,
) => _TVSeriesDetailResponse(
  adult: json['adult'] as bool,
  backdropPath: json['backdrop_path'] as String,
  episodeRunTime: json['episode_run_time'] as List<dynamic>,
  firstAirDate: json['first_air_date'] as String,
  genres: (json['genres'] as List<dynamic>)
      .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  homepage: json['homepage'] as String,
  id: (json['id'] as num).toInt(),
  inProduction: json['in_production'] as bool,
  languages: (json['languages'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  lastAirDate: json['last_air_date'] as String,
  name: json['name'] as String,
  nextEpisodeToAir: json['next_episode_to_air'],
  numberOfEpisodes: (json['number_of_episodes'] as num).toInt(),
  numberOfSeasons: (json['number_of_seasons'] as num).toInt(),
  originCountry: (json['origin_country'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  originalLanguage: json['original_language'] as String,
  originalName: json['original_name'] as String,
  overview: json['overview'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  posterPath: json['poster_path'] as String,
  seasons: (json['seasons'] as List<dynamic>)
      .map((e) => SeasonModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String,
  tagline: json['tagline'] as String,
  type: json['type'] as String,
  voteAverage: (json['vote_average'] as num).toDouble(),
  voteCount: (json['vote_count'] as num).toInt(),
);

Map<String, dynamic> _$TVSeriesDetailResponseToJson(
  _TVSeriesDetailResponse instance,
) => <String, dynamic>{
  'adult': instance.adult,
  'backdrop_path': instance.backdropPath,
  'episode_run_time': instance.episodeRunTime,
  'first_air_date': instance.firstAirDate,
  'genres': instance.genres,
  'homepage': instance.homepage,
  'id': instance.id,
  'in_production': instance.inProduction,
  'languages': instance.languages,
  'last_air_date': instance.lastAirDate,
  'name': instance.name,
  'next_episode_to_air': instance.nextEpisodeToAir,
  'number_of_episodes': instance.numberOfEpisodes,
  'number_of_seasons': instance.numberOfSeasons,
  'origin_country': instance.originCountry,
  'original_language': instance.originalLanguage,
  'original_name': instance.originalName,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'poster_path': instance.posterPath,
  'seasons': instance.seasons,
  'status': instance.status,
  'tagline': instance.tagline,
  'type': instance.type,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
};
