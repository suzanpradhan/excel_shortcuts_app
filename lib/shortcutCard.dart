import 'package:flutter/material.dart';
import 'shortcut.dart';

class ShortcutCard extends StatelessWidget {
  final String shortcut;
  final String name;
  static Color containerText = Color(0xffbfbfbf);
  static Color containerBackground = Color(0xff0D0D0D);
  ShortcutCard({required this.shortcut, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).copyWith().size.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: containerBackground),
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              shortcut,
              style: TextStyle(fontSize: 14, color: Colors.grey[200]),
            ),
          ],
        ),
      ),
    );
  }
}
