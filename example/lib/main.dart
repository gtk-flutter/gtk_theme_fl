import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
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
  int? color = 0xff000000;
  int? fg = 0xffff0000;

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    color = (await Flgtk.platformVersion)['theme_bg_color'] as int;
    fg = (await Flgtk.platformVersion)['theme_selected_bg_color'] as int;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(color ?? 0),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(fg ?? 0xffff0000)),
              onPressed: () async {
                initPlatformState();
              },
              child: const Text("Bruh")),
        ),
      ),
    );
  }
}
