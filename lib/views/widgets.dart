import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nightly/views/editor_screen.dart';
import 'package:nightly/views/homepage.dart';
import 'event_cards.dart';
import 'homepage_painter.dart';

void showEditorPage(context) {
  print("creating new invite!");
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditorScreen(title: "My Draft")),
  );
}

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    side: BorderSide(width: 3.0, color: Colors.black),
    // minimumSize: Size(300, 0),
    padding: EdgeInsets.all(20),
    textStyle: TextStyle(fontSize: 24));

class CreateInviteButton extends StatelessWidget {
  // final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            showEditorPage(context);
          },
          child: Column(
            children: <Widget>[
              Text("Create an invite",
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Icon(Icons.arrow_right_alt)
            ],
          ),
        ));
  }
}
