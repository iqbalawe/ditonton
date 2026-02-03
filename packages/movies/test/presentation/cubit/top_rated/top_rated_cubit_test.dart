import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late TopRatedCubit topRatedCubit;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    topRatedCubit = TopRatedCubit(mockGetTopRatedMovies);
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

  group('TopRatedCubit', () {
    test('initial state should be initial', () {
      expect(topRatedCubit.state, const TopRatedState.initial());
    });

    blocTest<TopRatedCubit, TopRatedState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetTopRatedMovies.execute(),
        ).thenAnswer((_) async => Right(tMovieList));
        return topRatedCubit;
      },
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => [
        const TopRatedState.loading(),
        TopRatedState.loaded(tMovieList),
      ],
    );

    blocTest<TopRatedCubit, TopRatedState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetTopRatedMovies.execute(),
        ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        return topRatedCubit;
      },
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => [
        const TopRatedState.loading(),
        const TopRatedState.error('Server Failure'),
      ],
    );
  });
}
