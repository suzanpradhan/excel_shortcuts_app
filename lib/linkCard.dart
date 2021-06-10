import 'package:excel_shortcuts_app/main.dart';
import 'package:excel_shortcuts_app/main2.dart';
import 'package:excel_shortcuts_app/shortcutCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/shortcutdata_bloc.dart';

class LinkCard extends StatelessWidget {
  final String displayName;
  final String id;
  static Color containerText = Color(0xffbfbfbf);
  static Color containerBackground = Color(0xff0D0D0D);
  LinkCard({required this.displayName, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).copyWith().size.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.grey[900]),

      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => MyHomePage2(
                    collection: this.id,
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            displayName,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
