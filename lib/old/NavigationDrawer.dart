import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/intranet/home_page.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class NavigationDrawerTest extends StatefulWidget {
  const NavigationDrawerTest({Key? key}) : super(key: key);

  @override
  _NavigationDrawerTestState createState() => _NavigationDrawerTestState();
}

class _NavigationDrawerTestState extends State<NavigationDrawerTest> {
  final quill.QuillController _controller = quill.QuillController.basic();
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
            quill.QuillToolbar.basic(
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
              // showHistory: false,
              // showHorizontalRule: false,
              multiRowsDisplay: true,
              showImageButton: true,
              showCameraButton: true,
            ),
            quill.QuillEditor(
                controller: _controller,
                scrollController: ScrollController(),
                scrollable: true,
                focusNode: _focusNode,
                autoFocus: false,
                readOnly: false,
                placeholder: 'Add content',
                expands: false,
                padding: EdgeInsets.zero,
                customStyles: quill.DefaultStyles(
                  h1: quill.DefaultTextBlockStyle(
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
