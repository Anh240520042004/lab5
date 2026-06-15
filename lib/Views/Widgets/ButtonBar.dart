import 'package:flutter/material.dart';

class Buttonbar extends StatelessWidget {
  const Buttonbar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      items: [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "Cart", icon: Icon(Icons.shopping_cart)),
        BottomNavigationBarItem(
          label: "About",
          icon: Icon(Icons.account_box_outlined),
        ),
      ],
    );
  }
}
