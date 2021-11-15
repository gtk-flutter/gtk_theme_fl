// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GtkButtonThemeData {
  final int normal_bg;
  final int normal_fg;

  final int active_bg;
  final int active_fg;

  final int prelight_bg;
  final int prelight_fg;

  final int selected_bg;
  final int selected_fg;

  final int focused_bg;
  final int focused_fg;

  final int checked_bg;
  final int checked_fg;

  const GtkButtonThemeData({
    required this.normal_bg,
    required this.normal_fg,
    required this.active_bg,
    required this.active_fg,
    required this.prelight_bg,
    required this.prelight_fg,
    required this.selected_bg,
    required this.selected_fg,
    required this.focused_bg,
    required this.focused_fg,
    required this.checked_bg,
    required this.checked_fg,
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
      normal_fg: 0xff,
      active_bg: 0xff,
      active_fg: 0xff,
      prelight_bg: 0xff,
      prelight_fg: 0xff,
      selected_bg: 0xff,
      selected_fg: 0xff,
      focused_bg: 0xff,
      focused_fg: 0xff,
      checked_bg: 0xff,
      checked_fg: 0xff,
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
        normal_fg: (data["button"]! as Map)["normal_fg"],
        active_bg: (data["button"]! as Map)["active_bg"],
        active_fg: (data["button"]! as Map)["active_fg"],
        prelight_bg: (data["button"]! as Map)["prelight_bg"],
        prelight_fg: (data["button"]! as Map)["prelight_fg"],
        selected_bg: (data["button"]! as Map)["selected_bg"],
        selected_fg: (data["button"]! as Map)["selected_fg"],
        focused_bg: (data["button"]! as Map)["focused_bg"],
        focused_fg: (data["button"]! as Map)["focused_fg"],
        checked_bg: (data["button"]! as Map)["checked_bg"],
        checked_fg: (data["button"]! as Map)["checked_fg"],
      ),
    );
  }
}
