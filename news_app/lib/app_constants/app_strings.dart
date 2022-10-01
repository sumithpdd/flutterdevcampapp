class AppStrings {
  static const String appName = 'News App';
  static const String searchResultsTitle = 'Search Results';
  static const String chooseASourceText = 'Choose a Source';
  static const List<String> bottomNavBarLabels = [
    'All Articles',
    '',
  ];
  static const String refreshingContentText = ' articles loading';
  static const String defaultSourcePageInfoMessage = 'Default source is set to Ukraine. Choose a source to see '
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
  static const String articlesListIsEmptyText = 'Articles Currently Not Available';
  static const String sampleSuggestion = 'Dart';
  static const String headlinesListIsEmptyText = '❌ No headlines found ❌';
  static const String httpExceptionTitle = 'HTTP Error!';
  static const String missingTitle = 'Article Has No Title';
  static const String missingAuthor = 'Unknown';
  static const String missingImageUrl = 'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640';
  static const String missingUrl = 'Unknown';
}
