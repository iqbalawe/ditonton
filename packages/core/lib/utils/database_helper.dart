import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:movies/movies.dart';
import 'package:tv_series/tv_series.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblWatchlist = 'watchlist';
  static const String _tblWatchlistTVSeries = 'watchlist_tv_series';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    return await openDatabase(
      databasePath,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE $_tblWatchlistTVSeries (
        id INTEGER PRIMARY KEY,
        name TEXT, 
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE $_tblWatchlistTVSeries (
          id INTEGER PRIMARY KEY,
          name TEXT, 
          overview TEXT,
          posterPath TEXT
        );
      ''');
    }
  }

  Future<int> insertWatchlist(MovieTable movie) async {
    final db = await database;
    return await db!.insert(_tblWatchlist, movie.toJson());
  }

  Future<Map<String, dynamic>?> getMovieById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.isNotEmpty ? results.first : null;
  }

  Future<List<Map<String, dynamic>>> getWatchlistMovies() async {
    final db = await database;
    return await db!.query(_tblWatchlist);
  }

  Future<int> insertWatchlistTVSeries(TVSeriesTable tvSeries) async {
    final db = await database;
    return await db!.insert(_tblWatchlistTVSeries, tvSeries.toJson());
  }

  Future<Map<String, dynamic>?> getTVSeriesById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlistTVSeries,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.isNotEmpty ? results.first : null;
  }

  Future<List<Map<String, dynamic>>> getWatchlistTVSeries() async {
    final db = await database;
    return await db!.query(_tblWatchlistTVSeries);
  }

  Future<int> removeWatchlist(int id, {required bool isTVSeries}) async {
    final db = await database;
    return await db!.delete(
      isTVSeries ? _tblWatchlistTVSeries : _tblWatchlist,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
