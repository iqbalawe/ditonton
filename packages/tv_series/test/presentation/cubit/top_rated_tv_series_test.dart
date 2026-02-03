import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late TopRatedTVSeriesCubit cubit;
  late MockGetTopRatedTVSeries mockGetTopRatedTVSeries;

  setUp(() {
    mockGetTopRatedTVSeries = MockGetTopRatedTVSeries();
    cubit = TopRatedTVSeriesCubit(mockGetTopRatedTVSeries);
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

  group('TopRatedTVSeriesCubit', () {
    test('initial state should be initial', () {
      expect(cubit.state, const TopRatedTVSeriesState.initial());
    });

    blocTest<TopRatedTVSeriesCubit, TopRatedTVSeriesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetTopRatedTVSeries.execute(),
        ).thenAnswer((_) async => Right(tTVSeriesList));
        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedTVSeries(),
      expect: () => [
        const TopRatedTVSeriesState.loading(),
        TopRatedTVSeriesState.loaded(tTVSeriesList),
      ],
    );

    blocTest<TopRatedTVSeriesCubit, TopRatedTVSeriesState>(
      'should emit [Loading, Error] when data is unsuccessful',
      build: () {
        when(
          mockGetTopRatedTVSeries.execute(),
        ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedTVSeries(),
      expect: () => [
        const TopRatedTVSeriesState.loading(),
        const TopRatedTVSeriesState.error('Server Failure'),
      ],
    );
  });
}
