import 'package:flutter/material.dart';
import 'package:news_app/theme/theme.dart';

class DarkTheme extends BaseTheme {
  @override
  // TODO: implement colorscheme
  ColorScheme get colorscheme => ColorScheme.fromSeed(
      seedColor: Colors.blueGrey, brightness: Brightness.dark);

  ThemeData get themeData => ThemeData(
      primaryColor: colorscheme.primaryContainer,
      scaffoldBackgroundColor: colorscheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorscheme.secondaryContainer,
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontSize: 20,
          color: colorscheme.tertiary,
          fontWeight: FontWeight.bold,
        ),
      ));
}
