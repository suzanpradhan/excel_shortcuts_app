import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:excel_shortcuts_app/src/screens/settings_screens/about_us.dart';
import 'package:excel_shortcuts_app/src/screens/settings_screens/learn_excel.dart';
import 'package:excel_shortcuts_app/src/screens/settings_screens/privacy_policy.dart';
import 'package:excel_shortcuts_app/utils/constants/custom_colors.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  downloadPDF() async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('files/excel-365-shortcut-cheat-sheet.pdf');
      final String url = await ref.getDownloadURL();
      if (await requestPermission()) {
        final String filePath =
            (await getDownloadFilePath())!.split("Android").first + 'Download';
        final savedDir = Directory(filePath);
        bool hasExisted = await savedDir.exists();
        if (!hasExisted) {
          savedDir.create();
        }
        final taskId = await FlutterDownloader.enqueue(
          url: url,
          savedDir: filePath,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              true, // click on notification to open downloaded file (for Android)
        );
        Fluttertoast.showToast(
            msg: "Downloading...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.cardShade,
            textColor: CustomColors.grey,
            fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Download Failed.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: CustomColors.cardShade,
          textColor: CustomColors.grey,
          fontSize: 16.0);
    }
  }

  Future<bool> requestPermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      PermissionStatus requestStatus = await Permission.storage.request();
      if (requestStatus.isDenied) {
        return requestPermission();
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  Future<String?> getDownloadFilePath() async {
    // final platform = Theme.of(context).platform;
    final directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  void initState() {
    super.initState();

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
              fontFamily: "GilroyBold",
              color: CustomColors.cardColor,
              fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: CustomColors.cardColor),
        backgroundColor: CustomColors.accentOrange,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                onTap: () {
                  downloadPDF();
                },
                leading: Icon(
                  EvaIcons.download,
                  color: CustomColors.accentOrange,
                ),
                minLeadingWidth: 0,
                title: Text(
                  "Download PDF Version",
                  style: TextStyle(
                      fontFamily: "GilroyLight",
                      fontSize: 16,
                      color: CustomColors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => LearnExcel()));
                },
                leading: Icon(
                  EvaIcons.bulb,
                  color: CustomColors.accentOrange,
                ),
                minLeadingWidth: 0,
                title: Text(
                  "Learn Excel",
                  style: TextStyle(
                      fontFamily: "GilroyLight",
                      fontSize: 16,
                      color: CustomColors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => PrivacyPolicy()));
                },
                leading: Icon(
                  EvaIcons.lock,
                  color: CustomColors.accentOrange,
                ),
                minLeadingWidth: 0,
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      fontFamily: "GilroyLight",
                      fontSize: 16,
                      color: CustomColors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => AboutUs()));
                },
                leading: Icon(
                  EvaIcons.info,
                  color: CustomColors.accentOrange,
                ),
                minLeadingWidth: 0,
                title: Text(
                  "About Us",
                  style: TextStyle(
                      fontFamily: "GilroyLight",
                      fontSize: 16,
                      color: CustomColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
