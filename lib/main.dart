import 'dart:io';

import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/expandable_fab.dart';
import 'package:flutter_playground/intranet/intranet.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

// void main() => runApp(const CalendarApp());
// void main() => runApp(const MyApp());
// void main()=>runApp(const DatePickerExample());
void main()=>runApp(const Intranet());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CircularParticleScreen(),
      // home: const NavigationDrawerTest(),
      // home: const HttpRequestPage(),
      // home: const AutoGenerateUserImage(),
      // home:const RunHtmlOnFlutter(title: 'Example HTML',),
    );
  }
}

class AutoGenerateUserImage extends StatefulWidget {
  const AutoGenerateUserImage({Key? key}) : super(key: key);

  @override
  _AutoGenerateUserImageState createState() => _AutoGenerateUserImageState();
}

class _AutoGenerateUserImageState extends State<AutoGenerateUserImage> {
  String name = "Sann Chesda";

  @override
  Widget build(BuildContext context) {
    // final SvgParser parser = SvgParser();
    // try {
    //   parser.parse(networkSVG, warningsAsErrors: true);
    //   print('SVG is supported');
    // } catch (e) {
    //   print('SVG contains unsupported features');
    // }
    return Scaffold(
      //Very Import for the key to be unique
      //because flutter will check if widget change or value change
      key: UniqueKey(),
      appBar: AppBar(
        title: const Text("Auto generate user image"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Center(
              child: Avatar(
                name: name,
                onTap: () {
                  setState(() {
                    name = "James Franco";
                  });
                },
                value: name,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    name = "Seth Rogen";
                  });
                },
                child: const Text("Change Name")),
          ],
        ),
      ),
    );
  }
}

class HttpRequestPage extends StatefulWidget {
  const HttpRequestPage({Key? key}) : super(key: key);

  @override
  _HttpRequestPageState createState() => _HttpRequestPageState();
}

class _HttpRequestPageState extends State<HttpRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Making HTTP Request"),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            if (Get.isDarkMode) {
              Get.changeTheme(ThemeData.light());
            } else {
              Get.changeTheme(ThemeData.dark());
            }
          },
          child: Text("Something"),
        ),
      ),
    );
  }
}

class NavigationDrawerTest extends StatefulWidget {
  const NavigationDrawerTest({Key? key}) : super(key: key);

  @override
  _NavigationDrawerTestState createState() => _NavigationDrawerTestState();
}

class _NavigationDrawerTestState extends State<NavigationDrawerTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Side Navigation Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children:  [
            const DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                accountName: Text("Account Name"),
                accountEmail: Text("Email"),
                currentAccountPicture: CircleAvatar(
                  child: FlutterLogo(
                    size: 42,
                  ),
                ),
              ),
            ),
            ExpansionTile(
              title: const Text("Expansion Title"),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: const EdgeInsets.only(left: 15),
              children:  <Widget>[
                Text("children 1"),
                Text("children 2"),
              ],
            )
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            ListTile(
              title: Text("testing to get officer card * 12 mn ago"),
              subtitle: Text("កាតមន្ត្រី"),
              leading: Icon(Icons.three_k_plus,color: Colors.red,),
              trailing: Icon(Icons.three_mp_outlined,color: Colors.green,),
            ),
            ListTile(
              title: Text("testing to get officer card * 12 mn ago"),
              subtitle: Text("កាតមន្ត្រី"),
              leading: Icon(Icons.three_k_plus,color: Colors.red,),
              trailing: Icon(Icons.three_mp_outlined,color: Colors.green,),

            ),

          ],
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () {}/*=> _showAction(context, 0)*/,
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () {}/*=> _showAction(context, 1)*/,
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () {}/*=> _showAction(context, 2)*/,
            icon: const Icon(Icons.videocam),
          ),
        ],
      ),
    );
  }
}

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
        child: Container(
          child: WebView(
            initialUrl: "https://vincentgarreau.com/particles.js/#default",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
