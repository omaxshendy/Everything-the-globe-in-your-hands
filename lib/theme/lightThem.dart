
import 'package:flutter/material.dart';
import 'package:news_app/theme/theme.dart';

class LightTheme extends BaseTheme{
  @override
 
  Color get backgroundColor => const Color(0xffFFFFFF);

  @override
 
  Color get primaryColor => const Color(0xff171717);
  @override
  
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 20,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        color: primaryColor,
        fontWeight: FontWeight.w700
      )
    )
  );

}