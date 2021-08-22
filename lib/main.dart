// main.dart
// Copyright 2021 Ephraim Benson. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'welcome_page/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nightly',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            // systemOverlayStyle: SystemUiOverlayStyle.light),
            systemOverlayStyle: SystemUiOverlayStyle.dark),
        primarySwatch: Colors.yellow,
      ),
      home: WelcomePage(),
    );
  }
}
