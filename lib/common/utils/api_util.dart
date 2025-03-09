import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_util.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isConnectedToInternet() async {
  try {
    final connectivityResult = await Connectivity().checkConnectivity();
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.none) return false;

    // Verify actual internet connection
    const exampleHost = 'example.com'; // Or use your server
    final result = await InternetAddress.lookup(exampleHost);
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  } catch (_) {
    return false; // Handle other exceptions
  }
}

/// Http get request
Future<http.Response> makeApiGetRequest(
  String siteUrl,
  Map<String, String> headers,
) async {
  try {
    logger('Api Request [GET]: $siteUrl \nHeaders: ${json.encode(headers)}');

    final response = await http
        .get(
      Uri.parse(siteUrl),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        logger('Timeout occurred. Please try again later.');
        return http.Response('Timeout occurred', 504);
      },
    );

    logger('Api Response: [${response.statusCode}] ${response.body}');

    return response;
  } catch (e) {
    if (e is TimeoutException) {
      logger('Timeout occurred. Please try again later.');
      return http.Response('Timeout occurred', 504);
    } else {
      logger('An error occurred during the HTTP request: $e');
      return http.Response('Internal server error', 500);
    }
  }
}
