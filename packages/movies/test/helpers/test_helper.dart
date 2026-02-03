import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:movies/movies.dart';

@GenerateMocks(
  [
    MovieRepository,
    MovieRemoteDataSource,
    MovieLocalDataSource,
    DatabaseHelper,
    GetNowPlayingMovies,
    GetPopularMovies,
    GetTopRatedMovies,
    GetMovieDetail,
    GetMovieRecommendations,
    SearchMovies,
    GetWatchListStatus,
    SaveWatchlist,
    RemoveWatchlist,
    GetWatchlistMovies,
    NavigatorObserver,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
    MockSpec<NowPlayingCubit>(),
    MockSpec<PopularCubit>(),
    MockSpec<TopRatedCubit>(),
    MockSpec<MovieDetailCubit>(),
    MockSpec<RecommendationsCubit>(),
    MockSpec<WatchlistStatusCubit>(),
    MockSpec<SearchMoviesCubit>(),
    MockSpec<WatchlistMoviesCubit>(),
  ],
)
void main() {}
