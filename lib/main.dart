import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Config/Theme.dart';
import 'package:news_app/Controller/BottomNavigationController.dart';
import 'package:news_app/Pages/HomePageController.dart';

import 'Pages/HomePage/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: darkTheme,
        home: HomePageController(),
    );
  }
}
