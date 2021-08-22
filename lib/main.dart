// main.dart
// Copyright 2021 Ephraim Benson. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'welcome_page/welcome_page.dart';

void main() => runApp(MyApp());

// const MaterialColor primaryBlack = MaterialColor(
//   _blackPrimaryValue,
//   <int, Color>{
//     50: Color(0xFF000000),
//     100: Color(0xFF000000),
//     200: Color(0xFF000000),
//     300: Color(0xFF000000),
//     400: Color(0xFF000000),
//     500: Color(_blackPrimaryValue),
//     600: Color(0xFF000000),
//     700: Color(0xFF000000),
//     800: Color(0xFF000000),
//     900: Color(0xFF000000),
//   },
// );
// const int _blackPrimaryValue = 0xFF000000;
// Might use later

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nightly',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            iconTheme: IconThemeData(color: Colors.yellow)),
        primarySwatch: Colors.yellow,
      ),
      home: WelcomePage(),
    );
  }
}
