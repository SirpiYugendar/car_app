import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(StackClass());
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
                child: Text(
                  _vertical ? 'Vertical' : "Horizontal",
                  style: GoogleFonts.pacifico(),
                ),
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
                child: Text(
                  _alignmentsText[_alignmentIndex],
                  style: GoogleFonts.pacifico(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
          body: Flex(
            direction: _vertical ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: _alignment[_alignmentIndex],
            children: <Widget>[redButton, greenButton, blueButton],
          )),
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
          title: Center(
              child: Text(
            'ListView',
            style: GoogleFonts.pacifico().copyWith(fontSize: 30),
          )),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 150,
                color: Colors.redAccent,
              ),
              Container(
                width: 150,
                color: Colors.greenAccent,
              ),
              Container(
                width: 150,
                color: Colors.blueAccent,
              ),
              Container(
                width: 150,
                color: Colors.yellowAccent,
              ),
              Container(
                width: 150,
                color: Colors.purpleAccent,
              ),
              Container(
                width: 150,
                color: Colors.pinkAccent,
              ),
              Container(
                width: 150,
                color: Colors.black,
              ),
              Container(
                width: 150,
                color: Colors.redAccent,
              ),
              Container(
                width: 150,
                color: Colors.greenAccent,
              ),
              Container(
                width: 150,
                color: Colors.blueAccent,
              ),
              Container(
                width: 150,
                color: Colors.yellowAccent,
              ),
              Container(
                width: 150,
                color: Colors.purpleAccent,
              ),
              Container(
                width: 150,
                color: Colors.pinkAccent,
              ),
              Container(
                width: 150,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileApper extends StatefulWidget {
  ListTileApper({Key key}) : super(key: key);

  @override
  _ListTileApperState createState() => _ListTileApperState();
}

class _ListTileApperState extends State<ListTileApper> {
  int _selectedIndex = 0;
  static const TEXT_STYLE_NORMAL = TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal);
  static const TEXT_STYLE_SELECTED =
      TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  final TextFormField _fontsTextField = TextFormField(
    decoration: InputDecoration(
        icon: Icon(Icons.format_size),
        hintText: 'FontSize',
        labelText: 'Enter the Font Size'),
  );
  final TextFormField _historyTextField = TextFormField(
    decoration: InputDecoration(
        icon: Icon(Icons.history),
        hintText: 'number of days',
        labelText: 'Enter Number of days'),
  );
  final TextFormField _languageTextField = TextFormField(
    decoration: InputDecoration(
        icon: Icon(Icons.language),
        hintText: 'Tamil or English',
        labelText: 'Enter your Language'),
  );
  select(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ListTile accesibilityListTile = ListTile(
      leading: Icon(Icons.accessibility),
      title: Text(
        'Accessibility',
        style: _selectedIndex == 0 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: Text('Accesibility Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(0),
    );
    final ListTile historyListTile = ListTile(
      leading: Icon(Icons.accessibility),
      title: Text(
        'History',
        style: _selectedIndex == 1 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: Text('History Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(1),
    );
    final ListTile languageListTile = ListTile(
      leading: Icon(Icons.accessibility),
      title: Text(
        'Language',
        style: _selectedIndex == 2 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: Text('Language Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(2),
    );
    final String selectionTitle = (_selectedIndex == 0
            ? 'Accestibility'
            : _selectedIndex == 1
                ? 'History'
                : 'Language') +
        'Settings';
    final TextFormField selectionFormField = _selectedIndex == 0
        ? _fontsTextField
        : _selectedIndex == 1
            ? _historyTextField
            : _languageTextField;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          'ListTile',
          style: GoogleFonts.pacifico().copyWith(fontSize: 30),
        )),
        body: ListView(
          children: <Widget>[
            accesibilityListTile,
            historyListTile,
            languageListTile
          ],
        ),
        bottomSheet: Container(
          color: Color(0xFFCFC8F5),
          padding: EdgeInsets.all(10),
          child: Container(
              constraints: BoxConstraints(maxHeight: 200),
              child: Column(
                children: <Widget>[
                  Icon(Icons.settings),
                  Text(selectionTitle),
                  Expanded(child: selectionFormField)
                ],
              )),
        ),
      ),
    );
  }
}

class StackClass extends StatefulWidget {
  StackClass({Key key}) : super(key: key);
  final PleaseWaitWidget _pleaseWaitWidget =
      PleaseWaitWidget(key: ObjectKey('pleaseWaitWidget'));
  final AppWidget _appWidget = AppWidget(key: ObjectKey('appWidget'));
  final ColorWidget _colorWidget = ColorWidget(
    key: ObjectKey('colorWidget'),
  );
  @override
  _StackClassState createState() => _StackClassState();
}

class _StackClassState extends State<StackClass> {
  bool _pleaseWaitValue = false;

  void _togglePleaseWait() {
    /*
    ? set state notifies the framework that the internal state of the object state
    ? is changed which schedules the build method for that current state.
    */
    setState(() {
      _pleaseWaitValue = !_pleaseWaitValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childWidget = _pleaseWaitValue
        ? [widget._colorWidget, widget._pleaseWaitWidget]
        : [widget._appWidget];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
            title: Center(
          child: Text(
            'StackApp',
            style: GoogleFonts.pacifico().copyWith(fontSize: 30, color: Colors.black),
          ),
        )),
        body: Center(
          child: Stack(
            key: ObjectKey('stack'),
            children: childWidget,
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _togglePleaseWait,
          backgroundColor: Colors.black12,
          label: Text('Please Wait on / off', style: GoogleFonts.pacifico().copyWith(fontSize: 15, color: Colors.black),),
          icon: Icon(Icons.cached, color: Colors.black),
        ),
      ),
    );
  }
}

class PleaseWaitWidget extends StatelessWidget {
  const PleaseWaitWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      ),
      color: Colors.grey.withOpacity(0.3),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Your',
            style: GoogleFonts.pacifico().copyWith(fontSize: 20, color: Colors.greenAccent),
          ),
          Text(
            'App',
            style: GoogleFonts.pacifico().copyWith(fontSize: 20, color: Colors.greenAccent),
          ),
          Text(
            'Goes',
            style: GoogleFonts.pacifico().copyWith(fontSize: 20, color: Colors.greenAccent),
          ),
          Text(
            'Here',
            style: GoogleFonts.pacifico().copyWith(fontSize: 20, color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  const ColorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Sirpi', style: GoogleFonts.pacifico().copyWith(fontSize: 20, color: Colors.greenAccent),)),
    );
  }
}