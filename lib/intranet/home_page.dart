import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:flutter_playground/constant.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final maxCount = 20;
  final scrollDirection = Axis.vertical;
  late AutoScrollController controller;
  final ScrollController scrollController = ScrollController();

  _onLayoutDone(_) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(_onLayoutDone);

    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
  }

  final random = math.Random();
  int counter = -1;

  Future _scrollToIndex() async {
    setState(() {
      counter++;
      if (counter >= maxCount) {
        counter = 0;
      }
    });

    await controller.scrollToIndex(counter,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(counter);
  }

  Widget _getRow(int index) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: controller,
      index: index,
      highlightColor: Colors.black.withOpacity(0.1),
      child: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.topCenter,
        // height: height,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue, width: 4),
            borderRadius: BorderRadius.circular(12)),
        child: Text('index: $index'),
      ),
    );
  }

  onClickScrollController() {
    print("onClickScrollController");
    setState(() {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: CustomScrollView(
      //     controller: controller,
      //     slivers: [
      //   SliverAppBar(
      //       expandedHeight: 200.0,
      //       flexibleSpace: FlexibleSpaceBar(
      //         title: Text('Intranet'),
      //         background: Image.network(networkImage, fit: BoxFit.cover,),
      //         collapseMode: CollapseMode.parallax,
      //         stretchModes: [
      //           StretchMode.fadeTitle
      //         ],
      //       ),
      //       // title: Text("Title"),
      //       pinned: false,
      //       stretch: true,
      //       floating: true,
      //       // snap: true,
      //       actions: <Widget>[
      //         IconButton(
      //           icon: const Icon(Icons.add_circle),
      //           tooltip: 'Add new entry',
      //           onPressed: () {
      //
      //           },
      //         ),
      //       ]),
      //   SliverToBoxAdapter(
      //     child: ListView.builder(
      //       itemCount: 20,
      //       physics: NeverScrollableScrollPhysics(),
      //       scrollDirection: scrollDirection,
      //       // controller: controller,
      //       shrinkWrap: true,
      //       itemBuilder: (context, index) {
      //         return Padding(
      //           padding: EdgeInsets.all(8),
      //           child: _getRow(index),
      //         );
      //       },
      //     ),
      //   ),
      //
      //   // SliverList(
      //   //   delegate: SliverChildBuilderDelegate(
      //   //         (_, int index) {
      //   //       // return _getRow(index, math.max(data[1].toDouble(), 50.0));
      //   //       return ListTile(
      //   //         leading: Container(
      //   //             padding: EdgeInsets.all(8),
      //   //             width: 100,
      //   //             child: _getRow(index)),
      //   //         title: Tooltip(
      //   //             message: 'Asdadsa',
      //   //             child: Text('Place ${index + 1}', textScaleFactor: 2)),
      //   //       );
      //   //     },
      //   //     childCount: 20,
      //   //   ),
      //   // ),
      // ]),
      appBar: AppBar(
        title: Text("Something Title"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: Column(
            children: [
              Image.network(
                networkImage,
                width: double.infinity,
                height: 200,
              ),
              ListView.builder(
                itemCount: maxCount,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: scrollDirection,
                // controller: scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: _getRow(index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _scrollToIndex,
        onPressed: onClickScrollController,
        child: Icon(Icons.refresh),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // const DrawerHeader(
            //   padding: EdgeInsets.all(0),
            //   child: UserAccountsDrawerHeader(
            //     accountName: Text("Account Name"),
            //     accountEmail: Text("Email"),
            //     currentAccountPicture: CircleAvatar(
            //       child: FlutterLogo(
            //         size: 42,
            //       ),
            //     ),
            //   ),
            // ),
            ExpansionTile(
              backgroundColor: Colors.red,
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
    );
  }
}

class _SliverAppPersistentDelegate implements SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      throw UnimplementedError();

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration? get snapConfiguration =>
      throw UnimplementedError();

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration =>
      throw UnimplementedError();

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => throw UnimplementedError();
}
