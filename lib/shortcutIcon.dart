import 'package:flutter/material.dart';

class ShortcutIcon extends StatelessWidget {
  final String text;
  static Color containerText = Color(0xffbfbfbf);
  static Color containerBackground = Color(0xff242424);
  ShortcutIcon({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      color: Colors.lime,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18, color: containerText),
            ),
          ],
        ),
      ),
    );
  }
}
