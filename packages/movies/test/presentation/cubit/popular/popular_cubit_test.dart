import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetPopularMovies mockGetPopularMovies;
  late PopularCubit popularCubit;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    popularCubit = PopularCubit(mockGetPopularMovies);
  });

  final tMovie = const Movie(
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

  group('PopularCubit', () {
    test('initial state should be initial', () {
      expect(popularCubit.state, const PopularState.initial());
    });

    blocTest<PopularCubit, PopularState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetPopularMovies.execute(),
        ).thenAnswer((_) async => Right(tMovieList));
        return popularCubit;
      },
      act: (cubit) => cubit.fetchPopularMovies(),
      expect: () => [
        const PopularState.loading(),
        PopularState.loaded(tMovieList),
      ],
    );

    blocTest<PopularCubit, PopularState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetPopularMovies.execute(),
        ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return popularCubit;
      },
      act: (cubit) => cubit.fetchPopularMovies(),
      expect: () => [
        const PopularState.loading(),
        const PopularState.error('Server Failure'),
      ],
    );
  });
}
