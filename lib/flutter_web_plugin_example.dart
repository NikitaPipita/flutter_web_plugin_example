import 'dart:async';

import 'package:flutter/services.dart';

class FlutterWebPluginExample {
  static const MethodChannel _channel =
      MethodChannel('flutter_web_plugin_example');

  static Future<dynamic> sendMethodMessage(String? arguments) async {
    final dynamic response =
        await _channel.invokeMethod('sendMethodMessage', arguments);
    return response;
  }
}
