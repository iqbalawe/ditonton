import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class SslPinning {
  static Future<http.Client> get client async =>
      _clientInstance ??= await _createLEClient();
  static http.Client? _clientInstance;

  static Future<void> init() async {
    _clientInstance = await _createLEClient();
  }

  static Future<http.Client> _createLEClient() async {
    final context = SecurityContext(withTrustedRoots: false);

    try {
      final certificate = await rootBundle.load(
        'assets/certificates/certificate.pem',
      );
      context.setTrustedCertificatesBytes(certificate.buffer.asUint8List());
    } catch (e) {
      throw Exception(
        "Core Package: Gagal load sertifikat. Pastikan file ada di Root assets! Error: $e",
      );
    }

    final httpClient = HttpClient(context: context);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
          return false;
        };

    return IOClient(httpClient);
  }
}
