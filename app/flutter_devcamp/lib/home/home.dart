import 'package:flutter/material.dart';

import '../login/login.dart';
import '../services/auth.dart';
import '../shared/shared.dart';
import '../topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //    return const TopicsScreen();

    return LoginScreen();
  }
}
