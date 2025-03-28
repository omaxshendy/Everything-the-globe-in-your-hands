import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/theme/darkTheme.dart';
import 'package:news_app/theme/lightThem.dart';
import 'package:news_app/theme/theme.dart';
import 'package:news_app/web_view_screen.dart';
// test commit
void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  BaseTheme theme = LightTheme();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BaseTheme darkTheme = DarkTheme();

    return MaterialApp(
      theme: theme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(),
       // WebViewApp.routeName: (context) =>  WebViewApp(),
      },
    );
  }
}
