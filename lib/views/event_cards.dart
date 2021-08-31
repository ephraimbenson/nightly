import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class EventCards extends StatelessWidget {
  final String header;
  const EventCards(this.header);

  static const headerTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.yellow);
  static const cardTextStyleHeader = TextStyle(
      color: Colors.yellow, decoration: TextDecoration.underline, fontSize: 20);
  static const cardTextStyleBody = TextStyle(color: Colors.yellow);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            header, // passed in constructor
            style: headerTextStyle,
          ),
          Card(
              shape: new RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.yellow, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0)),
              color: Colors.black38,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "sandWITCH Party",
                          style: cardTextStyleHeader,
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.alternate_email, color: Colors.yellow),
                            Text(
                              " 10:30 pm - 1 am",
                              style: cardTextStyleBody,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.home_outlined, color: Colors.yellow),
                            Text(
                              " witch house",
                              style: cardTextStyleBody,
                            ),
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.people_outline,
                          color: Colors.yellow,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Platform.isIOS
                              ? Icons.ios_share
                              : Icons.share_outlined,
                          color: Colors.yellow,
                          size: 40,
                        )),
                  ],
                )),
              ))
        ]));
  }
}
