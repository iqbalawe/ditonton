import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_on_the_air_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late GetOnTheAirTVSeries usecase;
  late MockTVSeriesRepository mockTVSeriesRepository;

  setUp(() {
    mockTVSeriesRepository = MockTVSeriesRepository();
    usecase = GetOnTheAirTVSeries(mockTVSeriesRepository);
  });

  final tTvSeries = <TVSeries>[];

  test('should get list of tv series from the repository', () async {
    // arrange
    when(
      mockTVSeriesRepository.getOnTheAirTVSeries(),
    ).thenAnswer((_) async => Right(tTvSeries));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvSeries));
  });
}
