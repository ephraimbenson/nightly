// main.dart
// Copyright 2021 Ephraim Benson. All rights reserved.

import 'package:event_demo/welcome_page/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nightly',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle.light),
        primarySwatch: Colors.yellow,
      ),
      home: WelcomePage(),
    );
  }
}
