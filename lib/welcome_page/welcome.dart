import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter/rendering.dart';

const intro_text = 'Welcome to Nightly';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget welcomeBanner = ArcText(
        radius: 140,
        text: intro_text,
        textStyle: const TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        startAngle: -pi / 2,
        stretchAngle: pi,
        placement: Placement.middle);

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        side: BorderSide(width: 3.0, color: Colors.black),
        minimumSize: Size(300, 0),
        padding: EdgeInsets.all(30),
        primary: Colors.yellow,
        textStyle: TextStyle(fontSize: 24));

    Widget createNewInviteButton = ElevatedButton(
      style: buttonStyle,
      onPressed: () {},
      child: const Text('Create invite'),
    );

    Widget cards = new Container(
      height: 100.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: new List.generate(8, (int index) {
          return new Card(
            color: Colors.grey[index * 100],
            child: new Container(
              width: 100.0,
              height: 50.0,
              child: new Text("event details"),
            ),
          );
        }),
      ),
    );

    Widget centerColumn = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          welcomeBanner,
          // Text("Welcome to Nightly"),
          SizedBox(height: 25),
          createNewInviteButton,
          SizedBox(height: 50),
          cards,
        ]);

    return new Scaffold(
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
    );
  }
}
