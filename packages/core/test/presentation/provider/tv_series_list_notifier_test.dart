import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/usecases/get_on_the_air_tv_series.dart';
import 'package:core/domain/usecases/get_popular_tv_series.dart';
import 'package:core/domain/usecases/get_top_rated_tv_series.dart';
import 'package:core/presentation/provider/tv_series_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_series_list_notifier_test.mocks.dart';

@GenerateMocks([GetOnTheAirTvSeries, GetPopularTvSeries, GetTopRatedTvSeries])
void main() {
  late TvSeriesListNotifier provider;
  late MockGetOnTheAirTvSeries mockGetOnTheAirTvSeries;
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetOnTheAirTvSeries = MockGetOnTheAirTvSeries();
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    provider =
        TvSeriesListNotifier(
          getOnTheAirTvSeries: mockGetOnTheAirTvSeries,
          getPopularTvSeries: mockGetPopularTvSeries,
          getTopRatedTvSeries: mockGetTopRatedTvSeries,
        )..addListener(() {
          listenerCallCount += 1;
        });
  });

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: '/bwSmgmd90hCWwqOKQYTEraeOZhJ.jpg',
    genreIds: [18, 10768],
    id: 126308,
    originalName: 'Shōgun',
    overview:
        'In Japan in the year 1600, at the dawn of a century-defining civil war, Lord Yoshii Toranaga is fighting for his life as his enemies on the Council of Regents unite against him, when a mysterious European ship is found marooned in a nearby fishing village.',
    popularity: 22.2572,
    posterPath: '/7O4iVfOMQmdCSxhOg1WnzG1AgYT.jpg',
    firstAirDate: '2024-02-27',
    name: 'Shōgun',
    voteAverage: 8.443,
    voteCount: 1596,
  );

  final tTvSeriesList = <TvSeries>[tTvSeries];

  group('on the air tv series', () {
    test('initialState should be Empty', () {
      expect(provider.onTheAirState, equals(RequestState.empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(
        mockGetOnTheAirTvSeries.execute(),
      ).thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchOnTheAirTvSeries();
      // assert
      verify(mockGetOnTheAirTvSeries.execute());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(
        mockGetOnTheAirTvSeries.execute(),
      ).thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchOnTheAirTvSeries();
      // assert
      expect(provider.onTheAirState, RequestState.loading);
    });

    test('should change tv series when data is gotten successfully', () async {
      // arrange
      when(
        mockGetOnTheAirTvSeries.execute(),
      ).thenAnswer((_) async => Right(tTvSeriesList));
      // act
      await provider.fetchOnTheAirTvSeries();
      // assert
      expect(provider.onTheAirState, RequestState.loaded);
      expect(provider.onTheAirTvSeries, tTvSeriesList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(
        mockGetOnTheAirTvSeries.execute(),
      ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchOnTheAirTvSeries();
      // assert
      expect(provider.onTheAirState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('popular tv series', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(
        mockGetPopularTvSeries.execute(),
      ).thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchPopularTvSeries();
      // assert
      expect(provider.popularTvSeriesState, RequestState.loading);
      // verify(provider.setState(RequestState.loading));
    });

    test(
      'should change tv series data when data is gotten successfully',
      () async {
        // arrange
        when(
          mockGetPopularTvSeries.execute(),
        ).thenAnswer((_) async => Right(tTvSeriesList));
        // act
        await provider.fetchPopularTvSeries();
        // assert
        expect(provider.popularTvSeriesState, RequestState.loaded);
        expect(provider.popularTvSeries, tTvSeriesList);
        expect(listenerCallCount, 2);
      },
    );

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(
        mockGetPopularTvSeries.execute(),
      ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchPopularTvSeries();
      // assert
      expect(provider.popularTvSeriesState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('top rated tv series', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(
        mockGetTopRatedTvSeries.execute(),
      ).thenAnswer((_) async => Right(tTvSeriesList));
      // act
      provider.fetchTopRatedTvSeries();
      // assert
      expect(provider.topRatedTvSeriesState, RequestState.loading);
    });

    test(
      'should change tv series data when data is gotten successfully',
      () async {
        // arrange
        when(
          mockGetTopRatedTvSeries.execute(),
        ).thenAnswer((_) async => Right(tTvSeriesList));
        // act
        await provider.fetchTopRatedTvSeries();
        // assert
        expect(provider.topRatedTvSeriesState, RequestState.loaded);
        expect(provider.topRatedTvSeries, tTvSeriesList);
        expect(listenerCallCount, 2);
      },
    );

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(
        mockGetTopRatedTvSeries.execute(),
      ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTopRatedTvSeries();
      // assert
      expect(provider.topRatedTvSeriesState, RequestState.error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
