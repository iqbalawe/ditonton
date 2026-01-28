import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@freezed
abstract class MovieResponse with _$MovieResponse {
  const factory MovieResponse({required List<MovieModel> results}) =
      _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
