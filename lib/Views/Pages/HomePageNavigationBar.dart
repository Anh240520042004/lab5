import 'package:exam/Views/Widgets/AboutWidget.dart';
import 'package:exam/Views/Pages/CartPage.dart';
import 'package:exam/Views/Widgets/Product_Widget.dart';
import 'package:flutter/material.dart';

class Homepagenavigationbar extends StatefulWidget {
  const Homepagenavigationbar({super.key});

  @override
  State<Homepagenavigationbar> createState() => _HomepagenavigationbarState();
}

class _HomepagenavigationbarState extends State<Homepagenavigationbar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: "About",
          ),
        ],
      ),
      body: [ProductListWidget(), CartView(), Aboutwidget()][_selectedIndex],
    );
  }
}
