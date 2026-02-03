import 'dart:convert';

import 'package:core/core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/movie_response.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailResponse> getMovieDetail(int id);
  Future<List<MovieModel>> getMovieRecommendations(int id);
  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;
  final FirebaseCrashlytics crashlytics;

  MovieRemoteDataSourceImpl({required this.client, required this.crashlytics});

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/movie/now_playing?$apiKey'),
      );

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(
        e,
        stack,
        reason: 'Gagal getNowPlayingMovies',
      );
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/movie/$id?$apiKey'),
      );

      if (response.statusCode == 200) {
        return MovieDetailResponse.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(e, stack, reason: 'Gagal getMovieDetail');
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/movie/$id/recommendations?$apiKey'),
      );

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(
        e,
        stack,
        reason: 'Gagal getMovieRecommendations',
      );
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/movie/popular?$apiKey'),
      );

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(e, stack, reason: 'Gagal getPopularMovies');
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/movie/top_rated?$apiKey'),
      );

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(
        e,
        stack,
        reason: 'Gagal getTopRatedMovies',
      );
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/search/movie?$apiKey&query=$query'),
      );

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(e, stack, reason: 'Gagal searchMovies');
      throw ServerException();
    }
  }
}
