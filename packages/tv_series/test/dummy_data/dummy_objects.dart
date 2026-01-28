import 'package:core/entities/genre.dart';
import 'package:tv_series/data/models/tv_series_table.dart';
import 'package:tv_series/domain/entities/seasons.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';

final testTvSeries = const TVSeries(
  adult: false,
  backdropPath: '/bwSmgmd90hCWwqOKQYTEraeOZhJ.jpg',
  firstAirDate: '2024-02-27',
  genreIds: [18, 10768],
  id: 126308,
  name: 'Shōgun',
  originalName: 'Shōgun',
  overview:
      'In Japan in the year 1600, at the dawn of a century-defining civil war, Lord Yoshii Toranaga is fighting for his life as his enemies on the Council of Regents unite against him, when a mysterious European ship is found marooned in a nearby fishing village.',
  popularity: 19.3897,
  posterPath: '/7O4iVfOMQmdCSxhOg1WnzG1AgYT.jpg',
  voteAverage: 8.443,
  voteCount: 1596,
);

final testTvSeriesList = [testTvSeries];

final testTVSeriesDetail = const TVSeriesDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  name: 'name',
  numberOfEpisodes: 1,
  numberOfSeasons: 5,
  originalLanguage: 'originalLanguage',
  originalName: 'originalName',
  overview: 'overview',
  posterPath: 'posterPath',
  voteAverage: 1,
  voteCount: 1,
  seasons: [
    Season(
      airDate: 'airDate',
      episodeCount: 1,
      id: 1,
      name: 'name',
      overview: 'overview',
      posterPath: 'posterPath',
      seasonNumber: 1,
    ),
  ],
);

final testWatchlistTvSeries = const TVSeries.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesTable = const TVSeriesTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};
