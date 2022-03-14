import 'dart:io';

import 'package:avatars/avatars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_playground/company_colors.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/default_styles.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:flutter_quill/widgets/toolbar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:tuple/tuple.dart';

import 'intranet/home_page.dart';
import 'intranet/intranet.dart';

// void main() => runApp(const CalendarApp());
void main() => runApp(const MyApp());
// void main()=>runApp(const DatePickerExample());
// void main()=>runApp(const Intranet());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('km'),
        const Locale('en'),
      ],
      locale: const Locale('km'),
      // theme: ThemeData(primarySwatch: CompanyColors.blue),
      // home: const CircularParticleScreen(),
      home: const NavigationDrawerTest(),
      theme: ThemeData(
        // primaryColor: CompanyColors.blue,
        primarySwatch: CompanyColors.blue,
        fontFamily: 'KhmerOSBattambong',
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 16),
        ),
        hintColor: Colors.grey[400],
        appBarTheme: const AppBarTheme(
          color: Color(0xFF003D7C),
          elevation: 0,
        ),
        iconTheme: IconThemeData(color: CompanyColors.yellow),
        // colorScheme: const ColorScheme(
        //   primary: Color(0xFF003D7C),
        //   primaryVariant: Color(0xFF003D7C),
        //   secondary: Color(0xFFF07C08),
        //   secondaryVariant: Color(0xFFF07C08),
        //   background: Colors.white,
        //   brightness: Brightness.light,
        //   error: Colors.red,
        //   onBackground: Colors.white,
        //   onError: Colors.white,
        //   onPrimary: Colors.white,
        //   onSecondary: Colors.white,
        //   onSurface: Colors.white,
        //   surface: Colors.white,
        // ),
      ),
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
      // Very Import for the key to be unique
      // because flutter will check if widget change or value change
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
  final QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  String _selectedValue = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ស្នើសុំសេវា",
          style: TextStyle(fontFamily: 'KhmerOSBattambang'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.dialog(
                  FiltersPage(),
                );
              },
              icon: Icon(Icons.filter_1)),
          IconButton(
            onPressed: () {
              final now = DateTime.now();
              showDateRangePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: now,
                locale: Get.locale,
                // builder: (context, child) {
                //   return child!;
                // },
              );
            },
            icon: Icon(Icons.date_range),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
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
              children: <Widget>[
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
            CupertinoSlidingSegmentedControl<String>(
              children: <String, Widget>{
                "All": Text("All"),
                "ចំណេះដឹងទូទៅ": Text("ចំណេះដឹងទូទៅ"),
                "ចំណេះដឹងព័ត៌មានវិទ្យា": Text(
                  "ចំណេះដឹងព័ត៌មានវិទ្យា",
                  textAlign: TextAlign.center,
                ),
                "ចំណេះដឹងហិរញ្ញវត្ថុ": Container(
                  child: Text(
                    "ចំណេះដឹងហិរញ្ញវត្ថុ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'KohSantepheap', fontSize: 16),
                  ),
                  padding: EdgeInsets.all(10),
                ),
              },
              padding: EdgeInsets.all(10),
              onValueChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedValue = value;
                });
              },
              backgroundColor: CupertinoColors.white,
              thumbColor: CupertinoColors.white,
              groupValue: _selectedValue,
            ),
            ListTile(
              title: Text("testing to get officer card"),
              subtitle: Text("កាតមន្ត្រី • 12 mn ago"),
              leading: Icon(
                Icons.low_priority,
                color: Colors.red,
              ),
              trailing: Icon(
                Icons.three_mp_outlined,
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text("testing to get officer card * 12 mn ago"),
              subtitle: Text("កាតមន្ត្រី"),
              leading: Icon(
                Icons.three_k_plus,
                color: Colors.red,
              ),
              trailing: Icon(
                Icons.three_mp_outlined,
                color: Colors.green,
              ),
            ),
            QuillToolbar.basic(
              controller: _controller,
              showListCheck: false,
              showCodeBlock: false,
              showInlineCode: false,
              showVideoButton: false,
              showDividers: true,
              showBoldButton: true,
              showItalicButton: true,
              showSmallButton: false,
              showUnderLineButton: true,
              showStrikeThrough: false,
              showColorButton: false,
              showBackgroundColorButton: false,
              showClearFormat: false,
              showAlignmentButtons: true,
              showLeftAlignment: true,
              showCenterAlignment: true,
              showRightAlignment: true,
              showJustifyAlignment: false,
              showHeaderStyle: true,
              showListNumbers: true,
              showListBullets: true,
              showQuote: true,
              showIndent: false,
              showLink: true,
              showHistory: false,
              showHorizontalRule: false,
              multiRowsDisplay: true,
              showImageButton: true,
              showCameraButton: true,
            ),
            QuillEditor(
                controller: _controller,
                scrollController: ScrollController(),
                scrollable: true,
                focusNode: _focusNode,
                autoFocus: false,
                readOnly: false,
                placeholder: 'Add content',
                expands: false,
                padding: EdgeInsets.zero,
                customStyles: DefaultStyles(
                  h1: DefaultTextBlockStyle(
                      const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        height: 1.15,
                        fontWeight: FontWeight.w300,
                      ),
                      const Tuple2(16, 0),
                      const Tuple2(0, 0),
                      null),
                  sizeSmall: const TextStyle(fontSize: 9),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      // ExpandableFab(
      //   distance: 112.0,
      //   children: [
      //     ActionButton(
      //       onPressed: () {} /*=> _showAction(context, 0)*/,
      //       icon: const Icon(Icons.format_size),
      //     ),
      //     ActionButton(
      //       onPressed: () {} /*=> _showAction(context, 1)*/,
      //       icon: const Icon(Icons.insert_photo),
      //     ),
      //     ActionButton(
      //       onPressed: () {} /*=> _showAction(context, 2)*/,
      //       icon: const Icon(Icons.videocam),
      //     ),
      //   ],
      // ),
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
