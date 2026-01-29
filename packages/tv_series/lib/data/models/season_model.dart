import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'season_model.freezed.dart';
part 'season_model.g.dart';

@freezed
abstract class SeasonModel with _$SeasonModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SeasonModel({
    String? airDate,
    required int episodeCount,
    required int id,
    required String name,
    String? overview,
    String? posterPath,
    required int seasonNumber,
    double? voteAverage,
  }) = _SeasonModel;

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);
}

extension SeasonModelX on SeasonModel {
  Season toEntity() {
    return Season(
      airDate: airDate,
      episodeCount: episodeCount,
      id: id,
      name: name,
      overview: overview ?? '',
      posterPath: posterPath,
      seasonNumber: seasonNumber,
    );
  }
}
