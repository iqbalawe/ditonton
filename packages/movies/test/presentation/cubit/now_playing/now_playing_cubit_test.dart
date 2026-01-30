import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late NowPlayingCubit nowPlayingCubit;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    nowPlayingCubit = NowPlayingCubit(mockGetNowPlayingMovies);
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

  group('NowPlayingCubit', () {
    test('initial state should be initial', () {
      expect(nowPlayingCubit.state, const NowPlayingState.initial());
    });

    blocTest<NowPlayingCubit, NowPlayingState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetNowPlayingMovies.execute(),
        ).thenAnswer((_) async => Right(tMovieList));
        return nowPlayingCubit;
      },
      act: (cubit) => cubit.fetchNowPlayingMovies(),
      expect: () => [
        const NowPlayingState.loading(),
        NowPlayingState.loaded(tMovieList),
      ],
    );

    blocTest<NowPlayingCubit, NowPlayingState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetNowPlayingMovies.execute(),
        ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return nowPlayingCubit;
      },
      act: (cubit) => cubit.fetchNowPlayingMovies(),
      expect: () => [
        const NowPlayingState.loading(),
        const NowPlayingState.error('Server Failure'),
      ],
    );
  });
}
