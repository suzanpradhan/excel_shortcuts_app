import 'package:flutter/material.dart';
import 'shortcut.dart';

class ShortcutCard extends StatelessWidget {
  final Shortcut shortcut;

  ShortcutCard({required this.shortcut});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              shortcut.text,
              style: TextStyle(fontSize: 18, color: Colors.grey[200]),
            ),
          ],
        ),
      ),
    );
  }
}
