import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Flgtk {
  static const MethodChannel _channel = MethodChannel('flgtk');

  static Future<dynamic> get platformVersion async {
    final Map<Object?, Object?>? version =
        await _channel.invokeMethod('getPlatformVersion');
    debugPrint(version.toString());

    return version;
  }
}
