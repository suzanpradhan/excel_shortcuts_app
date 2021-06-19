import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_shortcuts_app/models/link.dart';
import 'package:excel_shortcuts_app/models/shortcut.dart';

class FirestoreRepo {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Link>> loadAllCollection({required String collectionID}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await _firebaseFirestore
          .collection(collectionID)
          .get()
          .catchError((error) {
        print(error.toString());
      });
      List<Link> dataModels =
          data.docs.map((doc) => Link.fromDbtoModel(doc)).toList();
      return dataModels;
    } catch (e) {
      return Future.error("Cant't load Datas.");
    }
  }

  Future<List<Shortcut>> loadAllShortcuts(
      {required String collectionID}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await _firebaseFirestore
          .collection(collectionID)
          .get()
          .catchError((error) {
        print(error.toString());
      });
      print(data.docs);

      List<Shortcut> dataModels =
          data.docs.map((doc) => Shortcut.fromDbtoModel(doc)).toList();

      return dataModels;
    } catch (e) {
      return Future.error("Cant't load Datas.");
    }
  }

  Future<int> getShortcutsNumber({required String collectionID}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await _firebaseFirestore
          .collection(collectionID)
          .get()
          .catchError((error) {
        print(error.toString());
      });
      int number = data.docs.length;
      return number;
    } catch (e) {
      return 0;
    }
  }
}
