import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:news_reader_app/core/theme/app_theme.dart";
import "package:news_reader_app/presentation/routes/app_router.dart";
import "package:news_reader_app/presentation/screens/home/homeScreen.dart";

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter News Reader',

      theme: AppTheme.lightTheme,  // core/theme/app_theme.dart 에 정의
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router
    );
  }
}
