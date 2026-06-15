import 'package:exam/Entity/CartItem.dart';
import 'package:exam/ViewModel/CartService.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Product Cart'),
        actions: [
          AnimatedBuilder(
            animation: cart,
            builder: (context, child) => IconButton(
              tooltip: 'Clear cart',
              onPressed: cart.isEmpty ? null : cart.clear,
              icon: const Icon(Icons.delete_sweep),
            ),
          ),
        ],
      ),
      body: const CartView(),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;

    return AnimatedBuilder(
        animation: cart,
        builder: (context, child) {
          if (cart.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: cart.items.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return _CartItemTile(item: cart.items[index]);
                  },
                ),
              ),
              _CartSummary(
                itemCount: cart.itemCount,
                totalPrice: cart.totalPrice,
              ),
            ],
          );
        },
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final CartItem item;

  const _CartItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;

    Widget productInfo() {
      return Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item.product.image ?? 'assets/images/dog.jpg',
              width: 84,
              height: 84,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text('Price: ${item.product.price.toStringAsFixed(0)}\$'),
                const SizedBox(height: 4),
                Text('Subtotal: ${item.totalPrice.toStringAsFixed(0)}\$'),
              ],
            ),
          ),
        ],
      );
    }

    Widget quantityControls() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: 'Decrease',
            onPressed: () => cart.decreaseProduct(item.product.id),
            icon: const Icon(Icons.remove_circle_outline),
          ),
          SizedBox(
            width: 28,
            child: Text(
              item.quantity.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            tooltip: 'Increase',
            onPressed: () => cart.addProduct(item.product),
            icon: const Icon(Icons.add_circle_outline),
          ),
          IconButton(
            tooltip: 'Remove',
            onPressed: () => cart.removeProduct(item.product.id),
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 430;

        return Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: isNarrow
                ? Column(
                    children: [
                      productInfo(),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: quantityControls(),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(child: productInfo()),
                      quantityControls(),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _CartSummary extends StatelessWidget {
  final int itemCount;
  final double totalPrice;

  const _CartSummary({required this.itemCount, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Items: $itemCount'),
                  Text(
                    'Total: ${totalPrice.toStringAsFixed(0)}\$',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Checkout completed')),
                );
                CartService.instance.clear();
              },
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
