import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nightly/views/homepage_drawer.dart';
import 'widgets.dart';

const intro_text = 'Welcome to Nightly';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: Colors.yellow),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/anim_cropped.gif'),
            SizedBox(
              height: 50,
            ),
            CreateInviteButton(),
            SizedBox(
              height: 25,
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
