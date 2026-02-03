import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late TVSeriesLocalDataSourceImpl dataSource;
  late MockTVSeriesDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockTVSeriesDatabaseHelper();
    dataSource = TVSeriesLocalDataSourceImpl(
      databaseHelper: mockDatabaseHelper,
    );
  });

  final tTVSeriesTable = const TVSeriesTable(
    id: 1,
    name: 'Test TV',
    posterPath: '/path.jpg',
    overview: 'Overview',
  );

  final tTVSeriesMap = {
    'id': 1,
    'name': 'Test TV',
    'posterPath': '/path.jpg',
    'overview': 'Overview',
  };

  group('save watchlist', () {
    test(
      'should return success message when insertion to database is successful',
      () async {
        when(
          mockDatabaseHelper.insertWatchlistTVSeries(tTVSeriesTable),
        ).thenAnswer((_) async => 1);

        final result = await dataSource.insertWatchlist(tTVSeriesTable);

        expect(result, 'Added to Watchlist');
      },
    );

    test(
      'should throw DatabaseException when insertion to database is unsuccessful',
      () async {
        when(
          mockDatabaseHelper.insertWatchlistTVSeries(tTVSeriesTable),
        ).thenThrow(Exception());

        final call = dataSource.insertWatchlist(tTVSeriesTable);

        expect(() => call, throwsA(isA<DatabaseException>()));
      },
    );
  });

  group('remove watchlist', () {
    test(
      'should return success message when remove from database is successful',
      () async {
        when(
          mockDatabaseHelper.removeWatchlistTVSeries(tTVSeriesTable),
        ).thenAnswer((_) async => 1);

        final result = await dataSource.removeWatchlist(tTVSeriesTable);

        expect(result, 'Removed from Watchlist');
      },
    );

    test(
      'should throw DatabaseException when remove from database is unsuccessful',
      () async {
        when(
          mockDatabaseHelper.removeWatchlistTVSeries(tTVSeriesTable),
        ).thenThrow(Exception());

        final call = dataSource.removeWatchlist(tTVSeriesTable);

        expect(() => call, throwsA(isA<DatabaseException>()));
      },
    );
  });

  group('Get TV Series Detail By Id', () {
    final tId = 1;

    test('should return TV Series Detail Table when data is found', () async {
      when(
        mockDatabaseHelper.getTVSeriesById(tId),
      ).thenAnswer((_) async => tTVSeriesMap);

      final result = await dataSource.getTVSeriesById(tId);

      expect(result, tTVSeriesTable);
    });

    test('should return null when data is not found', () async {
      when(
        mockDatabaseHelper.getTVSeriesById(tId),
      ).thenAnswer((_) async => null);

      final result = await dataSource.getTVSeriesById(tId);

      expect(result, null);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of TVSeriesTable from database', () async {
      when(
        mockDatabaseHelper.getWatchlistTVSeries(),
      ).thenAnswer((_) async => [tTVSeriesMap]);

      final result = await dataSource.getWatchlistTVSeries();

      expect(result, [tTVSeriesTable]);
    });
  });
}
