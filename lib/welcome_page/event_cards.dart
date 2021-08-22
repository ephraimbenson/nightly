import 'package:flutter/material.dart';

Widget eventCards = new Container(
  height: 100.0,
  child: new ListView(
    scrollDirection: Axis.horizontal,
    children: new List.generate(8, (int index) {
      return new Card(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: new Container(
              width: 150.0,
              height: 50.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Event Details",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "@10:30 pm - 1 am",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Icon(Icons.home, color: Colors.white),
                      Text(
                        "Witch House",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
    }),
  ),
);
