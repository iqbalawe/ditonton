import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  late TVSeriesDatabaseHelper databaseHelper;

  final tTVSeriesTable = const TVSeriesTable(
    id: 1,
    name: 'Test TV Series',
    posterPath: '/path.jpg',
    overview: 'This is overview',
  );

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    databaseHelper = TVSeriesDatabaseHelper();

    final db = await databaseHelper.database;
    await db!.delete('watchlist_tv_series');
  });

  group('TV Series Database Helper Tests', () {
    test('Database should be initialized correctly', () async {
      // Act
      final db = await databaseHelper.database;
      // Assert
      expect(db, isNotNull);
      expect(db?.isOpen, true);
    });

    test('should insert tv series to database', () async {
      // Act
      final id = await databaseHelper.insertWatchlistTVSeries(tTVSeriesTable);

      // Assert
      expect(id, tTVSeriesTable.id);
    });

    test('should get tv series by id from database', () async {
      // Arrange
      await databaseHelper.insertWatchlistTVSeries(tTVSeriesTable);

      // Act
      final result = await databaseHelper.getTVSeriesById(tTVSeriesTable.id);

      // Assert
      expect(result, isNotNull);
      expect(result?['id'], tTVSeriesTable.id);
      expect(result?['name'], tTVSeriesTable.name);
      expect(result?['posterPath'], tTVSeriesTable.posterPath);
      expect(result?['overview'], tTVSeriesTable.overview);
    });

    test('should return null when tv series id not found', () async {
      // Act
      final result = await databaseHelper.getTVSeriesById(999);

      // Assert
      expect(result, isNull);
    });

    test('should return list of watchlist tv series', () async {
      // Arrange
      await databaseHelper.insertWatchlistTVSeries(tTVSeriesTable);

      // Act
      final result = await databaseHelper.getWatchlistTVSeries();

      // Assert
      expect(result, isNotEmpty);
      expect(result.first['id'], tTVSeriesTable.id);
    });

    test('should remove tv series from database', () async {
      // Arrange
      await databaseHelper.insertWatchlistTVSeries(tTVSeriesTable);

      // Act
      final resultId = await databaseHelper.removeWatchlistTVSeries(
        tTVSeriesTable,
      );
      final getResult = await databaseHelper.getTVSeriesById(tTVSeriesTable.id);

      // Assert
      expect(resultId, 1);
      expect(getResult, isNull);
    });
  });
}
