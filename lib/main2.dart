import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_shortcuts_app/blocs/bloc/shortcutdata_bloc.dart';
import 'package:excel_shortcuts_app/shortcutIcon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shortcut.dart';
import 'shortcutCard.dart';

class MyHomePage2 extends StatefulWidget {
  final String collection;

  const MyHomePage2({Key? key, required this.collection}) : super(key: key);
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  static Color background = Color(0xff000000);
  static Color decorationColor = Color(0xff0D0D0D);
  static Color appBarColor = Color(0xffFF6633);
  static Color white = Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShortcutdataBloc()
          ..add(RequestSpecificShortcutDatas(collectionID: widget.collection)),
        child: Scaffold(
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
                          color: Colors.grey[900])
                    ],
                  ),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24))),
                        child: BlocBuilder<ShortcutdataBloc, ShortcutdataState>(
                          builder: (context, state) {
                            if (state is ShortcutDataLoaded) {
                              return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.shorcutsListOfDatas.length,
                                  itemBuilder:
                                      (BuildContext cotext, int index) {
                                    return ShortcutCard(
                                        name: state
                                            .shorcutsListOfDatas[index].name,
                                        shortcut: state
                                            .shorcutsListOfDatas[index]
                                            .shortcut);
                                  });
                            } else if (state is ShortcutDataLoading) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Loading",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              );
                            } else if (state is ShortcutDataLoadFailed) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.message,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              );
                            } else {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Loading",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              );
                            }
                          },
                        )),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
