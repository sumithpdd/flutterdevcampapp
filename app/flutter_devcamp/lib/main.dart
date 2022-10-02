import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devcamp/home/home.dart';
import 'package:flutter_devcamp/routes.dart';
import 'package:flutter_devcamp/services/firestore.dart';
import 'package:flutter_devcamp/theme.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'models/models.dart';
import 'shared/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider<AuthService>(create: (_) => AuthService()),
      Provider<Report>(create: (context) => Report()),
    ],
    child: QuizApp(),
  ));
}

class QuizApp extends StatelessWidget {
  QuizApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterDevcamp - Quiz',
      theme: appTheme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
