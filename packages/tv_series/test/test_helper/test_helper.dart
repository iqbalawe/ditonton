import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:tv_series/tv_series.dart';

@GenerateMocks(
  [
    TVSeriesRepository,
    TVSeriesRemoteDataSource,
    TVSeriesLocalDataSource,
    TVSeriesDatabaseHelper,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
