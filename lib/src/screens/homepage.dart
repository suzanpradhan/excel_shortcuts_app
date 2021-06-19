import 'package:excel_shortcuts_app/bloc/displaynamebloc_bloc.dart';
import 'package:excel_shortcuts_app/src/screens/settings_screen.dart';
import 'package:excel_shortcuts_app/src/widgets/category_widget.dart';
import 'package:excel_shortcuts_app/utils/constants/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DisplaynameblocBloc()
          ..add(RequestSpecificLinks(collectionID: "excel_shortcut")),
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
            leadingWidth: 80,
            leading: Container(
              margin: EdgeInsets.only(left: 18),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"))),
            ),
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
                                top: 24, bottom: 14, left: 20, right: 20),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                  color: CustomColors.white,
                                  fontFamily: "GilroyBold",
                                  fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<DisplaynameblocBloc, DisplaynameblocState>(
                      builder: (context, state) {
                        if (state is DisplaynameblocLoaded) {
                          return ListView.builder(
                              padding: EdgeInsets.only(bottom: 20),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.linkListOfDatas.length,
                              itemBuilder: (BuildContext cotext, int index) {
                                return CategoriesCard(
                                  displayName:
                                      state.linkListOfDatas[index].displayName,
                                  id: state.linkListOfDatas[index].id,
                                );
                              });
                        } else if (state is DisplaynameblocLoading) {
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
                        } else if (state is DisplaynameblocFailed) {
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
