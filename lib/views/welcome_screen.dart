import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:nightly/views/homepage_drawer.dart';
import 'widgets.dart';
import 'dart:math';

const intro_text = '💙 welcome to nightly 💙 welcome to nightly ';

class WelcomeScreen extends StatelessWidget {
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
            color: Colors.yellow),
        startAngle: -pi / 2 - pi / 24,
        stretchAngle: 2 * pi,
        placement: Placement.inside);

    Widget smileyStack = Stack(alignment: Alignment.center, children: [
      Image.asset('assets/images/anim_cropped.gif'),
      welcomeBanner
    ]);

    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: Colors.yellow),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 100,
            ),
            smileyStack,
            SizedBox(
              height: 100,
            ),
            CreateInviteButton(),
            SizedBox(
              height: 20,
            ),
            Text(
              "or",
              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),
            Text(
              "Sign in",
              style: TextStyle(
                  color: Colors.indigo,
                  decoration: TextDecoration.underline,
                  fontSize: 22),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageDrawer()));
              },
              child: new Text(
                "i am a dev",
                style: TextStyle(color: Colors.indigo),
              ),
            )
          ]),
        ));
  }
}
