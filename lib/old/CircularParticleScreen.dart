import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CircularParticleScreen extends StatefulWidget {
  const CircularParticleScreen({Key? key}) : super(key: key);

  @override
  State<CircularParticleScreen> createState() => _CircularParticleScreenState();
}

class _CircularParticleScreenState extends State<CircularParticleScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: "https://vincentgarreau.com/particles.js/#default",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
