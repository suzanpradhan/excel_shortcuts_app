import 'package:flutter/material.dart';
import 'shortcut.dart';
import 'shortcutCard.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Shortcut> shortcuts = [
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Two One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
    Shortcut(text: 'Three One One One One One One One One'),
  ];

  static Color background = Color(0xff000000);
  static Color decorationColor = Color(0xff0D0D0D);
  static Color appBarColor = Color(0xffFF6633);
  static Color white = Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      // appBar:
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            AppBar(
              title: Text('App'),
              centerTitle: true,
              backgroundColor: appBarColor,
              elevation: 0,
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      // handle the press
                    },
                    color: background)
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: decorationColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24))),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: shortcuts.length,
                  itemBuilder: (BuildContext cotext, int index) {
                    return ShortcutCard(shortcut: shortcuts[index]);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
