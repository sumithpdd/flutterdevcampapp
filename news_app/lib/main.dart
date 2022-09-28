import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/pages/pages.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const HomePage(),
    ),
  );
}
