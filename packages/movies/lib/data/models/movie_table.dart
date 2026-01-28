import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'movie_table.freezed.dart';
part 'movie_table.g.dart';

@freezed
abstract class MovieTable with _$MovieTable {
  const MovieTable._();

  const factory MovieTable({
    required int id,
    String? title,
    String? posterPath,
    String? overview,
  }) = _MovieTable;

  factory MovieTable.fromEntity(MovieDetail movie) => MovieTable(
    id: movie.id,
    title: movie.title,
    posterPath: movie.posterPath,
    overview: movie.overview,
  );

  factory MovieTable.fromJson(Map<String, dynamic> json) =>
      _$MovieTableFromJson(json);

  Movie toEntity() => Movie.watchlist(
    id: id,
    overview: overview,
    posterPath: posterPath,
    title: title,
  );
}
