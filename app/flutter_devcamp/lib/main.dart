import 'package:flutter/material.dart';
import 'package:flutter_devcamp/routes.dart';
import 'package:flutter_devcamp/services/firestore.dart';
import 'package:flutter_devcamp/theme.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'models/models.dart';
import 'shared/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      routes: appRoutes,
    );
  }
}
