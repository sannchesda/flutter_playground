import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String networkSVG = "https://avatars.dicebear.com/api/initials/:seed.svg";

const String networkImage =
    "https://firebasestorage.googleapis.com/v0/b/project-shotgun.appspot.com/o/images%2F0663fb30-4f71-488d-aad8-9cdd0f2c2e98?alt=media&token=40e4ec23-a70c-45b7-970f-c126809c664e";

Widget workingSomewhatExampleOfCustomImageSliver() {
  return Scaffold(
    // appBar: AppBar(
    //   title: Text("Bounce Example"),
    // ),
    body: Stack(
      children: <Widget>[
        NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            // if (controller.position.userScrollDirection ==
            //     ScrollDirection.reverse) {
            //   if (!translateController.isAnimating) {
            //     translateController.forward();
            //   }
            // } else if (controller.position.userScrollDirection ==
            //     ScrollDirection.forward) {
            //   if (!translateController.isAnimating) {
            //     translateController.reverse();
            //   }
            // }
            return true;
          },
          child: CustomScrollView(
            // controller: controller,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text(""),
                pinned: true,
                floating: true,
                stretch: true,
                onStretchTrigger: () async {
                  print("onStretchTrigger");
                },
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    // maxAppHeight = constraints.biggest.height;
                    // minAppHeight = constraints.smallest.height;
                    return FlexibleSpaceBar.createSettings(
                      maxExtent: 150,
                      minExtent: 100,
                      currentExtent: 125,
                      child: FlexibleSpaceBar(
                        title: Text(
                          "",// "${maxAppHeight.toString()}\n${minAppHeight.toString()}",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    );
                  },
                ),
                // backgroundColor: Colors.transparent,
                // shape: RoundedRectangleBorder(
                //   side: BorderSide(
                //     width: 2,
                //     color: Colors.red
                //   )
                // ),
                toolbarHeight: 80,
                expandedHeight: 150,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    title: Center(
                      child: Text(
                        '$index',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 50,
                          color: Colors.greenAccent[400],
                        ),
                      ),
                    ),
                  ),
                  childCount: 51,
                ),
              )
            ],
          ),
        ),
        SafeArea(
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: 150.0,
                // color: Colors.yellowAccent,
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Transform.scale(
                      //   scale: scaleAnimation.value,
                      //   origin: Offset(0, 0.0),
                      //   child: Transform.translate(
                      //     offset: Offset(translateAnimationX.value,
                      //         translateAnimationY.value),
                      //     child: SvgPicture.asset(
                      //       "$iconSvgDir/app_logo.svg",
                      //       width: 150,
                      //       height: 150,
                      //     ),
                      //   ),
                      // ),


                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        // translateController.animateTo(0.55);

        // if (translateController.isCompleted) {
        //   translateController.reverse();
        // } else {
        //   translateController.forward();
        // }
      },
      child: Text("asdasd"),
    ),
  );
}
