import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppStrings {
  static const String appName = 'RiverBase News';
  static const String searchResultsTitle = 'Search Results';
  static const String headlinesTitle = 'Latest Headlines';
  static const String articlesTitle = 'Latest Articles';
  static const String chooseASourceText = 'Choose a Country';
  static const String profilePageCallToAction = 'Save Articles. Read Offline.\nChoose News Outlets.';
  static const String signInWithGoogleText = 'Sign In with Google';
  static const List<String> bottomNavBarLabels = [
    'All Articles',
    '',
    'Profile',
  ];
  static const String refreshingContentText = ' articles loading';
  static const String defaultSourcePageInfoMessage = 'Default source is set to US. Choose a source to see '
      'headlines '
      'from different countries and in their respective languages';
  static const List<String> headlineSourceCountryCodes = [
    'AE', 'AR', 'AT', 'AU', 'BE', 'BG', 'BR', 'CA', 'CH',
    'CN', 'CO', 'CU', 'CZ', 'DE', 'EG', 'FR', 'GB', 'GR',
    'HK', 'HU', 'ID', 'IE', 'IL', 'IN', 'IT', 'JP', 'KR',
    'LT', 'LV', 'MA', 'MX', 'MY', 'NG', 'NL', 'NO', 'NZ',
    'PH', 'PL', 'PT', 'RO', 'RS', 'RU', 'SA', 'SE', 'SG',
    'SI', 'SK', 'TH', 'TR', 'TW', 'UA', 'US', 'VE', 'ZA',
  ];

  /// Error / Exception strings
  static const String articlesNotFoundImageJpg = 'https://ih1.redbubble.net/image.322905870.6945/st,small,845x845-pad,'
      '1000x1000,f8f8f8.jpg';
  static const String articlesNotFoundImagePng = 'https://assets.stickpng.com/images/5845cd230b2a3b54fdbaecf7.png';
  static const String articlesListIsEmptyText = 'Articles Currently Not Available';
  static const String sampleSuggestion = 'Dart';
  static const String headlinesListIsEmptyText = '❌ No headlines found ❌';
  static const String httpExceptionTryAgainTitle = 'Service appears to be down. Please try again later.';
  static const String missingTitle = 'Article Has No Title';
  static const String missingAuthor = 'Unknown';
  static const String missingImageUrl = 'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640';
  static const String missingUrl = 'Unknown';
  static const String missingDate = 'Unknown Date';

  const AppStrings._();
}
