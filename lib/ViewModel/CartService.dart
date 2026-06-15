import 'package:exam/Entity/CartItem.dart';
import 'package:exam/Entity/Product.dart';
import 'package:flutter/foundation.dart';

class CartService extends ChangeNotifier {
  CartService._();

  static final CartService instance = CartService._();

  final Map<String, CartItem> _items = {};

  List<CartItem> get items => List.unmodifiable(_items.values);

  int get itemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return _items.values.fold(0, (sum, item) => sum + item.totalPrice);
  }

  bool get isEmpty => _items.isEmpty;

  void addProduct(Product product) {
    final current = _items[product.id];
    if (current == null) {
      _items[product.id] = CartItem(product: product, quantity: 1);
    } else {
      _items[product.id] = current.copyWith(quantity: current.quantity + 1);
    }
    notifyListeners();
  }

  void decreaseProduct(String productId) {
    final current = _items[productId];
    if (current == null) {
      return;
    }

    if (current.quantity <= 1) {
      _items.remove(productId);
    } else {
      _items[productId] = current.copyWith(quantity: current.quantity - 1);
    }
    notifyListeners();
  }

  void removeProduct(String productId) {
    if (_items.remove(productId) != null) {
      notifyListeners();
    }
  }

  void clear() {
    if (_items.isEmpty) {
      return;
    }
    _items.clear();
    notifyListeners();
  }
}
