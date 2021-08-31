// main.dart
// Copyright 2021 Ephraim Benson. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/homepage.dart';
import 'views/homepage_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nightly',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'RobotoMono',
        appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.black,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            iconTheme: IconThemeData(color: Colors.yellow, size: 80.0)),
      ),
      home: HomePageDrawer(),
    );
  }
}
