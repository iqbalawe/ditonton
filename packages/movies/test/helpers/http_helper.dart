import 'dart:async';
import 'dart:io';
import 'package:mockito/mockito.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) => MyHttpClient();
}

class MyHttpOverridesError extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) => MyHttpClientError();
}

class MyHttpClient extends Mock implements HttpClient {
  @override
  Future<HttpClientRequest> getUrl(Uri url) =>
      Future.value(MyHttpClientRequest());

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) =>
      Future.value(MyHttpClientRequest());
}

class MyHttpClientRequest extends Mock implements HttpClientRequest {
  @override
  Future<HttpClientResponse> close() => Future.value(MyHttpClientResponse());
}

class MyHttpClientResponse extends Mock implements HttpClientResponse {
  @override
  int get statusCode => 200;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return Stream<List<int>>.error(
      const SocketException('No Internet Connection'),
    ).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}

class MyHttpClientError extends Mock implements HttpClient {
  @override
  Future<HttpClientRequest> getUrl(Uri url) =>
      Future.error(const SocketException('Failed to connect to network'));

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) =>
      Future.error(const SocketException('Failed to connect to network'));
}
