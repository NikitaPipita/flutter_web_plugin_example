import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_plugin_example/flutter_web_plugin_example.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_web_plugin_example');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'Response from JS';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('sendMethodMessage', () async {
    expect(await FlutterWebPluginExample.sendMethodMessage(null),
        'Response from JS');
  });
}
