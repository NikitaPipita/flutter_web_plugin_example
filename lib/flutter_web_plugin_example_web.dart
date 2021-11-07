@JS()
library callable_function;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('jsOnEvent')
external set _jsOnEvent(void Function(dynamic event) f);

@JS()
external dynamic jsInvokeMethod(String method, String? params);

class FlutterWebPluginExampleWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'flutter_web_plugin_example',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = FlutterWebPluginExampleWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);

    //Sets the call from JavaScript handler
    _jsOnEvent = allowInterop((dynamic event) {
      //Process JavaScript call here
      debugPrint(event);
    });
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'sendMethodMessage':
        return sendMethodMessage(call.method, call.arguments);
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details:
              'flutter_web_plugin_example for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  static Future<dynamic> sendMethodMessage(
      String method, String? arguments) async {
    final dynamic response =
        await promiseToFuture(jsInvokeMethod(method, arguments));
    return response;
  }
}
