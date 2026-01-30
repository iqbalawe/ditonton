import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late RecommendationsCubit recommendationsCubit;

  setUp(() {
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    recommendationsCubit = RecommendationsCubit(mockGetMovieRecommendations);
  });

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovieList = <Movie>[tMovie];

  group('RecommendationsCubit', () {
    const tId = 1;

    blocTest<RecommendationsCubit, RecommendationsState>(
      'Should emit [Loading, Loaded] when data is not empty',
      build: () {
        when(
          mockGetMovieRecommendations.execute(tId),
        ).thenAnswer((_) async => Right(tMovieList));
        return recommendationsCubit;
      },
      act: (cubit) => cubit.fetchMovieRecommendations(tId),
      expect: () => [
        const RecommendationsState.loading(),
        RecommendationsState.loaded(tMovieList),
      ],
    );

    blocTest<RecommendationsCubit, RecommendationsState>(
      'Should emit [Loading, Empty] when data is empty',
      build: () {
        when(
          mockGetMovieRecommendations.execute(tId),
        ).thenAnswer((_) async => const Right([]));
        return recommendationsCubit;
      },
      act: (cubit) => cubit.fetchMovieRecommendations(tId),
      expect: () => [
        const RecommendationsState.loading(),
        const RecommendationsState.empty(),
      ],
    );
  });
}
