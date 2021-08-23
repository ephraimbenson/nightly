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

    Widget myStack = Stack(fit: StackFit.expand, children: <Widget>[
      CustomPaint(
        size: Size.fromHeight(welcomeRadius),
        painter: WelcomePagePainter(color: Colors.black),
      ),
      Positioned.fill(top: welcomeRadius, child: welcomeBanner),
    ]);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            pinned: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return Future<void>.value();
            },
            expandedHeight: welcomeRadius,
            flexibleSpace:
                FlexibleSpaceBar(title: Text('Nightly'), background: myStack),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              const <Widget>[
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Sunday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),

                // ListTiles++
              ],
            ),
          ),
        ],
      ),
    );
  }
}
