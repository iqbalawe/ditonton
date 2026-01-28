// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieTable _$MovieTableFromJson(Map<String, dynamic> json) => _MovieTable(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String?,
  posterPath: json['posterPath'] as String?,
  overview: json['overview'] as String?,
);

Map<String, dynamic> _$MovieTableToJson(_MovieTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'overview': instance.overview,
    };
