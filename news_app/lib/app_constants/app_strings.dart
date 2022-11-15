import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppStrings {
  static const appName = 'RiverBase News';
  static const searchResultsTitle = 'Search Results';
  static const headlinesTitle = 'Latest Headlines';
  static const articlesTitle = 'Latest Articles';
  static const chooseASourceText = 'Choose a Country';
  static const profilePageCallToAction = 'Save Articles. Read Offline.\nChoose News Outlets.';
  static const signInWithGoogleText = 'Sign In with Google';
  static const bottomNavBarLabels = [
    'All Articles',
    '',
    'Profile',
  ];
  static const sampleSuggestions = ['Ukraine', 'World Cup', 'Elon Musk'];
  static const refreshingContentText = ' articles loading';
  static const defaultSourcePageInfoMessage = 'Default source is set to US. Choose a source to see '
      'headlines '
      'from different countries and in their respective languages';
  static const headlineSourceCountryCodes = [
    'AE', 'AR', 'AT', 'AU', 'BE', 'BG', 'BR', 'CA', 'CH',
    'CN', 'CO', 'CU', 'CZ', 'DE', 'EG', 'FR', 'GB', 'GR',
    'HK', 'HU', 'ID', 'IE', 'IL', 'IN', 'IT', 'JP', 'KR',
    'LT', 'LV', 'MA', 'MX', 'MY', 'NG', 'NL', 'NO', 'NZ',
    'PH', 'PL', 'PT', 'RO', 'RS', 'RU', 'SA', 'SE', 'SG',
    'SI', 'SK', 'TH', 'TR', 'TW', 'UA', 'US', 'VE', 'ZA',
  ];
  static const loading = 'Loading...';

  /// Error / Exception strings
  static const articlesNotFoundImageJpg = 'https://ih1.redbubble.net/image.322905870.6945/st,small,845x845-pad,'
      '1000x1000,f8f8f8.jpg';
  static const articlesNotFoundImagePng = 'https://assets.stickpng.com/images/5845cd230b2a3b54fdbaecf7.png';
  static const articlesListIsEmptyText = 'Articles Currently Not Available';
  static const headlinesListIsEmptyText = '❌ No headlines found ❌';
  static const httpExceptionTryAgainTitle = 'Service appears to be down. Please try again later.';
  static const missingTitle = 'Missing Title';
  static const missingAuthor = 'Unknown';
  static const missingImageUrl = 'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640';
  static const missingUrl = 'Unknown';
  static const missingDate = 'Unknown Date';

  const AppStrings._();
}
