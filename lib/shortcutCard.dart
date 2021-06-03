import 'package:flutter/material.dart';
import 'shortcut.dart';
import 'package:excel_shortcuts_app/shortcutIcon.dart';

class ShortcutCard extends StatelessWidget {
  final Shortcut shortcut;
  static Color containerText = Color(0xffbfbfbf);
  static Color containerBackground = Color(0xff242424);
  ShortcutCard({required this.shortcut});

  List<String> string = ['Ctrl', 'A'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      // height: MediaQuery.of(context).copyWith().size.height,
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      color: containerBackground,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              shortcut.text,
              style: TextStyle(fontSize: 18, color: containerText),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: string.length,
                itemBuilder: (BuildContext cotext, int index) {
                  return ShortcutIcon(text: string[index]);
                })
          ],
        ),
      ),
    );
  }
}
