import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_table.freezed.dart';
part 'tv_series_table.g.dart';

@freezed
abstract class TVSeriesTable with _$TVSeriesTable {
  const TVSeriesTable._();

  const factory TVSeriesTable({
    required int id,
    String? name,
    String? posterPath,
    String? overview,
  }) = _TVSeriesTable;

  factory TVSeriesTable.fromEntity(TVSeriesDetail tvSeries) => TVSeriesTable(
    id: tvSeries.id,
    name: tvSeries.name,
    posterPath: tvSeries.posterPath,
    overview: tvSeries.overview,
  );

  factory TVSeriesTable.fromJson(Map<String, dynamic> json) =>
      _$TVSeriesTableFromJson(json);

  TVSeries toEntity() => TVSeries.watchlist(
    id: id,
    overview: overview,
    posterPath: posterPath,
    name: name,
  );
}
