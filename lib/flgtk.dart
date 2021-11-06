// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GtkButtonThemeData {
  final int normal_bg;
  final int active_bg;
  final int selected_bg;
  final int focused_bg;
  final int checked_bg;

  const GtkButtonThemeData({
    required this.normal_bg,
    required this.active_bg,
    required this.selected_bg,
    required this.focused_bg,
    required this.checked_bg,
  });
}

class GtkThemeData {
  static const MethodChannel _channel = MethodChannel('flgtk');

  String name;
  int theme_fg_color;
  int theme_text_color;
  int theme_bg_color;
  int theme_base_color;
  int theme_selected_bg_color;
  int theme_selected_fg_color;

  int warning_color;
  int error_color;
  int success_color;

  GtkButtonThemeData buttonThemeData;

  String font;

  GtkThemeData({
    required this.name,
    this.theme_fg_color = 0xff,
    this.theme_text_color = 0xff,
    this.theme_bg_color = 0xff,
    this.theme_base_color = 0xff,
    this.theme_selected_bg_color = 0xff,
    this.theme_selected_fg_color = 0xff,
    this.warning_color = 0xff,
    this.error_color = 0xff,
    this.success_color = 0xff,
    this.font = "",
    this.buttonThemeData = const GtkButtonThemeData(
      normal_bg: 0xff,
      active_bg: 0xff,
      selected_bg: 0xff,
      focused_bg: 0xff,
      checked_bg: 0xff,
    ),
  });

  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: Color(theme_base_color),
      );

  static Future<Map<Object?, Object?>> _getRawData() async {
    return await _channel.invokeMethod('getThemeData');
  }

  static Future<GtkThemeData> initialize() async {
    var data = await _getRawData();
    debugPrint(data.toString());

    return GtkThemeData(
      name: data["name"] as String,
      theme_fg_color: data["theme_fg_color"] as int,
      theme_text_color: data["theme_text_color"] as int,
      theme_bg_color: data["theme_bg_color"] as int,
      theme_base_color: data["theme_base_color"] as int,
      theme_selected_bg_color: data["theme_selected_bg_color"] as int,
      theme_selected_fg_color: data["theme_selected_fg_color"] as int,
      warning_color: data["warning_color"] as int,
      error_color: data["error_color"] as int,
      success_color: data["success_color"] as int,
      font: data["font"] as String,
      buttonThemeData: GtkButtonThemeData(
        normal_bg: (data["button"]! as Map)["normal_bg"],
        active_bg: (data["button"]! as Map)["active_bg"],
        selected_bg: (data["button"]! as Map)["selected_bg"],
        focused_bg: (data["button"]! as Map)["focused_bg"],
        checked_bg: (data["button"]! as Map)["checked_bg"],
      ),
    );
  }
}
