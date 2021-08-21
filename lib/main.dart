// main.dart
// Copyright 2021 Ephraim Benson. All rights reserved.

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';

const intro_text = 'Welcome to Nightly';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nightly',
      theme: ThemeData(
          primarySwatch: Colors.yellow, scaffoldBackgroundColor: Colors.black),
      home: Scaffold(
          // appBar: AppBar(
          //   title: const Text(intro_text),
          // ),
          body: const Center(
        child: ArcText(
            radius: 120,
            text: intro_text,
            textStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
            startAngle: -pi / 2,
            stretchAngle: pi,
            startAngleAlignment: StartAngleAlignment.start,
            placement: Placement.outside,
            direction: Direction.clockwise),
      )),
    );
  }
}
