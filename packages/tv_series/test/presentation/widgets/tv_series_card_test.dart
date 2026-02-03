import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  final tTVSeries = const TVSeries(
    adult: false,
    backdropPath: '/path.jpg',
    genreIds: [1, 2],
    id: 1,
    originalName: 'Original Name',
    overview: 'Overview',
    popularity: 1.0,
    posterPath: '/poster.jpg',
    firstAirDate: '2022-01-01',
    name: 'TV Name',
    voteAverage: 8.0,
    voteCount: 100,
  );

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(body: body),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Text(settings.name!)),
          settings: settings,
        );
      },
    );
  }

  group('TvSeriesCard Widget Test', () {
    testWidgets('should display TV Series information correctly', (
      tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget(TvSeriesCard(tTVSeries)));

        expect(find.text('TV Name'), findsOneWidget);
        expect(find.text('Overview'), findsOneWidget);
        expect(find.byType(InkWell), findsOneWidget);
      });
    });

    testWidgets('should navigate to detail page when tapped', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget(TvSeriesCard(tTVSeries)));

        // Act
        await tester.tap(find.byType(InkWell));
        await tester.pumpAndSettle();

        // Assert
        expect(find.text(tvSeriesDetailRoute), findsOneWidget);
      });
    });

    testWidgets('should display error icon when image failed to load', (
      tester,
    ) async {
      // 1. Arrange
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget(TvSeriesCard(tTVSeries)));

        final imageFinder = find.byType(CachedNetworkImage);
        final cachedImage = tester.widget<CachedNetworkImage>(imageFinder);

        if (cachedImage.errorWidget != null) {
          final errorWidget = cachedImage.errorWidget!(
            tester.element(imageFinder),
            'url',
            'error',
          );

          // 4. Act
          await tester.pumpWidget(makeTestableWidget(errorWidget));
        }

        // 5. Assert
        expect(find.byIcon(Icons.error), findsOneWidget);
      });
    });
  });
}
