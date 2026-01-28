import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late GetTopRatedTVSeries usecase;
  late MockTVSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTVSeriesRepository();
    usecase = GetTopRatedTVSeries(mockTvSeriesRepository);
  });

  final tTvSeries = <TVSeries>[];

  test('should get list of tv series from repository', () async {
    // arrange
    when(
      mockTvSeriesRepository.getTopRatedTVSeries(),
    ).thenAnswer((_) async => Right(tTvSeries));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvSeries));
  });
}
