import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

abstract class AppStrings {
  static AppStrings of(BuildContext context) {
    return Localizations.of(context, AppStrings);
  }

  List<String> get bottomNavBarLabels;
}

class AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const AppStringsDelegate._();

  static const delegate = AppStringsDelegate._();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppStrings> load(Locale locale) async {
    try {
      return JsonAppStrings(await _loadJson(locale));
    } catch (e) {
      print('$e');
      return JsonAppStrings(await _loadJson(const Locale('en')));
    }
  }

  Future<Map<String, dynamic>> _loadJson(Locale locale) async {
    final data = await rootBundle.loadString(
      'assets/locale/${locale.languageCode.toLowerCase()}.json',
    );
    return json.decode(data);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppStrings> old) => true;
}

class JsonAppStrings implements AppStrings {
  JsonAppStrings(this._values);

  final Map<String, dynamic> _values;

  // @override
  // List<String> get bottomNavBarLabels => (_values['bottomNavBarLabels'] as List).cast();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if(!invocation.isGetter){
      return super.noSuchMethod(invocation);
    }
    final memberName = _getSymbolName(invocation.memberName);
    final value = _values[memberName];
    if(value is String) {
      return value;
    }else if(value is List) {
      return value.cast<String>();
    }else if(value is Map) {
      return value.cast<String, dynamic>();
    }else {
      throw 'Bad json data: ${value.runtimeType}: $value';
    }
  }

  static String _getSymbolName(Symbol symbol) {
    final regex = RegExp(r'Symbol\("([^"]*)"\)');
    final match = regex.matchAsPrefix(symbol.toString());
    return match!.group(1)!;
  }
}

@immutable
class OldAppStrings {
  static const appName = 'RiverBase News';
  static const searchResultsTitle = 'Search Results';
  static const headlinesTitle = 'Latest Headlines';
  static const articlesTitle = 'Latest Articles';
  static const chooseASourceText = 'Choose a Country';
  static const profilePageCallToAction = 'Save Articles. Read Offline.\nChoose News Outlets.';
  static const signInWithGoogleText = 'Sign In with Google';
  static const sampleSuggestions = ['Ukraine', 'World Cup', 'Elon Musk'];
  static const refreshingContentText = ' articles loading';
  static const defaultSourcePageInfoMessage = 'Default source is set to US. Choose a source to see '
      'headlines '
      'from different countries and in their respective languages';
  static const headlineSourceCountryCodes = [
    'AE',
    'AR',
    'AT',
    'AU',
    'BE',
    'BG',
    'BR',
    'CA',
    'CH',
    'CN',
    'CO',
    'CU',
    'CZ',
    'DE',
    'EG',
    'FR',
    'GB',
    'GR',
    'HK',
    'HU',
    'ID',
    'IE',
    'IL',
    'IN',
    'IT',
    'JP',
    'KR',
    'LT',
    'LV',
    'MA',
    'MX',
    'MY',
    'NG',
    'NL',
    'NO',
    'NZ',
    'PH',
    'PL',
    'PT',
    'RO',
    'RS',
    'RU',
    'SA',
    'SE',
    'SG',
    'SI',
    'SK',
    'TH',
    'TR',
    'TW',
    'UA',
    'US',
    'VE',
    'ZA',
  ];
  static const loading = 'Loading...';

  /// Error / Exception strings
  static const articlesNotFoundImageJpg =
      'https://ih1.redbubble.net/image.322905870.6945/st,small,845x845-pad,'
      '1000x1000,f8f8f8.jpg';
  static const articlesNotFoundImagePng =
      'https://assets.stickpng.com/images/5845cd230b2a3b54fdbaecf7.png';
  static const articlesListIsEmptyText = 'Articles Currently Not Available';
  static const headlinesListIsEmptyText = '❌ No headlines found ❌';
  static const httpExceptionTryAgainTitle = 'Service appears to be down. Please try again later.';
  static const missingTitle = 'Missing Title';
  static const missingAuthor = 'Unknown';
  static const missingImageUrl =
      'https://www.pngfind.com/pngs/m/200-2004811_pepe-meme-pepe-the-frog-thinking-emoji-lol.png';
  static const missingUrl = 'Unknown';
  static const missingDate = 'Unknown Date';
  static const missingDescription = 'No Description Provided';
  static const missingContent = 'No Article Content Provided';
  static const missingSource = <String, dynamic>{'id': 'Unknown', 'name': 'Unknown'};

  const OldAppStrings._();
}
