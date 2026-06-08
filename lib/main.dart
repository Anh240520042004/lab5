import 'package:exam/Entity/Product.dart';
import 'package:exam/ViewModel/ProductService.dart';
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
    ProductService productService = ProductService();
    List<Product> products = productService.getAllProduct();

    return MaterialApp(
      routes: {
        '/': (context) => Homepage(products: products),
        '/about': (context) => const AboutPage(),
      },
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
