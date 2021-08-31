import 'package:flutter/material.dart';
import 'package:nightly/views/homepage.dart';

class HomePageDrawer extends StatelessWidget {
  final nightlyGif = new Image.asset('assets/images/anim_cropped.gif');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'NIGHTLY',
              style: TextStyle(
                fontSize: 45.0,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.yellow,
              ),
            )),
        body: HomePage(),
        drawer: Container(
          width: 200,
          // color: Colors.black,
          child: Drawer(
            // elevation: 1.5,
            child: Container(
                color: Colors.black,
                child: Column(children: <Widget>[
                  DrawerHeader(
                    // decoration: BoxDecoration(
                    //   color: Colors.black,
                    // ),
                    child: nightlyGif,
                  ),
                  Expanded(
                      child: Column(
                    // padding: EdgeInsets.zero,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.add,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          'New Invite',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.drafts_outlined,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          'Drafts',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.group,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          'Groups',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          'Settings',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                    ],
                  )),
                  Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Built with 💛 by",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.grey),
                          ),
                          Text(
                            "Nightly Team",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Terms | Privacy Policy",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.grey),
                          ),
                        ],
                      )),
                ])),
          ),
        ));
  }
}
