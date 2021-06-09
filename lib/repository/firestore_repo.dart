import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_shortcuts_app/link.dart';
import 'package:excel_shortcuts_app/shortcut.dart';

class FirestoreRepo {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Link>> loadAllCollection({required String collectionID}) async {
    try {
      print("userID");
      QuerySnapshot<Map<String, dynamic>> data = await _firebaseFirestore
          .collection('collectionID')
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
      print("userID");
      QuerySnapshot<Map<String, dynamic>> data = await _firebaseFirestore
          .collection(collectionID)
          .get()
          .catchError((error) {
        print(error.toString());
      });
      List<Shortcut> dataModels =
          data.docs.map((doc) => Shortcut.fromDbtoModel(doc)).toList();
      return dataModels;
    } catch (e) {
      return Future.error("Cant't load Datas.");
    }
  }
}
