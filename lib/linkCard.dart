import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(8), color: containerBackground),
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              displayName,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              id,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
