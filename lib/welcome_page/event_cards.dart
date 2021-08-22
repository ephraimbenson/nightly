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
          header,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 100.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: new List.generate(8, (int index) {
              return new Card(
                  color: Colors.black,
                  // color: Colors.blue[(8 - index) * 100],
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
        )
      ]),
    );
  }
}
