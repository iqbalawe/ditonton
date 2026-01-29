import 'dart:io';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tv_series/data/models/season_model.dart';
import 'package:tv_series/data/models/tv_series_detail_model.dart';
import 'package:tv_series/data/models/tv_series_model.dart';
import 'package:tv_series/data/repositories/tv_series_repository_impl.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../test_helper/test_helper.mocks.dart';

void main() {
  late TVSeriesRepositoryImpl repository;
  late MockTVSeriesRemoteDataSource mockRemoteDataSource;
  late MockTVSeriesLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTVSeriesRemoteDataSource();
    mockLocalDataSource = MockTVSeriesLocalDataSource();
    repository = TVSeriesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  final tTvSeriesModel = const TVSeriesModel(
    adult: false,
    backdropPath: '/bwSmgmd90hCWwqOKQYTEraeOZhJ.jpg',
    genreIds: [18, 10768],
    id: 126308,
    originalName: 'Shōgun',
    originCountry: ['US'],
    originalLanguage: 'en',
    overview:
        'In Japan in the year 1600, at the dawn of a century-defining civil war, Lord Yoshii Toranaga is fighting for his life as his enemies on the Council of Regents unite against him, when a mysterious European ship is found marooned in a nearby fishing village.',
    popularity: 22.2572,
    posterPath: '/7O4iVfOMQmdCSxhOg1WnzG1AgYT.jpg',
    firstAirDate: '2024-02-27',
    name: 'Shōgun',
    voteAverage: 8.443,
    voteCount: 1596,
  );

  final tTvSeries = const TVSeries(
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

  final tTvSeriesModelList = <TVSeriesModel>[tTvSeriesModel];
  final tTvSeriesList = <TVSeries>[tTvSeries];

  group('On The Air TV Series', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getOnTheAirTVSeries(),
        ).thenAnswer((_) async => tTvSeriesModelList);
        // act
        final result = await repository.getOnTheAirTVSeries();
        // assert
        verify(mockRemoteDataSource.getOnTheAirTVSeries());
        final resultList = result.getOrElse(() => []);
        expect(resultList, tTvSeriesList);
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getOnTheAirTVSeries(),
        ).thenThrow(ServerException());
        // act
        final result = await repository.getOnTheAirTVSeries();
        // assert
        verify(mockRemoteDataSource.getOnTheAirTVSeries());
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getOnTheAirTVSeries(),
        ).thenThrow(const SocketException('Failed to connect to the network'));
        // act
        final result = await repository.getOnTheAirTVSeries();
        // assert
        verify(mockRemoteDataSource.getOnTheAirTVSeries());
        expect(
          result,
          equals(
            const Left(ConnectionFailure('Failed to connect to the network')),
          ),
        );
      },
    );
  });

  group('Popular TV Series', () {
    test(
      'should return tv series list when call to data source is success',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getPopularTVSeries(),
        ).thenAnswer((_) async => tTvSeriesModelList);
        // act
        final result = await repository.getPopularTVSeries();
        // assert
        final resultList = result.getOrElse(() => []);
        expect(resultList, tTvSeriesList);
      },
    );

    test(
      'should return server failure when call to data source is unsuccessful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getPopularTVSeries(),
        ).thenThrow(ServerException());
        // act
        final result = await repository.getPopularTVSeries();
        // assert
        expect(result, const Left(ServerFailure('')));
      },
    );

    test(
      'should return connection failure when device is not connected to the internet',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getPopularTVSeries(),
        ).thenThrow(const SocketException('Failed to connect to the network'));
        // act
        final result = await repository.getPopularTVSeries();
        // assert
        expect(
          result,
          const Left(ConnectionFailure('Failed to connect to the network')),
        );
      },
    );
  });

  group('Top Rated TV Series', () {
    test(
      'should return tv series list when call to data source is successful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getTopRatedTVSeries(),
        ).thenAnswer((_) async => tTvSeriesModelList);
        // act
        final result = await repository.getTopRatedTVSeries();
        // assert
        final resultList = result.getOrElse(() => []);
        expect(resultList, tTvSeriesList);
      },
    );

    test(
      'should return ServerFailure when call to data source is unsuccessful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getTopRatedTVSeries(),
        ).thenThrow(ServerException());
        // act
        final result = await repository.getTopRatedTVSeries();
        // assert
        expect(result, const Left(ServerFailure('')));
      },
    );

    test(
      'should return ConnectionFailure when device is not connected to the internet',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getTopRatedTVSeries(),
        ).thenThrow(const SocketException('Failed to connect to the network'));
        // act
        final result = await repository.getTopRatedTVSeries();
        // assert
        expect(
          result,
          const Left(ConnectionFailure('Failed to connect to the network')),
        );
      },
    );
  });

  group('Get TV Series Detail', () {
    final tId = 1;
    final tTvSeriesResponse = const TVSeriesDetailResponse(
      adult: false,
      backdropPath: 'backdropPath',
      name: 'name',
      homepage: 'homepage',
      inProduction: false,
      languages: ['en'],
      lastAirDate: 'lastAirDate',
      nextEpisodeToAir: null,
      originCountry: ['US'],
      popularity: 1,
      status: 'status',
      tagline: 'tagline',
      type: 'type',
      genres: [GenreModel(id: 1, name: 'Action')],
      numberOfEpisodes: 1,
      id: 1,
      numberOfSeasons: 5,
      episodeRunTime: [],
      firstAirDate: 'firstAirDate',
      originalLanguage: 'originalLanguage',
      originalName: 'originalName',
      overview: 'overview',
      posterPath: 'posterPath',
      voteAverage: 1,
      voteCount: 1,
      seasons: [
        SeasonModel(
          airDate: 'airDate',
          episodeCount: 1,
          id: 1,
          name: 'name',
          overview: 'overview',
          posterPath: 'posterPath',
          voteAverage: 1,
          seasonNumber: 1,
        ),
      ],
    );

    test(
      'should return TV Series data when the call to remote data source is successful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getTVSeriesDetail(tId),
        ).thenAnswer((_) async => tTvSeriesResponse);
        // act
        final result = await repository.getTVSeriesDetail(tId);
        // assert
        verify(mockRemoteDataSource.getTVSeriesDetail(tId));
        expect(result, equals(Right(testTVSeriesDetail)));
      },
    );

    test(
      'should return Server Failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getTVSeriesDetail(tId),
        ).thenThrow(ServerException());
        // act
        final result = await repository.getTVSeriesDetail(tId);
        // assert
        verify(mockRemoteDataSource.getTVSeriesDetail(tId));
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getTVSeriesDetail(tId),
        ).thenThrow(const SocketException('Failed to connect to the network'));
        // act
        final result = await repository.getTVSeriesDetail(tId);
        // assert
        verify(mockRemoteDataSource.getTVSeriesDetail(tId));
        expect(
          result,
          equals(
            const Left(ConnectionFailure('Failed to connect to the network')),
          ),
        );
      },
    );
  });

  group('Get TV Series Recommendations', () {
    final tTvSeriesList = <TVSeriesModel>[];
    final tId = 1;

    test(
      'should return data (tv series list) when the call is successful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getTVSeriesRecommendations(tId),
        ).thenAnswer((_) async => tTvSeriesList);
        // act
        final result = await repository.getTVSeriesRecommendations(tId);
        // assert
        verify(mockRemoteDataSource.getTVSeriesRecommendations(tId));
        /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
        final resultList = result.getOrElse(() => []);
        expect(resultList, equals(tTvSeriesList));
      },
    );

    test(
      'should return server failure when call to remote data source is unsuccessful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getTVSeriesRecommendations(tId),
        ).thenThrow(ServerException());
        // act
        final result = await repository.getTVSeriesRecommendations(tId);
        // assertbuild runner
        verify(mockRemoteDataSource.getTVSeriesRecommendations(tId));
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the device is not connected to the internet',
      () async {
        // arrange
        when(
          mockRemoteDataSource.getTVSeriesRecommendations(tId),
        ).thenThrow(const SocketException('Failed to connect to the network'));
        // act
        final result = await repository.getTVSeriesRecommendations(tId);
        // assert
        verify(mockRemoteDataSource.getTVSeriesRecommendations(tId));
        expect(
          result,
          equals(
            const Left(ConnectionFailure('Failed to connect to the network')),
          ),
        );
      },
    );
  });

  group('Seach TV Series', () {
    final tQuery = 'ozark';

    test(
      'should return tv series list when call to data source is successful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.searchTVSeries(tQuery),
        ).thenAnswer((_) async => tTvSeriesModelList);
        // act
        final result = await repository.searchTVSeries(tQuery);
        // assert
        /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
        final resultList = result.getOrElse(() => []);
        expect(resultList, tTvSeriesList);
      },
    );

    test(
      'should return ServerFailure when call to data source is unsuccessful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.searchTVSeries(tQuery),
        ).thenThrow(ServerException());
        // act
        final result = await repository.searchTVSeries(tQuery);
        // assert
        expect(result, const Left(ServerFailure('')));
      },
    );

    test(
      'should return ConnectionFailure when device is not connected to the internet',
      () async {
        // arrange
        when(
          mockRemoteDataSource.searchTVSeries(tQuery),
        ).thenThrow(const SocketException('Failed to connect to the network'));
        // act
        final result = await repository.searchTVSeries(tQuery);
        // assert
        expect(
          result,
          const Left(ConnectionFailure('Failed to connect to the network')),
        );
      },
    );
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(
        mockLocalDataSource.insertWatchlist(testTvSeriesTable),
      ).thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlist(testTVSeriesDetail);
      // assert
      expect(result, const Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(
        mockLocalDataSource.insertWatchlist(testTvSeriesTable),
      ).thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlist(testTVSeriesDetail);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(
        mockLocalDataSource.removeWatchlist(testTvSeriesTable),
      ).thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlist(testTVSeriesDetail);
      // assert
      expect(result, const Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(
        mockLocalDataSource.removeWatchlist(testTvSeriesTable),
      ).thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlist(testTVSeriesDetail);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
      when(
        mockLocalDataSource.getTVSeriesById(tId),
      ).thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlist(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of TV Series', () async {
      // arrange
      when(
        mockLocalDataSource.getWatchlistTVSeries(),
      ).thenAnswer((_) async => [testTvSeriesTable]);
      // act
      final result = await repository.getWatchlistTVSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTvSeries]);
    });
  });
}
