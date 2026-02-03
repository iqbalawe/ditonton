import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockSearchMovies mockSearchMovies;
  late SearchMoviesCubit searchMoviesCubit;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    searchMoviesCubit = SearchMoviesCubit(mockSearchMovies);
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

  group('SearchMoviesCubit', () {
    const tQuery = 'spiderman';

    blocTest<SearchMoviesCubit, SearchMoviesState>(
      'Should emit [Loading, Loaded] when search is successful',
      build: () {
        when(
          mockSearchMovies.execute(tQuery),
        ).thenAnswer((_) async => Right(tMovieList));
        return searchMoviesCubit;
      },
      act: (cubit) => cubit.onQueryChanged(tQuery),
      expect: () => [
        const SearchMoviesState.loading(),
        SearchMoviesState.loaded(tMovieList),
      ],
    );

    blocTest<SearchMoviesCubit, SearchMoviesState>(
      'Should return Initial when query is empty',
      build: () => searchMoviesCubit,
      act: (cubit) => cubit.onQueryChanged(''),
      expect: () => [const SearchMoviesState.initial()],
    );
  });

  blocTest<SearchMoviesCubit, SearchMoviesState>(
    'Should emit [Loading, Empty] when data is empty',
    build: () {
      when(
        mockSearchMovies.execute('tQuery'),
      ).thenAnswer((_) async => const Right([]));
      return searchMoviesCubit;
    },
    act: (cubit) => cubit.onQueryChanged('tQuery'),
    expect: () => [
      const SearchMoviesState.loading(),
      const SearchMoviesState.empty(),
    ],
  );
}
