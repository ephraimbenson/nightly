// main.dart
// Copyright 2021 Ephraim Benson. All rights reserved.

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter/rendering.dart';

const intro_text = 'Welcome to Nightly';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget welcomeBanner = ArcText(
        radius: 110,
        text: intro_text,
        textStyle: const TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        startAngle: -pi / 2,
        stretchAngle: pi,
        startAngleAlignment: StartAngleAlignment.start,
        placement: Placement.outside);

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        side: BorderSide(width: 3.0, color: Colors.black),
        minimumSize: Size(300, 0),
        padding: EdgeInsets.all(30),
        primary: Colors.yellow,
        textStyle: TextStyle(fontSize: 24));

    Widget createNewInviteButton = ElevatedButton(
      style: buttonStyle,
      onPressed: () {},
      child: const Text('Create Event'),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget centerColumn = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          welcomeBanner,
          createNewInviteButton,
          buttonSection,
        ]);

    return MaterialApp(
        title: 'Nightly',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle.light),
          primarySwatch: Colors.yellow,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // extendBodyBehindAppBar: true,
          backgroundColor: Colors.yellow, //enable me!
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // disables shadow
            leading: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black,
                onPressed: () {
                  // do thing
                }),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.add_circle_rounded),
                  color: Colors.black,
                  onPressed: () {
                    // do things
                  }),
            ],
          ),
          body: Center(child: centerColumn),
        ));
  }

  // this is tutorial code for reference
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
