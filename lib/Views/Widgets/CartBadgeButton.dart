import 'package:exam/ViewModel/CartService.dart';
import 'package:exam/Views/Pages/CartPage.dart';
import 'package:flutter/material.dart';

class CartBadgeButton extends StatelessWidget {
  const CartBadgeButton({super.key});

  void _openCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CartService.instance,
      builder: (context, child) {
        final count = CartService.instance.itemCount;

        return IconButton(
          tooltip: 'Cart',
          onPressed: () => _openCart(context),
          icon: Badge(
            isLabelVisible: count > 0,
            label: Text(count.toString()),
            child: const Icon(Icons.shopping_cart),
          ),
        );
      },
    );
  }
}
