import 'package:flutter/material.dart';
import 'shortcut.dart';

class ShortcutCard extends StatelessWidget {
  final String shortcut;
  static Color containerText = Color(0xffbfbfbf);
  static Color containerBackground = Color(0xff242424);
  ShortcutCard({required this.shortcut});

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
              shortcut,
              style: TextStyle(fontSize: 18, color: Colors.grey[200]),
            ),
          ],
        ),
      ),
    );
  }
}
