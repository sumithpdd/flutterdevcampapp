import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/pages/pages.dart';

const kEnableDevicePreview = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: kEnableDevicePreview,
        builder: (context) => const NewsApp(),),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        useInheritedMediaQuery: kEnableDevicePreview,
        builder: DevicePreview.appBuilder,
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
