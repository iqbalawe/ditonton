import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late WatchlistTVSeriesCubit cubit;
  late MockGetWatchlistTVSeries mockGetWatchlistTVSeries;

  setUp(() {
    mockGetWatchlistTVSeries = MockGetWatchlistTVSeries();
    cubit = WatchlistTVSeriesCubit(mockGetWatchlistTVSeries);
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

  group('WatchlistTVSeriesCubit', () {
    test('initial state should be initial', () {
      expect(cubit.state, const WatchlistTVSeriesState.initial());
    });

    blocTest<WatchlistTVSeriesCubit, WatchlistTVSeriesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetWatchlistTVSeries.execute(),
        ).thenAnswer((_) async => Right(tTVSeriesList));
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistTVSeries(),
      expect: () => [
        const WatchlistTVSeriesState.loading(),
        WatchlistTVSeriesState.loaded(tTVSeriesList),
      ],
    );

    blocTest<WatchlistTVSeriesCubit, WatchlistTVSeriesState>(
      'should emit [Loading, Empty] when data is empty',
      build: () {
        when(
          mockGetWatchlistTVSeries.execute(),
        ).thenAnswer((_) async => const Right([]));
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistTVSeries(),
      expect: () => [
        const WatchlistTVSeriesState.loading(),
        const WatchlistTVSeriesState.empty(),
      ],
    );

    blocTest<WatchlistTVSeriesCubit, WatchlistTVSeriesState>(
      'should emit [Loading, Error] when data is unsuccessful',
      build: () {
        when(mockGetWatchlistTVSeries.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure("Can't get data")),
        );
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistTVSeries(),
      expect: () => [
        const WatchlistTVSeriesState.loading(),
        const WatchlistTVSeriesState.error("Can't get data"),
      ],
    );
  });
}
