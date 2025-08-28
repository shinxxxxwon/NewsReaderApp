import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_reader_app/domain/entities/article.dart';
import 'package:news_reader_app/presentation/screens/detail/detailScreen.dart';
import 'package:news_reader_app/presentation/screens/home/homeScreen.dart';

class AppRouter{
  static const routeHome = "/";
  static const routeDetail = "/detailScreen";

}

final router = GoRouter(
  initialLocation: AppRouter.routeHome,
  routes: [
    GoRoute(
        path: AppRouter.routeHome,
        builder: (context, state) => HomeScreen()
    ),

    GoRoute(
      path: AppRouter.routeDetail,
      builder: (context, state) {
        final article = state.extra as Article;
        return DetailScreen(article: article);
      }
    ),
  ]
);