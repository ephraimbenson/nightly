import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter/rendering.dart';
import 'package:event_demo/editor_page.dart';
import 'event_cards.dart';

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
        textStyle: TextStyle(fontSize: 24));

    Widget createNewInviteButton = ElevatedButton(
      style: buttonStyle,
      onPressed: () {
        print("creating new invite!");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditorPage(title: "My Draft")),
        );
      },
      child: Column(
        children: <Widget>[Text("Create invite"), Icon(Icons.arrow_right_alt)],
      ),
    );

    Widget centerColumn = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          welcomeBanner,
          SizedBox(height: 25),
          createNewInviteButton,
          SizedBox(height: 50),
          eventCards,
        ]);

    return new Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.yellow, //enable me!
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // disables shadow
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_circle_rounded),
              color: Colors.black,
              onPressed: () {
                // transition!
              }),
        ],
      ),
      body: Center(child: centerColumn),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
                height: 125.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Text('My invite drafts',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                )),
            ListTile(
              title: const Text('sample draft 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('sample draft 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
