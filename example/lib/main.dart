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
      theme: themeData.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(themeData.buttonThemeData.checked_bg),
                /* onPrimary: Color(themeData.buttonThemeData.selected_bg), */
              ),
              onPressed: () async {
                initPlatformState();
              },
              child: const Text("Bruh")),
        ),
      ),
    );
  }
}
