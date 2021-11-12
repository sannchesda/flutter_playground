import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Intranet'),
              background: FlutterLogo(),
              collapseMode: CollapseMode.pin,
            ),

            pinned: true,
            stretch: true,
            floating: true,
            snap: true,
            // snap: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle),
                tooltip: 'Add new entry',
                onPressed: () {
                  /* ... */
                },
              ),
            ]),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return ListTile(
                leading: Container(
                    padding: EdgeInsets.all(8),
                    width: 100,
                    child: Placeholder()),
                title: Text('Place ${index + 1}', textScaleFactor: 2),
              );
            },
            childCount: 20,
          ),
        ),
      ]),
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
