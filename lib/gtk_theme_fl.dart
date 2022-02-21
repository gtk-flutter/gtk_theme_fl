// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GtkThemeData {
  static const MethodChannel _channel = MethodChannel('gtk_theme_fl');

  /// Name of the current GTK Theme.
  String name;

  /// Foreground Color, usually for text.
  int theme_fg_color;

  /// Text Color.
  int theme_text_color;

  /// Main BG Color.
  int theme_bg_color;

  /// Main Base Color.
  int theme_base_color;

  /// Main Selected BG Color.
  int theme_selected_bg_color;

  /// Main selected FG Color.
  int theme_selected_fg_color;

  /// Usually orange / yellow on most themes
  int warning_color;

  /// Usually red on most themes
  int error_color;

  /// Usually blue / green on most themes
  int success_color;

  /// Current font with size, might need parsing
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
  });

  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: Color(theme_base_color),
      );

  /// Returns the raw json data from gtk
  static Future<Map<Object?, Object?>> _getRawData() async {
    return await _channel.invokeMethod('getThemeData');
  }

  /// Initialize a [GtkThemeData] object with the current theme data.
  static Future<GtkThemeData> initialize() async {
    var data = await _getRawData();

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
    );
  }
}
