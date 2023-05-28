import 'package:http/http.dart' as http;
import 'dart:convert';

class NYTimesAPI {
  static Future<dynamic> searchArticles(
    String apiKey,
    String searchQuery,
  ) async {
    const String baseUrl =
        'https://api.nytimes.com/svc/search/v2/articlesearch.json';
    final String requestUrl = '$baseUrl?q=$searchQuery&api-key=$apiKey';

    try {
      final response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        return decodedResponse;
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred during API request: $e');
    }
  }

  static Future<dynamic> getMostViewedArticles(
    String apiKey,
    int period,
  ) async {
    const String baseUrl = 'https://api.nytimes.com/svc/mostpopular/v2/viewed';
    final String requestUrl = '$baseUrl/$period.json';

    try {
      final response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        return decodedResponse;
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred during API request: $e');
    }
  }

  static Future<dynamic> getMostSharedArticles(
    String apiKey,
    int period,
  ) async {
    const String baseUrl = 'https://api.nytimes.com/svc/mostpopular/v2/shared';
    final String requestUrl = '$baseUrl/$period.json';

    try {
      final response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        return decodedResponse;
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred during API request: $e');
    }
  }

  static Future<dynamic> getMostEmailedArticles(
    String apiKey,
    int period,
  ) async {
    const String baseUrl = 'https://api.nytimes.com/svc/mostpopular/v2/emailed';
    final String requestUrl = '$baseUrl/$period.json';

    try {
      final response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        return decodedResponse;
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred during API request: $e');
    }
  }
}
