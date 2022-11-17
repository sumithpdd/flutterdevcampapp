import 'package:flutter/material.dart';
import 'package:news_app/animations/animation_manager.dart';
import 'package:news_app/news/views/views.dart';

Route createFadeInTransitionForSearchResultsRoute(String query) {
  return PageRouteBuilder(
    transitionDuration: AnimationManager.routeTransitionDuration,
    reverseTransitionDuration: AnimationManager.routeTransitionDuration,
    pageBuilder: (context, animation, secondaryAnimation) => SearchResults(query: query),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
