import 'package:exam/Views/Widgets/ProductWidget.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [for (int i = 1; i <= 5; i++) Productwidget()]);
  }
}
