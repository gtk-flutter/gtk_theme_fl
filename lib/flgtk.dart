// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class GtkThemeData {
  static const MethodChannel _channel = MethodChannel('flgtk');

  String? name;
  int? theme_fg_color;
  int? theme_text_color;
  int? theme_bg_color;
  int? theme_base_color;
  int? theme_selected_bg_color;
  int? theme_selected_fg_color;

  int? warning_color;
  int? error_color;
  int? success_color;

  GtkThemeData(
      {required this.name,
      this.theme_fg_color,
      this.theme_text_color,
      this.theme_bg_color,
      this.theme_base_color,
      this.theme_selected_bg_color,
      this.theme_selected_fg_color,
      this.warning_color,
      this.error_color,
      this.success_color});

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
    );
  }
}
