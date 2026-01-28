import 'package:core/network/ssl_pinning.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:movies/movies.dart';

final locator = GetIt.instance;

Future<void> init() async {
  await SslPinning.init();

  final secureClient = await SslPinning.client;

  locator.registerLazySingleton<http.Client>(() => secureClient);

  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(client: locator()),
  );
  locator.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(databaseHelper: locator()),
  );

  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));

  locator.registerFactory(() => NowPlayingCubit(locator()));
  locator.registerFactory(() => PopularCubit(locator()));
  locator.registerFactory(() => TopRatedCubit(locator()));
  locator.registerFactory(() => MovieDetailCubit(locator()));
  locator.registerFactory(() => RecommendationsCubit(locator()));
  locator.registerFactory(() => WatchlistMoviesCubit(locator()));
  locator.registerFactory(
    () => WatchlistStatusCubit(
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
}
