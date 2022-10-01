class AppStrings {
  static const String appName = 'News App';
  static const String searchResultsTitle = 'Search Results';
  static const String chooseASourceText = 'Choose a Source';
  static const List<String> bottomNavBarLabels = [
    'All Articles',
    '',
  ];
  static const List<String> headlineSourceCountryCodes = [
    'ae', 'ar', 'at', 'au', 'be', 'bg', 'br', 'ca', 'ch',
    'cn', 'co', 'cu', 'cz', 'de', 'eg', 'fr', 'gb', 'gr',
    'hk', 'hu', 'id', 'ie', 'il', 'in', 'it', 'jp', 'kr',
    'lt', 'lv', 'ma', 'mx', 'my', 'ng', 'nl', 'no', 'nz',
    'ph', 'pl', 'pt', 'ro', 'rs', 'ru', 'sa', 'se', 'sg',
    'si', 'sk', 'th', 'tr', 'tw', 'ua', 'us', 've', 'za',
  ];


  /// Error / Exception strings
  static const String articlesListIsEmptyText = 'Articles Currently Not Available';
  static const List<String> errorStringsForSuggestions = [
    'Suggestions are currently down 😞',
    'But at least you have auto-complete 😀',
    'The quick brown fox 🦊 jumped over the lazy dog 🐶',
  ];
  static const String headlinesListIsEmptyText = 'Headlines Currently Not Available';
  static const String httpExceptionTitle = 'HTTP Error!';
  static const String missingTitle = 'Article Has No Title';
  static const String missingAuthor = 'Unknown';
  static const String missingImageUrl = 'Unknown';
  static const String missingUrl = 'Unknown';
}
