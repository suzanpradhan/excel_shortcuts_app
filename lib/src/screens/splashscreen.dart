import 'dart:async';

import 'package:excel_shortcuts_app/src/screens/homepage.dart';
import 'package:excel_shortcuts_app/utils/constants/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.signInAnonymously();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (BuildContext context) => HomePage()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcccccc),
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Excel Shortcuts",
              style: TextStyle(
                  fontFamily: "GilroyBold",
                  fontSize: 24,
                  color: CustomColors.cardColor),
            )
          ],
        ),
      )),
    );
  }
}
