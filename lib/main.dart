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
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.yellow),
        startAngle: -pi / 2,
        stretchAngle: pi,
        startAngleAlignment: StartAngleAlignment.start,
        placement: Placement.outside);

    Widget createNewInviteButton = ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)),
        onPressed: null,
        child: const Text('Create invite',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black)));

    Widget eventsRow = Row();

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
          Text("Today, Saturday, Next Week",
              style:
                  TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
          OutlinedButton(
            onPressed: () {
              print('Received click');
            },
            child: const Text(
              'Example Event @10pm',
              style: TextStyle(fontSize: 32),
            ),
          ),
          buttonSection,
        ]);

    return MaterialApp(
        title: 'Nightly',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle.light),
          primarySwatch: Colors.yellow,
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(primary: Colors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // extendBodyBehindAppBar: true,
          backgroundColor: Colors.black, //enable me!
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // disables shadow
            leading: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.yellow,
                onPressed: () {
                  // do thing
                }),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.add_circle_rounded),
                  color: Colors.yellow,
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
