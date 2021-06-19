import 'package:excel_shortcuts_app/utils/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class ShortcutCard extends StatelessWidget {
  final String shortcut;
  final String name;
  ShortcutCard({required this.shortcut, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.cardColor),
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: "GilroyLight"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.end,
                direction: Axis.horizontal,
                runSpacing: 5,
                children: shortcut
                    .split(" ")
                    .map((e) => (e != "+")
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CustomColors.cardShade),
                            child: Text(
                              e,
                              style: TextStyle(
                                  fontFamily: "GilroyLight",
                                  fontSize: 12,
                                  color: CustomColors.white),
                            ))
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "+",
                              style: TextStyle(color: CustomColors.white),
                            ),
                          ))
                    .toList(),
              ),
            )
          ]),
    );
  }
}
