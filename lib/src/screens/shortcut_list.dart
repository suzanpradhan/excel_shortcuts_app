import 'package:excel_shortcuts_app/blocs/bloc/shortcutdata_bloc.dart';
import 'package:excel_shortcuts_app/models/link.dart';
import 'package:excel_shortcuts_app/src/screens/settings_screen.dart';
import 'package:excel_shortcuts_app/src/widgets/shortcutCard.dart';
import 'package:excel_shortcuts_app/utils/constants/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShortcutList extends StatefulWidget {
  final Link collectionLink;
  const ShortcutList({Key? key, required this.collectionLink})
      : super(key: key);

  @override
  _ShortcutListState createState() => _ShortcutListState();
}

class _ShortcutListState extends State<ShortcutList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShortcutdataBloc()
          ..add(RequestSpecificShortcutDatas(
              collectionID: widget.collectionLink.id)),
        child: Scaffold(
          backgroundColor: CustomColors.accentOrange,
          appBar: AppBar(
            title: Text(
              'Excel Shortcuts',
              style: TextStyle(
                  fontFamily: "GilroyBold",
                  color: CustomColors.cardColor,
                  fontSize: 16),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: CustomColors.cardColor),
            centerTitle: true,
            backgroundColor: CustomColors.accentOrange,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => SettingsScreen()));
                  },
                  color: CustomColors.cardColor)
            ],
          ),
          body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.only(top: 3),
              decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 24, left: 20, bottom: 14, right: 24),
                            child: Text(
                              widget.collectionLink.displayName,
                              style: TextStyle(
                                  color: CustomColors.white,
                                  fontFamily: "GilroyBold",
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<ShortcutdataBloc, ShortcutdataState>(
                      builder: (context, state) {
                        if (state is ShortcutDataLoaded) {
                          return ListView.builder(
                              padding: EdgeInsets.only(bottom: 20),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.shorcutsListOfDatas.length,
                              itemBuilder: (BuildContext cotext, int index) {
                                return ShortcutCard(
                                    name: state.shorcutsListOfDatas[index].name,
                                    shortcut: state
                                        .shorcutsListOfDatas[index].shortcut);
                              });
                        } else if (state is ShortcutDataLoading) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  "Loading",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        } else if (state is ShortcutDataLoadFailed) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  state.message,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  "Loading",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              )),
        ));
  }
}
