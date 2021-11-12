import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/intranet/home_page.dart';
import 'package:get/get.dart';

class Intranet extends StatelessWidget {
  const Intranet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Intranet Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),

    );
  }
}
