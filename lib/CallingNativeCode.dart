import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CallingNativeCode extends StatefulWidget {
  const CallingNativeCode({Key? key}) : super(key: key);

  @override
  State<CallingNativeCode> createState() => _CallingNativeCodeState();
}

class _CallingNativeCodeState extends State<CallingNativeCode> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  static const toastPlatform =
      MethodChannel('com.atlas.flutter_playground/toast_channel');

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<void> _showToast() async {
    final result = await toastPlatform.invokeMethod(
      'showToast',
      <String, String>{
        'message':
            'This is a Toast from From Flutter to Android Native Code Yes, It is working'
      },
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
            ElevatedButton(
              child: const Text('Show Toast'),
              onPressed: _showToast,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
