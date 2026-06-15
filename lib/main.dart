import 'package:exam/Entity/Product.dart';
import 'package:exam/Views/Pages/AboutPage.dart';
import 'package:exam/Views/Pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Food Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routes: {
        '/about': (context) => const AboutPage(),
      },
      home: Homepage(products: Product.products),
    );
  }
}
