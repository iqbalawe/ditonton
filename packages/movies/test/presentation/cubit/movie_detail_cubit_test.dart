import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MovieDetailCubit movieDetailCubit;
  late MockGetMovieDetail mockGetMovieDetail;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    movieDetailCubit = MovieDetailCubit(mockGetMovieDetail);
  });

  const tId = 1;
  final tMovieDetail = const MovieDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    runtime: 120,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );

  group('MovieDetailCubit', () {
    test('initial state should be initial', () {
      expect(movieDetailCubit.state, const MovieDetailState.initial());
    });

    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit [Loading, Loaded] when get movie detail is successful',
      build: () {
        when(
          mockGetMovieDetail.execute(tId),
        ).thenAnswer((_) async => Right(tMovieDetail));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.fetchMovieDetail(tId),
      expect: () => [
        const MovieDetailState.loading(),
        MovieDetailState.loaded(tMovieDetail),
      ],
      verify: (cubit) {
        verify(mockGetMovieDetail.execute(tId));
      },
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit [Loading, Error] when get movie detail is unsuccessful',
      build: () {
        when(
          mockGetMovieDetail.execute(tId),
        ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.fetchMovieDetail(tId),
      expect: () => [
        const MovieDetailState.loading(),
        const MovieDetailState.error('Server Failure'),
      ],
      verify: (cubit) {
        verify(mockGetMovieDetail.execute(tId));
      },
    );
  });
}
