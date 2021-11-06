
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterWebPluginExample {
  static const MethodChannel _channel = MethodChannel('flutter_web_plugin_example');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
