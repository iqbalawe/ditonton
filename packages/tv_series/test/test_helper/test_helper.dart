import 'package:core/core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:tv_series/tv_series.dart';

@GenerateMocks(
  [
    TVSeriesRepository,
    TVSeriesRemoteDataSource,
    TVSeriesLocalDataSource,
    GetOnTheAirTVSeries,
    GetPopularTVSeries,
    GetTVSeriesDetail,
    GetTVSeriesRecommendations,
    GetTopRatedTVSeries,
    GetWatchListStatusTVSeries,
    GetWatchlistTVSeries,
    SaveWatchlistTVSeries,
    RemoveWatchlistTVSeries,
    SearchTVSeries,
    NavigatorObserver,
    DatabaseHelper,
    FirebaseCrashlytics,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
    MockSpec<OnTheAirCubit>(),
    MockSpec<PopularTVSeriesCubit>(),
    MockSpec<TopRatedTVSeriesCubit>(),
    MockSpec<TVSeriesDetailCubit>(),
    MockSpec<TVSeriesRecommendationsCubit>(),
    MockSpec<WatchlistTVSeriesStatusCubit>(),
    MockSpec<WatchlistTVSeriesCubit>(),
    MockSpec<SearchTVSeriesCubit>(),
  ],
)
void main() {}
