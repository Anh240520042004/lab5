import 'package:exam/Views/Pages/AboutPage.dart';
import 'package:exam/Views/Pages/HomePageNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:exam/Views/Pages/HomePage.dart';
import 'package:exam/Views/Pages/ProductDetailPage.dart';

import 'Views/Pages/HomeButtonNavigationPage.dart';
import 'Views/Pages/HomeTabPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  onPress() {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      routes: {
        '/': (context) => Homepage(),
        '/detail': (context) => ProductDetailPage(),
        '/about': (context) => AboutPage(),
      },
*/
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      // home: DefaultTabController(length: 3, child: HometabPage()),
      home: AboutPage(),
    );
  }
}
