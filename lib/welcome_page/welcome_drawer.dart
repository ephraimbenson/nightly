import 'package:flutter/material.dart';
import 'package:nightly/welcome_page/welcome_page.dart';

class WelcomeDrawer extends StatefulWidget {
  @override
  _WelcomeDrawerState createState() => _WelcomeDrawerState();
}

class _WelcomeDrawerState extends State<WelcomeDrawer> {
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
      body: WelcomePage(),
      drawer: Container(
        width: 200,
        child: Drawer(
          child: Container(
            color: Colors.black,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 150,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: nightlyGif),
                ),
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
                //done
              ],
            ),
          ),
        ),
      ),
    );
  }
}
