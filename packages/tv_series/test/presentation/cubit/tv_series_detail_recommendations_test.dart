import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late TVSeriesRecommendationsCubit cubit;
  late MockGetTVSeriesRecommendations mockGetTVSeriesRecommendations;

  setUp(() {
    mockGetTVSeriesRecommendations = MockGetTVSeriesRecommendations();
    cubit = TVSeriesRecommendationsCubit(mockGetTVSeriesRecommendations);
  });

  const tId = 1;
  final tTVSeries = const TVSeries(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );
  final tTVSeriesList = <TVSeries>[tTVSeries];

  group('TVSeriesRecommendationsCubit', () {
    test('initial state should be initial', () {
      expect(cubit.state, const TVSeriesRecommendationsState.initial());
    });

    blocTest<TVSeriesRecommendationsCubit, TVSeriesRecommendationsState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetTVSeriesRecommendations.execute(tId),
        ).thenAnswer((_) async => Right(tTVSeriesList));
        return cubit;
      },
      act: (cubit) => cubit.fetchTVSeriesRecommendations(tId),
      expect: () => [
        const TVSeriesRecommendationsState.loading(),
        TVSeriesRecommendationsState.loaded(tTVSeriesList),
      ],
    );

    blocTest<TVSeriesRecommendationsCubit, TVSeriesRecommendationsState>(
      'should emit [Loading, Empty] when data is empty',
      build: () {
        when(
          mockGetTVSeriesRecommendations.execute(tId),
        ).thenAnswer((_) async => const Right([]));
        return cubit;
      },
      act: (cubit) => cubit.fetchTVSeriesRecommendations(tId),
      expect: () => [
        const TVSeriesRecommendationsState.loading(),
        const TVSeriesRecommendationsState.empty(),
      ],
    );

    blocTest<TVSeriesRecommendationsCubit, TVSeriesRecommendationsState>(
      'should emit [Loading, Error] when data is unsuccessful',
      build: () {
        when(
          mockGetTVSeriesRecommendations.execute(tId),
        ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchTVSeriesRecommendations(tId),
      expect: () => [
        const TVSeriesRecommendationsState.loading(),
        const TVSeriesRecommendationsState.error('Server Failure'),
      ],
    );
  });
}
