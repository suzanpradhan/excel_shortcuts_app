import 'package:cloud_firestore/cloud_firestore.dart';

class Shortcut {
  String name;
  String shortcut;
  Shortcut({required this.name, required this.shortcut});

  factory Shortcut.fromDbtoModel(DocumentSnapshot data) {
    return Shortcut(name: data["name"], shortcut: data["shortcut"]);
  }
}
