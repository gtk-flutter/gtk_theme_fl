import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Flgtk {
  static const MethodChannel _channel = MethodChannel('flgtk');

  static Future<dynamic> getThemeData() async {
    final Map<Object?, Object?>? data =
        await _channel.invokeMethod('getThemeData');
    debugPrint(data.toString());

    return data;
  }
}
