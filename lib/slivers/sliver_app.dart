import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_playground/slivers/sliver_page.dart';
import 'package:get/get.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import '../utils/company_colors.dart';

class SliverApp extends StatelessWidget {
  const SliverApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('km'),
        const Locale('en'),
      ],
      locale: const Locale('km'),
      home: const SliverPage(),
      theme: ThemeData(
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
      ),
    );
  }
}
