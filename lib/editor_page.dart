import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: EditorPage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class EditorPage extends StatefulWidget {
  EditorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  @override
  Widget build(BuildContext context) {
    QuillController _controller = QuillController.basic();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            QuillToolbar.basic(controller: _controller),
          ],
        ),
      ),
    );
  }
}
