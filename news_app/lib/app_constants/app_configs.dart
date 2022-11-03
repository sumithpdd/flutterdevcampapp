import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppConfigs {
  /// API Key registered with News API
  ///
  /// See : https://newsapi.org/docs/get-started
  static const String newsApiKey = String.fromEnvironment('APIKEY');

  /// Base URL picked up from NewsAPI documentation
  ///
  /// See : https://newsapi.org/docs/get-started
  static const String baseUrl = String.fromEnvironment('BASEURL');

  const AppConfigs._();
}