import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });

  final tMovies = <Movie>[];
  const tQuery = 'Spiderman';

  test(
    'should get list of movies from the repository when execute is successful',
    () async {
      when(
        mockMovieRepository.searchMovies(tQuery),
      ).thenAnswer((_) async => Right(tMovies));

      final result = await usecase.execute(tQuery);

      expect(result, Right(tMovies));
      verify(mockMovieRepository.searchMovies(tQuery));
      verifyNoMoreInteractions(mockMovieRepository);
    },
  );
}
