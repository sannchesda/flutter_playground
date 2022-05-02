import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/utils/company_colors.dart';
import 'package:flutter_playground/utils/constant.dart';
import 'package:flutter_playground/intranet/particle_js_clone.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final double statusBarHeight = MediaQuery.of(context).padding.top;
  final maxCount = 30;
  final scrollDirection = Axis.vertical;
  late AutoScrollController controller;
  late ScrollController scrollController;

  _onLayoutDone(_) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  final GlobalKey<SliverAnimatedListState> listKey =
      GlobalKey<SliverAnimatedListState>();
  List<String> stringList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(_onLayoutDone);

    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    scrollController = ScrollController();

    for (int i = 0; i < maxCount; i++) {
      stringList.add(i.toString());
    }
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
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title: Text("Intranet Portal"),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
            actions: [],
            floating: true,
            pinned: false,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: CompanyColors.skyBlue,
              child: CircularParticleWidget(),
            ),
          ),
          SliverAnimatedList(
            initialItemCount: stringList.length,
            key: listKey,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset(0, 0),
                ).animate(animation),
                child: ListTile(
                  // onTap: () {
                  //   insertItem(index);
                  // },
                  onLongPress: () {
                    removeItem(index);
                  },
                  title: Text(stringList[index]),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: CompanyColors.blue,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(networkImage),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 12.0,
                      left: 16.0,
                      child: Text(
                        "Flutter Step-by-Step",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              NavigationDrawerItem(),
              NavigationDrawerItem(),
              ExpansionTile(
                collapsedTextColor: Colors.white,
                collapsedIconColor: Colors.white,
                iconColor: CompanyColors.yellow,
                textColor: CompanyColors.yellow,
                title: Text(
                  "Expansion Title",
                  style: TextStyle(fontFamily: 'KhmerOSBattambang'),
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                // backgroundColor: Colors.white,
                childrenPadding: EdgeInsets.only(left: 15),
                children: [
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            "Request Service",
                            style: TextStyle(
                                color: CompanyColors.blue,
                                fontFamily: 'KhmerOSBattambang'),
                          ),
                        ),
                        ExpansionTile(
                          collapsedTextColor: CompanyColors.blue,
                          collapsedIconColor: CompanyColors.blue,
                          iconColor: CompanyColors.yellow,
                          textColor: CompanyColors.yellow,
                          title: Text(
                            "ស្នើសុំសាលប្រជុំ",
                            style: TextStyle(fontFamily: 'KohSantepheap'),
                          ),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          expandedAlignment: Alignment.centerLeft,
                          backgroundColor: Colors.white,
                          childrenPadding: EdgeInsets.only(left: 15),
                          children: <Widget>[
                            ListTile(
                              onTap: () {},
                              title: Text(
                                "Request Service",
                                style: TextStyle(
                                    color: CompanyColors.blue,
                                    fontFamily: 'KhmerOSBattambang'),
                              ),
                            ),
                            ExpansionTile(
                              collapsedTextColor: CompanyColors.blue,
                              collapsedIconColor: CompanyColors.blue,
                              iconColor: CompanyColors.yellow,
                              textColor: CompanyColors.yellow,
                              title: Text(
                                "Expansion Title",
                                style:
                                    TextStyle(fontFamily: 'KhmerOSBattambang'),
                              ),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              expandedAlignment: Alignment.centerLeft,
                              backgroundColor: Colors.white,
                              childrenPadding: EdgeInsets.only(left: 15),
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: ListTile(
                                    title: Text(
                                      "Request Service1",
                                      style: TextStyle(
                                          color: CompanyColors.blue,
                                          fontFamily: 'KhmerOSBattambang'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          insertItem();
        },
      ),
    );
  }

  int counter = 0;

  void insertItem() {
    // final index = stringList.length + 1;
    // stringList.add(index.toString());
    // listKey.currentState!.insertItem(index);
    // stringList = []
    //   ..add("${counter++}")
    //   ..addAll(stringList);
    // listKey.currentState!.insertItem(0,
    //     duration: const Duration(milliseconds: 500));

    String item = "Pig";
    int insertIndex = 2;
    stringList.insert(insertIndex, item);
    listKey.currentState!.insertItem(insertIndex);
  }

  void removeItem(int index) {
    listKey.currentState!.removeItem(index, (context, animation) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInBack,
            reverseCurve: Curves.easeInExpo)),
        child: ListTile(
          // onTap: () {
          //   insertItem(index);
          // },
          onLongPress: () {
            removeItem(index);
          },
          title: Text(stringList[index]),
        ),
      );
    });
    stringList.removeAt(index);
    // listKey.currentState!.removeItem(
    //     0, (_, animation) => slideIt(context, 0, animation),
    //     duration: const Duration(milliseconds: 500));
    // _items.removeAt(0);
  }
}

class NavigationDrawerItem extends StatelessWidget {
  const NavigationDrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        "Request Service",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'KhmerOSBattambang',
        ),
      ),
    );
  }
}

class FiltersPage extends StatefulWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );
    slideAnimation = Tween<Offset>(
      begin: Offset(0.0, -4.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
      ),
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.all(13.0),
            height: MediaQuery.of(context).size.height / 2.7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: CompanyColors.blue),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    print("asdas");
                  },
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    "Something 1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
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
