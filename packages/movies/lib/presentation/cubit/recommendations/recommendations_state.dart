import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies.dart';

part 'recommendations_state.freezed.dart';

@freezed
class RecommendationsState with _$RecommendationsState {
  const factory RecommendationsState.initial() = _Initial;
  const factory RecommendationsState.loading() = _Loading;
  const factory RecommendationsState.loaded(List<Movie> movies) = _Loaded;
  const factory RecommendationsState.empty() = _Empty;
  const factory RecommendationsState.error(String message) = _Error;
}
