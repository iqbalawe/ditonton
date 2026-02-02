import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:movies/data/datasources/db/database_helper.dart'; // Sesuaikan path
import 'package:movies/data/models/movie_table.dart'; // Sesuaikan path

void main() {
  late DatabaseHelper databaseHelper;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() {
    databaseHelper = DatabaseHelper();
  });

  final testMovieTable = MovieTable(
    id: 1,
    title: 'Test Movie',
    overview: 'Test Overview',
    posterPath: '/path.jpg',
  );

  group('DatabaseHelper', () {
    test('CRUD Flow (Insert, Get, Remove) should work correctly', () async {
      final insertId = await databaseHelper.insertWatchlist(testMovieTable);
      expect(insertId, 1);

      final result = await databaseHelper.getMovieById(testMovieTable.id);
      expect(result, isNotNull);
      expect(result?['title'], testMovieTable.title);
      expect(result?['overview'], testMovieTable.overview);

      final list = await databaseHelper.getWatchlistMovies();
      expect(list.length, 1);
      expect(list.first['id'], testMovieTable.id);

      final rowsAffected = await databaseHelper.removeWatchlist(testMovieTable);
      expect(rowsAffected, 1);

      final resultAfterRemove = await databaseHelper.getMovieById(
        testMovieTable.id,
      );
      expect(resultAfterRemove, isNull);

      final listAfterRemove = await databaseHelper.getWatchlistMovies();
      expect(listAfterRemove.isEmpty, true);
    });
  });
}
