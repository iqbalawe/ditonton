import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late TVSeriesDetailCubit cubit;
  late MockGetTVSeriesDetail mockGetTVSeriesDetail;

  setUp(() {
    mockGetTVSeriesDetail = MockGetTVSeriesDetail();
    cubit = TVSeriesDetailCubit(mockGetTVSeriesDetail);
  });

  const tId = 1;
  const tTVSeriesDetail = TVSeriesDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    name: 'name',
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originalLanguage: 'en',
    originalName: 'originalName',
    overview: 'overview',
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    seasons: [],
  );

  group('TVSeriesDetailCubit', () {
    test('initial state should be initial', () {
      expect(cubit.state, const TVSeriesDetailState.initial());
    });

    blocTest<TVSeriesDetailCubit, TVSeriesDetailState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetTVSeriesDetail.execute(tId),
        ).thenAnswer((_) async => const Right(tTVSeriesDetail));
        return cubit;
      },
      act: (cubit) => cubit.fetchTVSeriesDetail(tId),
      expect: () => [
        const TVSeriesDetailState.loading(),
        const TVSeriesDetailState.loaded(tTVSeriesDetail),
      ],
    );

    blocTest<TVSeriesDetailCubit, TVSeriesDetailState>(
      'should emit [Loading, Error] when data is unsuccessful',
      build: () {
        when(
          mockGetTVSeriesDetail.execute(tId),
        ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchTVSeriesDetail(tId),
      expect: () => [
        const TVSeriesDetailState.loading(),
        const TVSeriesDetailState.error('Server Failure'),
      ],
    );
  });
}
