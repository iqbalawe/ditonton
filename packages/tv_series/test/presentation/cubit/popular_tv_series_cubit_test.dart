import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late PopularTVSeriesCubit cubit;
  late MockGetPopularTVSeries mockGetPopularTVSeries;

  setUp(() {
    mockGetPopularTVSeries = MockGetPopularTVSeries();
    cubit = PopularTVSeriesCubit(mockGetPopularTVSeries);
  });

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

  group('PopularTVSeriesCubit', () {
    test('initial state should be initial', () {
      expect(cubit.state, const PopularTVSeriesState.initial());
    });

    blocTest<PopularTVSeriesCubit, PopularTVSeriesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetPopularTVSeries.execute(),
        ).thenAnswer((_) async => Right(tTVSeriesList));
        return cubit;
      },
      act: (cubit) => cubit.fetchPopularTVSeries(),
      expect: () => [
        const PopularTVSeriesState.loading(),
        PopularTVSeriesState.loaded(tTVSeriesList),
      ],
    );

    blocTest<PopularTVSeriesCubit, PopularTVSeriesState>(
      'should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetPopularTVSeries.execute(),
        ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchPopularTVSeries(),
      expect: () => [
        const PopularTVSeriesState.loading(),
        const PopularTVSeriesState.error('Server Failure'),
      ],
    );
  });
}
