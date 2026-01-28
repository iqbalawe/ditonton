// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => _MovieModel(
  adult: json['adult'] as bool,
  backdropPath: json['backdropPath'] as String,
  genreIds: (json['genreIds'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  id: (json['id'] as num).toInt(),
  originalLanguage: json['originalLanguage'] as String,
  originalTitle: json['originalTitle'] as String,
  overview: json['overview'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  posterPath: json['posterPath'] as String,
  releaseDate: json['releaseDate'] as String,
  title: json['title'] as String,
  video: json['video'] as bool,
  voteAverage: (json['voteAverage'] as num).toDouble(),
  voteCount: (json['voteCount'] as num).toInt(),
);

Map<String, dynamic> _$MovieModelToJson(_MovieModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'genreIds': instance.genreIds,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
