import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_model.freezed.dart';
part 'tv_series_model.g.dart';

@freezed
abstract class TVSeriesModel with _$TVSeriesModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TVSeriesModel({
    @Default(false) bool adult,
    String? backdropPath,
    required List<int> genreIds,
    required int id,
    required List<String> originCountry,
    required String originalLanguage,
    required String originalName,
    required String overview,
    required double popularity,
    String? posterPath,
    String? firstAirDate,
    required String name,
    required double voteAverage,
    required int voteCount,
  }) = _TVSeriesModel;

  factory TVSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$TVSeriesModelFromJson(json);
}

extension TVSeriesModelX on TVSeriesModel {
  TVSeries toEntity() {
    return TVSeries(
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
}
