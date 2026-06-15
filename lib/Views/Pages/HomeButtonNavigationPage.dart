import 'package:exam/Views/Pages/CartPage.dart';
import 'package:exam/Views/Widgets/CartBadgeButton.dart';
import 'package:flutter/material.dart';
import 'package:exam/Views/Widgets/Product_Widget.dart';

class HomebuttonnavigationPage extends StatefulWidget {
  const HomebuttonnavigationPage({super.key});

  @override
  State<HomebuttonnavigationPage> createState() =>
      _HomebuttonnavigationPageState();
}

class _HomebuttonnavigationPageState extends State<HomebuttonnavigationPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.menu),
        actions: [
          CartBadgeButton(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: "About",
            icon: Icon(Icons.account_box_outlined),
          ),
        ],
        onTap: (value) => (setState(() {
          _selectedIndex = value;
        })),
      ),
      body: [
        ProductListWidget(),
        CartView(),
        // ProductWidget(),
        Center(child: Text("About Author")),
      ][_selectedIndex],
    );
  }
}
