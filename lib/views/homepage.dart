import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nightly/views/editor_screen.dart';
import 'package:nightly/views/widgets.dart';
import 'event_cards.dart';
import 'homepage_painter.dart';

void showEditorPage(context) {
  print("creating new invite!");
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditorScreen(title: "My Draft")),
  );
}

class HomePage extends StatelessWidget {
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

    Widget nightlyScrollView = Container(
        // margin: EdgeInsets.only(top: statusBarHeight),
        child: CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              CreateInviteButton(),
              EventCards("Today"),
              EventCards("Friday"),
              EventCards("Saturday"),
            ],
          ),
        ),
      ],
    ));

    Widget myStack = Stack(fit: StackFit.expand, children: <Widget>[
      CustomPaint(
        size: Size.fromHeight(welcomeRadius),
        painter: HomePagePainter(color: Colors.indigo),
      ),
      Positioned.fill(child: nightlyScrollView),
    ]);

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.black,
      body: myStack,
    );
  }
}
