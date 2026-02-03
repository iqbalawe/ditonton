import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late SearchTVSeries usecase;
  late MockTVSeriesRepository mockTVSeriesRepository;

  setUp(() {
    mockTVSeriesRepository = MockTVSeriesRepository();
    usecase = SearchTVSeries(mockTVSeriesRepository);
  });

  final tTVSeriesList = <TVSeries>[];
  const tQuery = 'Breaking';

  test('should get list of tv series from the repository', () async {
    // arrange
    when(
      mockTVSeriesRepository.searchTVSeries(tQuery),
    ).thenAnswer((_) async => Right(tTVSeriesList));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tTVSeriesList));
    verify(mockTVSeriesRepository.searchTVSeries(tQuery));
    verifyNoMoreInteractions(mockTVSeriesRepository);
  });
}
