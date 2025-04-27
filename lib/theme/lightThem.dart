import 'package:flutter/material.dart';
import 'package:news_app/theme/theme.dart';

class LightTheme extends BaseTheme {
  @override
  ColorScheme get colorscheme =>
      ColorScheme.fromSeed(seedColor: Colors.blueAccent);

  @override
  ThemeData get themeData => ThemeData(
      primaryColor: colorscheme.primaryContainer,
      scaffoldBackgroundColor: colorscheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorscheme.surface,
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 20,
            color: colorscheme.primary,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
              fontSize: 24,
              color: colorscheme.tertiary,
              fontWeight: FontWeight.w700)));
}
