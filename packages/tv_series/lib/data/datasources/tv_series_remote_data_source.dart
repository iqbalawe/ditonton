import 'dart:convert';

import 'package:core/core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart' as http;
import 'package:tv_series/tv_series.dart';

abstract class TVSeriesRemoteDataSource {
  Future<List<TVSeriesModel>> getOnTheAirTVSeries();
  Future<List<TVSeriesModel>> getPopularTVSeries();
  Future<List<TVSeriesModel>> getTopRatedTVSeries();
  Future<TVSeriesDetailResponse> getTVSeriesDetail(int id);
  Future<List<TVSeriesModel>> getTVSeriesRecommendations(int id);
  Future<List<TVSeriesModel>> searchTVSeries(String query);
}

class TVSeriesRemoteDataSourceImpl implements TVSeriesRemoteDataSource {
  final http.Client client;
  final FirebaseCrashlytics crashlytics;

  TVSeriesRemoteDataSourceImpl({
    required this.client,
    required this.crashlytics,
  });

  @override
  Future<List<TVSeriesModel>> getOnTheAirTVSeries() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/tv/on_the_air?$apiKey'),
      );

      if (response.statusCode == 200) {
        return TVSeriesResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(
        e,
        stack,
        reason: 'Gagal getOnTheAirTVSeries',
      );
      throw ServerException();
    }
  }

  @override
  Future<TVSeriesDetailResponse> getTVSeriesDetail(int id) async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/tv/$id?$apiKey'));

      if (response.statusCode == 200) {
        return TVSeriesDetailResponse.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(
        e,
        stack,
        reason: 'Gagal getTVSeriesDetail',
      );
      throw ServerException();
    }
  }

  @override
  Future<List<TVSeriesModel>> getTVSeriesRecommendations(int id) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/tv/$id/recommendations?$apiKey'),
      );

      if (response.statusCode == 200) {
        return TVSeriesResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(
        e,
        stack,
        reason: 'Gagal getTVSeriesRecommendations',
      );
      throw ServerException();
    }
  }

  @override
  Future<List<TVSeriesModel>> getPopularTVSeries() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/tv/popular?$apiKey'),
      );

      if (response.statusCode == 200) {
        return TVSeriesResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(
        e,
        stack,
        reason: 'Gagal getPopularTVSeries',
      );
      throw ServerException();
    }
  }

  @override
  Future<List<TVSeriesModel>> getTopRatedTVSeries() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/tv/top_rated?$apiKey'),
      );

      if (response.statusCode == 200) {
        return TVSeriesResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(
        e,
        stack,
        reason: 'Gagal getTopRatedTVSeries',
      );
      throw ServerException();
    }
  }

  @override
  Future<List<TVSeriesModel>> searchTVSeries(String query) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/search/tv?$apiKey&query=$query'),
      );

      if (response.statusCode == 200) {
        return TVSeriesResponse.fromJson(json.decode(response.body)).results;
      } else {
        throw ServerException();
      }
    } catch (e, stack) {
      await crashlytics.recordError(e, stack, reason: 'Gagal searchTVSeries');
      throw ServerException();
    }
  }
}
