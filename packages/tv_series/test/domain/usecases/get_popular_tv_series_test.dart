import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late GetPopularTVSeries usecase;
  late MockTVSeriesRepository mockTVSeriesRepository;

  setUp(() {
    mockTVSeriesRepository = MockTVSeriesRepository();
    usecase = GetPopularTVSeries(mockTVSeriesRepository);
  });

  final tTvSeries = <TVSeries>[];

  group('GetPopularTvSeries Tests', () {
    group('execute', () {
      test(
        'should get list of tv series from the repository when execute function is called',
        () async {
          // arrange
          when(
            mockTVSeriesRepository.getPopularTVSeries(),
          ).thenAnswer((_) async => Right(tTvSeries));
          // act
          final result = await usecase.execute();
          // assert
          expect(result, Right(tTvSeries));
        },
      );
    });
  });
}
