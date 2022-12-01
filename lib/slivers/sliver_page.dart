import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            backgroundColor: const Color(0xff1c0436),
            pinned: true,
            floating: true,
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            actions: [
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4bb82b72535211.5bead62fe26d5.jpg'),
                  //your image
                  fit: BoxFit.cover,
                  alignment: Alignment.center
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                title: Text('A Synthwave Mix'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                    SongTile(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: [
    //       SliverAppBar(
    //         pinned: true,
    //         stretch: true,
    //         expandedHeight: 200,
    //         flexibleSpace: FlexibleSpaceBar(
    //           title: Text("Sliver App Bar"),
    //           collapseMode: CollapseMode.parallax,
    //           expandedTitleScale: 1.5,
    //           stretchModes: [
    //             // StretchMode.zoomBackground,
    //             StretchMode.fadeTitle
    //           ],
    //           background: Image.network(
    //             'http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       // SliverPersistentHeader(
    //       //   pinned: true,
    //       //   delegate: SliverCustomHeaderDelegate(
    //       //     collapsedHeight: AppBar().preferredSize.height,
    //       //     expandedHeight: 200,
    //       //     paddingTop: 0,
    //       //     coverImgUrl:
    //       //         "http://img1.mukewang.com/5c18cf540001ac8206000338.jpg",
    //       //     title: "Something",
    //       //   ),
    //       // ),
    //       SliverFillRemaining(
    //         child: ListView.builder(
    //           shrinkWrap: true,
    //           physics: NeverScrollableScrollPhysics(),
    //           padding: EdgeInsets.all(0),
    //           itemCount: 100,
    //           itemBuilder: (context, index) {
    //             return ListTile(
    //               title: Text("Something : $index"),
    //             );
    //           },
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              //   return MusicPlayerScreen();
              // }));
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff3b1f50),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Icon(Icons.music_note),
                  padding: EdgeInsets.all(16),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Song Title with Desc ',
                    ),
                    Text(
                      'Playlist Name',
                    )
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.favorite,
            color: const Color(0xff3b1f50),
          )
        ],
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;

  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.coverImgUrl,
    required this.title,
  });

  @override
  double get minExtent => collapsedHeight + paddingTop;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha =
        (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha =
          (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Image.network(coverImgUrl, fit: BoxFit.cover),
          // Put your head back
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              // color: makeStickyHeaderBgColor(shrinkOffset), // Background color
              child: SafeArea(
                bottom: false,
                child: SizedBox(
                  height: collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: makeStickyHeaderTextColor(
                            shrinkOffset,
                            true,
                          ), // Return icon color
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: makeStickyHeaderTextColor(
                            shrinkOffset,
                            false,
                          ), // Title color
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          // color: makeStickyHeaderTextColor(
                          //   shrinkOffset,
                          //   true,
                          // ), // Share icon color
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
