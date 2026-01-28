// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TVSeriesResponse _$TVSeriesResponseFromJson(Map<String, dynamic> json) =>
    _TVSeriesResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => TVSeriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TVSeriesResponseToJson(_TVSeriesResponse instance) =>
    <String, dynamic>{'results': instance.results};
