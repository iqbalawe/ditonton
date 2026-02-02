import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistMoviesCubit cubit;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    cubit = WatchlistMoviesCubit(mockGetWatchlistMovies);
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

  group('WatchlistMoviesCubit', () {
    test('initial state should be initial', () {
      expect(cubit.state, WatchlistMoviesState.initial());
    });

    blocTest<WatchlistMoviesCubit, WatchlistMoviesState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetWatchlistMovies.execute(),
        ).thenAnswer((_) async => Right(tMovieList));
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistMovies(),
      expect: () => [
        const WatchlistMoviesState.loading(),
        WatchlistMoviesState.loaded(tMovieList),
      ],
    );

    blocTest<WatchlistMoviesCubit, WatchlistMoviesState>(
      'Should emit [Loading, Empty] when data is empty',
      build: () {
        when(
          mockGetWatchlistMovies.execute(),
        ).thenAnswer((_) async => const Right([]));
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistMovies(),
      expect: () => [
        const WatchlistMoviesState.loading(),
        const WatchlistMoviesState.empty(),
      ],
    );

    blocTest<WatchlistMoviesCubit, WatchlistMoviesState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockGetWatchlistMovies.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure("Can't get data")),
        );
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistMovies(),
      expect: () => [
        const WatchlistMoviesState.loading(),
        const WatchlistMoviesState.error("Can't get data"),
      ],
    );
  });
}
