import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late GetWatchlistTVSeries usecase;
  late MockTVSeriesRepository mockTVSeriesRepository;

  setUp(() {
    mockTVSeriesRepository = MockTVSeriesRepository();
    usecase = GetWatchlistTVSeries(mockTVSeriesRepository);
  });

  final tTVSeriesList = <TVSeries>[];

  test('should get list of tv series from the repository', () async {
    // arrange
    when(
      mockTVSeriesRepository.getWatchlistTVSeries(),
    ).thenAnswer((_) async => Right(tTVSeriesList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTVSeriesList));
    verify(mockTVSeriesRepository.getWatchlistTVSeries());
    verifyNoMoreInteractions(mockTVSeriesRepository);
  });
}
