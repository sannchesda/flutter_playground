import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class MyApp extends StatelessWidget {
  final String title = "Show up Demo";

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ShowUpAnimation(
              direction: Direction.horizontal,
              animationDuration: Duration(milliseconds: 1500),
              // delayBetween: Duration(milliseconds: 800),
              offset: -0.2,
              child: ElevatedButton(
                child: Text("Show Up Animation"),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 20),

            OpenContainer(
              transitionType: ContainerTransitionType.fade,
              transitionDuration: Duration(milliseconds: 500),
              openBuilder: (context, _) => TestSecondPage(),
              closedElevation: 0,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
                side: BorderSide(color: Colors.white, width: 1),
              ),
              closedColor: Colors.blue,
              closedBuilder: (context, _) => Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Show Up List"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ShowUpList(
                        direction: Direction.horizontal,
                        animationDuration: Duration(milliseconds: 1500),
                        delayBetween: Duration(milliseconds: 800),
                        offset: -0.2,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.red,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.red,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.red,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.red,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),

            // SizedBox(height: 40),
            // RaisedButton(
            //   child: Text("Show Up Builder"),
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (BuildContext context) {
            //           return ShowUpBuilderDemo();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class TestSecondPage extends StatelessWidget {
  const TestSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
