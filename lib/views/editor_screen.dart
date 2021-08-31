import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class EditorScreen extends StatefulWidget {
  EditorScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _EditorScreenState createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    QuillController _controller = QuillController.basic();

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.yellow,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.yellow),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: QuillEditor.basic(
                  controller: _controller,
                  readOnly: false, // true for view only mode
                ),
              ),
            ),
            QuillToolbar.basic(
              controller: _controller,
              showCodeBlock: false,
              showVideoButton: false,
              showLink: false,
              showListCheck: false,
              showQuote: false,
            ),
          ],
        ),
      ),
    );
  }
}
