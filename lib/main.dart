import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyButtonApp());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyButtonApp(),
    );
  }
}

class TextBlock {
  final Color _color;
  final String _text;
  TextBlock(this._color, this._text);
  String get text => _text;
  Color get color => _color;
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  final List<TextBlock> textBlocks = [
    TextBlock(Colors.red, 'Sirpi Yugendar'),
    TextBlock(Colors.green, '\nMicrosoft VS code'),
    TextBlock(Colors.yellow, '\nIntelliJ IDEA Keymaps')
  ];
  void _incrementCounter() {
    setState(() {
      if (_index < textBlocks.length) _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> textSpan = List<TextSpan>();
    for (var i = 0; i < _index; i++) {
      TextBlock textBlock = textBlocks[i];
      textSpan.add(TextSpan(
          text: textBlock.text,
          style: TextStyle(color: textBlock.color, fontSize: 32)));
    }
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text.rich(TextSpan(children: textSpan))],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.note_add),
        ));
  }
}

class MyButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
  ! It shows all the different types buttons available in flutter SDK.
    */
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: () => {},
              child: Text(
                'Outline Button',
                style: GoogleFonts.pacifico(),
              ),
              borderSide: BorderSide(color: Colors.red, width: 0.5,),
              splashColor: Colors.redAccent,
            ),
            FlatButton(
                onPressed: () => {debugPrint('Flat Button')},
                child: Text(
                  'Flat Button',
                  style: GoogleFonts.pacifico(),
                )),
            RaisedButton(
              onPressed: () => {},
              child: Text(
                'Raised Button',
                style: GoogleFonts.pacifico(),
              ),
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.phone_bluetooth_speaker_outlined),
            ),
            BackButton(
              onPressed: () => {},
            ),
            CloseButton(
              onPressed: () => {},
              color: Colors.yellow,
            ),
            FloatingActionButton(
              onPressed: () => [],
              child: Text('Cls', style: GoogleFonts.pacifico())
            )
          ],
        ),
      ),
    );
  }
}
