import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:particles_flutter/particles_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const CircularParticleScreen(),
      home: const NavigationDrawerTest(),
      // home: const HttpRequestPage(),
      // home: const AutoGenerateUserImage(),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class CircularParticleScreen extends StatelessWidget {
  const CircularParticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          key: UniqueKey(),
          child: Center(
            child: CircularParticle(
              key: UniqueKey(),
              //How much spread
              awayRadius: 80,
              numberOfParticles: 200,
              speedOfParticles: 1,
              height: screenHeight,
              width: screenWidth,
              onTapAnimation: true,
              particleColor: Colors.white.withAlpha(150),
              awayAnimationDuration: const Duration(milliseconds: 600),
              maxParticleSize: 8,
              isRandSize: true,
              isRandomColor: true,
              randColorList: [
                Colors.red.withAlpha(210),
                Colors.white.withAlpha(210),
                Colors.yellow.withAlpha(210),
                Colors.green.withAlpha(210)
              ],
              awayAnimationCurve: Curves.linear,
              enableHover: false,
              hoverColor: Colors.white,
              hoverRadius: 90,

              //Connect each dot
              connectDots: true, //not recommended
            ),
          ),
        ),
      ),
    );
  }
}
