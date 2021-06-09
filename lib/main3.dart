import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_shortcuts_app/linkCard.dart';
import 'package:excel_shortcuts_app/shortcutIcon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/displaynamebloc_bloc.dart';
import 'shortcut.dart';
import 'shortcutCard.dart';

class MyHomePage3 extends StatefulWidget {
  @override
  _MyHomePage3State createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  static Color background = Color(0xff000000);
  static Color decorationColor = Color(0xff0D0D0D);
  static Color appBarColor = Color(0xffFF6633);
  static Color white = Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DisplaynameblocBloc()
          ..add(RequestSpecificLinks(collectionID: "excel_shortcut")),
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
                          color: background)
                    ],
                  ),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24))),
                        child: BlocBuilder<DisplaynameblocBloc,
                            DisplaynameblocState>(
                          builder: (context, state) {
                            if (state is DisplaynameblocLoaded) {
                              return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.linkListOfDatas.length,
                                  itemBuilder:
                                      (BuildContext cotext, int index) {
                                    return LinkCard(
                                      displayName: state
                                          .linkListOfDatas[index].displayName,
                                      id: state.linkListOfDatas[index].id,
                                    );
                                  });
                            } else if (state is DisplaynameblocLoading) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Loading",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              );
                            } else if (state is DisplaynameblocFailed) {
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
