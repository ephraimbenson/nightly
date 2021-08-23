import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter/rendering.dart';
import 'package:event_demo/editor_page.dart';
import 'event_cards.dart';
import 'welcome_page_painter.dart';

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

    Widget welcomeBanner = ArcText(
        radius: welcomeRadius - 25,
        text: intro_text,
        textStyle: const TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black),
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
        color: Colors.yellow,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              stretch: true,
              pinned: true,
              onStretchTrigger: () {
                // Function callback for stretch
                return Future<void>.value();
              },
              expandedHeight: welcomeRadius,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text('Nightly'),
                  centerTitle: true,
                  background: myStack),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.add_circle_rounded),
                    color: Colors.yellow,
                    onPressed: () {
                      showEditorPage(context);
                    }),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  bigInviteButton,
                  EventCards("Today"),
                  EventCards("Friday"),
                  EventCards("Saturday"),
                  EventCards("Monday"),
                  EventCards("Next Week"),
                  EventCards("Some other time"),
                ],
              ),
            ),
          ],
        ));

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: nightlyScrollView,
      drawer: Drawer(
        child: ListView(
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
          ],
        ),
      ),
    );
  }
}
