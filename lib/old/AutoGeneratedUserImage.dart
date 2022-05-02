
import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

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
