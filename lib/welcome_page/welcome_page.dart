import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nightly/editor_page.dart';
import 'event_cards.dart';

const intro_text = 'Welcome to Nightly';

//TODO: refactor this monster file

//TODO: icons in appbar must become stateful widgets and change color depending on scroll position

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

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        side: BorderSide(width: 3.0, color: Colors.black),
        // minimumSize: Size(300, 0),
        padding: EdgeInsets.all(20),
        textStyle: TextStyle(fontSize: 24));

    final Widget bigInviteButton = Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            showEditorPage(context);
          },
          child: Column(
            children: <Widget>[
              Text("Create invite",
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Icon(Icons.arrow_right_alt)
            ],
          ),
        ));

    Widget nightlyScrollView = Container(
        // margin: EdgeInsets.only(top: statusBarHeight),
        color: Colors.purple,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  bigInviteButton,
                  EventCards("Today"),
                  EventCards("Friday"),
                  EventCards("Saturday"),
                ],
              ),
            ),
          ],
        ));

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.black,
      body: nightlyScrollView,
    );
  }
}
