import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_response.freezed.dart';
part 'tv_series_response.g.dart';

@freezed
abstract class TVSeriesResponse with _$TVSeriesResponse {
  const factory TVSeriesResponse({required List<TVSeriesModel> results}) =
      _TVSeriesResponse;

  factory TVSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$TVSeriesResponseFromJson(json);
}
