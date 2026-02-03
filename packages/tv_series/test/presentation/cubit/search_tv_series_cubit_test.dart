import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late SearchTVSeriesCubit cubit;
  late MockSearchTVSeries mockSearchTVSeries;

  setUp(() {
    mockSearchTVSeries = MockSearchTVSeries();
    cubit = SearchTVSeriesCubit(mockSearchTVSeries);
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
  const tQuery = 'spiderman';

  group('SearchTVSeriesCubit', () {
    test('initial state should be initial', () {
      expect(cubit.state, const SearchTVSeriesState.initial());
    });

    blocTest<SearchTVSeriesCubit, SearchTVSeriesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockSearchTVSeries.execute(tQuery),
        ).thenAnswer((_) async => Right(tTVSeriesList));
        return cubit;
      },
      act: (cubit) => cubit.onQueryChanged(tQuery),
      expect: () => [
        const SearchTVSeriesState.loading(),
        SearchTVSeriesState.loaded(tTVSeriesList),
      ],
    );

    blocTest<SearchTVSeriesCubit, SearchTVSeriesState>(
      'should emit [Loading, Empty] when data is empty',
      build: () {
        when(
          mockSearchTVSeries.execute(tQuery),
        ).thenAnswer((_) async => const Right([]));
        return cubit;
      },
      act: (cubit) => cubit.onQueryChanged(tQuery),
      expect: () => [
        const SearchTVSeriesState.loading(),
        const SearchTVSeriesState.empty(),
      ],
    );

    blocTest<SearchTVSeriesCubit, SearchTVSeriesState>(
      'should emit [Initial] when query is empty',
      build: () => cubit,
      act: (cubit) => cubit.onQueryChanged(''),
      expect: () => [const SearchTVSeriesState.initial()],
    );

    blocTest<SearchTVSeriesCubit, SearchTVSeriesState>(
      'should emit [Loading, Error] when data is unsuccessful',
      build: () {
        when(
          mockSearchTVSeries.execute(tQuery),
        ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.onQueryChanged(tQuery),
      expect: () => [
        const SearchTVSeriesState.loading(),
        const SearchTVSeriesState.error('Server Failure'),
      ],
    );
  });
}
