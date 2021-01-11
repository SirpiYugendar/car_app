import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ListApper());
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
              borderSide: BorderSide(
                color: Colors.red,
                width: 0.5,
              ),
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
                child: Text('Cls', style: GoogleFonts.pacifico()))
          ],
        ),
      ),
    );
  }
}

/*
! This is the sample code for RawMaterial Button.
*/
class RawApper extends StatelessWidget {
  const RawApper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                constraints: BoxConstraints(minHeight: 100, minWidth: 100),
                onPressed: () => {},
                shape: CircleBorder(),
                fillColor: Colors.redAccent,
                elevation: 3,
                child: Text(
                  'Sirpi',
                  style: GoogleFonts.pacifico().copyWith(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlexApper extends StatefulWidget {
  FlexApper({Key key}) : super(key: key);

  @override
  _FlexApperState createState() => _FlexApperState();
}

class _FlexApperState extends State<FlexApper> {
  Icon rotateIcon = Icon(Icons.rotate_right);
  List<MainAxisAlignment> _alignment = [
    MainAxisAlignment.start,
    MainAxisAlignment.end,
    MainAxisAlignment.center,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
  ];
  List<String> _alignmentsText = [
    'Start',
    'End',
    'Center',
    'Space Around',
    'Space Between',
    'Space Evenly'
  ];
  bool _vertical = true;
  int _alignmentIndex = 0;
  RawMaterialButton redButton = RawMaterialButton(
    onPressed: () => {},
    elevation: 2,
    fillColor: Colors.red,
  );
  RawMaterialButton greenButton = RawMaterialButton(
    onPressed: () => {},
    elevation: 2,
    fillColor: Colors.green,
  );
  RawMaterialButton blueButton = RawMaterialButton(
    onPressed: () => {},
    elevation: 2,
    fillColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flex',
            style: GoogleFonts.pacifico().copyWith(fontSize: 30),
          ),
          actions: <Widget>[
            IconButton(
              icon: rotateIcon,
              tooltip: 'Direction',
              onPressed: () {
                setState(() {
                  _vertical = !_vertical;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(_vertical ? 'Vertical' : "Horizontal", style: GoogleFonts.pacifico(),),
            ),
            IconButton(
              icon: Icon(
                Icons.aspect_ratio,
              ),
              tooltip: 'Main Axis',
              onPressed: () {
                setState(() {
                  _alignmentIndex++;
                  if (_alignmentIndex >= _alignment.length) {
                    _alignmentIndex = 0;
                  }
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(_alignmentsText[_alignmentIndex], style: GoogleFonts.pacifico(),),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
        body: Flex(
          direction: _vertical ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: _alignment[_alignmentIndex],
          children: <Widget>[
            redButton,
            greenButton,
            blueButton
          ],
        )
      ),
    );
  }
}
class ListApper extends StatelessWidget {
  const ListApper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('ListView', style: GoogleFonts.pacifico().copyWith(fontSize: 30),)),
        ),
            body: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(width: 150, color: Colors.redAccent,),
              Container(width: 150, color: Colors.greenAccent,),
              Container(width: 150, color: Colors.blueAccent,),
              Container(width: 150, color: Colors.yellowAccent,),
              Container(width: 150, color: Colors.purpleAccent,),
              Container(width: 150, color: Colors.pinkAccent,),
              Container(width: 150, color: Colors.black,),
              Container(width: 150, color: Colors.redAccent,),
              Container(width: 150, color: Colors.greenAccent,),
              Container(width: 150, color: Colors.blueAccent,),
              Container(width: 150, color: Colors.yellowAccent,),
              Container(width: 150, color: Colors.purpleAccent,),
              Container(width: 150, color: Colors.pinkAccent,),
              Container(width: 150, color: Colors.black,),
            ],
          ),
        ),
      ),
    );
  }
}
