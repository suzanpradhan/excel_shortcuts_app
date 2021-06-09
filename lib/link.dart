import 'package:cloud_firestore/cloud_firestore.dart';

class Link {
  String displayName;
  String id;
  Link({required this.displayName, required this.id});

  factory Link.fromDbtoModel(DocumentSnapshot data) {
    return Link(displayName: data["displayName"], id: data["id"]);
  }
}
