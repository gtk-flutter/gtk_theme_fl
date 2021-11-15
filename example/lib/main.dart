import 'package:flgtk_example/ColorBox.dart';
import 'package:flgtk_example/common_colors_row.dart';
import 'package:flgtk_example/exported_colors_row.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flgtk/flgtk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GtkThemeData themeData = GtkThemeData(name: "Default");

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    themeData = await GtkThemeData.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonColorsRow(themeData: themeData),
              ExportedColorsRow(themeData: themeData),
            ],
          ),
        ),
      ),
    );
  }
}
