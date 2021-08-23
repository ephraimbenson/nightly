import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter/rendering.dart';
import 'package:event_demo/editor_page.dart';
import 'event_cards.dart';
import 'welcome_page_painter.dart';

const intro_text = 'Welcome to Nightly';

//TODO: event cards need to be displayed in a listview to enable scrolling/overflow
//TODO: SliverAppBar
//TODO: refactor this monster file

void showEditorPage(context) {
  print("creating new invite!");
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditorPage(title: "My Draft")),
  );
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height;
    double displayWidth = MediaQuery.of(context).size.width;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double welcomeRadius = displayWidth / 2;

    Widget welcomeBanner = ArcText(
        radius: welcomeRadius - 25,
        text: intro_text,
        textStyle: const TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        startAngle: -pi / 2,
        stretchAngle: pi,
        placement: Placement.inside);

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        side: BorderSide(width: 3.0, color: Colors.black),
        // minimumSize: Size(300, 0),
        padding: EdgeInsets.all(20),
        textStyle: TextStyle(fontSize: 24));

    Widget myStack = Stack(children: <Widget>[
      CustomPaint(
        size: Size.fromHeight(welcomeRadius),
        painter: WelcomePagePainter(color: Colors.black),
      ),
      Positioned(left: 0, right: 0, top: welcomeRadius, child: welcomeBanner),
    ]);

    Widget bigInviteButton = SizedBox(
        width: displayWidth * 0.90,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            showEditorPage(context);
          },
          child: Column(
            children: <Widget>[
              Text("Create invite"),
              Icon(Icons.arrow_right_alt)
            ],
          ),
        ));

    Widget buttonsColumn = Expanded(
        child: Container(
            color: Colors.yellow, // Fills color to bottom of screen
            child: MediaQuery.removePadding(
                context: context,
                // removeTop: true,
                child: ListView(children: <Widget>[
                  EventCards("Today"),
                  EventCards("Saturday"),
                  EventCards("Next Week"),
                ]))));

    Widget centerColumn = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              height:
                  statusBarHeight), // Probably a cleaner way to do this exists?
          myStack,
          // bigInviteButton, // TODO: re-enable me when working
          buttonsColumn
        ]);

    return new Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black, //enable me!
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // disables shadow
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_circle_rounded),
              color: Colors.yellow,
              onPressed: () {
                showEditorPage(context);
              }),
        ],
      ),
      body: centerColumn,
      //TODO: replace drawer with custom UI
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
                Navigator.pop(context);
                showEditorPage(context);
              },
            ),
            ListTile(
              title: const Text('sample draft 2'),
              onTap: () {
                Navigator.pop(context);
                showEditorPage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
