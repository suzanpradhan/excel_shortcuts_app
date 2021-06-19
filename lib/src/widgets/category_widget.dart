import 'package:excel_shortcuts_app/models/link.dart';
import 'package:excel_shortcuts_app/repository/firestore_repo.dart';
import 'package:excel_shortcuts_app/src/screens/shortcut_list.dart';
import 'package:excel_shortcuts_app/utils/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class CategoriesCard extends StatefulWidget {
  final String displayName;
  final String id;
  const CategoriesCard({Key? key, required this.displayName, required this.id})
      : super(key: key);

  @override
  _CategoriesCardState createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (BuildContext context, __, ____) => ShortcutList(
                  collectionLink:
                      Link(displayName: widget.displayName, id: widget.id),
                )));
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomColors.cardColor),
            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.displayName,
                  style: TextStyle(
                      fontSize: 16,
                      color: CustomColors.white,
                      fontFamily: "GilroyLight"),
                ),
                SizedBox(
                  height: 14,
                ),
                FutureBuilder(
                    future: FirestoreRepo()
                        .getShortcutsNumber(collectionID: widget.id),
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          "${snapshot.data} shortcuts",
                          style: TextStyle(
                              fontFamily: "GilroyLight",
                              color: CustomColors.grey,
                              fontSize: 14),
                        );
                      } else {
                        return Text(
                          "0 shortcuts",
                          style: TextStyle(
                              fontFamily: "GilroyLight",
                              color: CustomColors.grey,
                              fontSize: 14),
                        );
                      }
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
