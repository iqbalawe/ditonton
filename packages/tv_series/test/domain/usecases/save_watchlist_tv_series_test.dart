import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../test_helper/test_helper.mocks.dart';

void main() {
  late SaveWatchlistTVSeries usecase;
  late MockTVSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTVSeriesRepository();
    usecase = SaveWatchlistTVSeries(mockTvSeriesRepository);
  });

  test('should save tv series to the repository', () async {
    // arrange
    when(
      mockTvSeriesRepository.saveWatchlist(testTVSeriesDetail),
    ).thenAnswer((_) async => const Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTVSeriesDetail);
    // assert
    verify(mockTvSeriesRepository.saveWatchlist(testTVSeriesDetail));
    expect(result, const Right('Added to Watchlist'));
  });
}
