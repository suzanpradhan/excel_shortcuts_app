import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_shortcuts_app/main2.dart';
import 'package:excel_shortcuts_app/shortcutIcon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'shortcut.dart';
import 'shortcutCard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyHomePage2()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          child: Container(
            height: MediaQuery.of(context).size.height,
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: decorationColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24))),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('general')
                          .snapshots(),
                      builder: (context, stream) {
                        if (stream.hasError) {
                          return Text('Something went wrong');
                        }

                        if (stream.connectionState == ConnectionState.waiting) {
                          return Text(
                            "Loading",
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        QuerySnapshot querySnapshot = stream.data!;
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: querySnapshot.size,
                            itemBuilder: (BuildContext cotext, int index) {
                              return ShortcutCard(
                                  name: querySnapshot.docs[index]['name'],
                                  shortcut: querySnapshot.docs[index]
                                      ['shortcut']);
                            });
                      }),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
