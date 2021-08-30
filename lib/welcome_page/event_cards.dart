import 'package:flutter/material.dart';

//TODO: data object for generating cards

class EventCards extends StatelessWidget {
  final String header;
  const EventCards(this.header);
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
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.black54,
              // color: Colors.blue[(8 - index) * 100],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: new Container(
                  width: double.infinity,
                  height: 75.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "sandWitch Party",
                        style: TextStyle(
                            color: Colors.yellow,
                            decoration: TextDecoration.underline),
                      ),
                      Row(
                        children: [
                          Icon(Icons.alternate_email, color: Colors.yellow),
                          Text(
                            "10:30 pm - 1 am",
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.home, color: Colors.yellow),
                          Text(
                            "Witch House",
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ]));
  }
}
