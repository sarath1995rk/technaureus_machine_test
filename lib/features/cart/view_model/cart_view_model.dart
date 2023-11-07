import 'package:flutter/foundation.dart';
import 'package:technaures_machine_test/models/cart_item.dart';
import 'package:technaures_machine_test/rest/repository.dart';
import 'package:technaures_machine_test/utilities/alert.dart';

class CartViewModel extends ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    if (_items == null) {
      return 0;
    }
    return _items.length;
  }

  int get productsCount {
    var length = 0;
    if (_items == null) {
      return length;
    }
    _items.forEach((key, value) {
      length += value.quantity * 1;
    });
    return length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
      {String? title,
      String? unit,
      double? price,
      double? calories,
      String? productId}) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId!,
        (existingItem) => CartItem(
            title: existingItem.title,
            quantity: existingItem.quantity + 1,
            price: existingItem.price,
            calories: existingItem.calories,
            productId: existingItem.productId,
            unit: existingItem.unit),
      );
    } else {
      _items.putIfAbsent(
        productId!,
        () => CartItem(
            title: title!,
            quantity: 1,
            price: price!,
            unit: unit!,
            calories: calories!,
            productId: productId),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    _items.update(
      productId,
      (existingItem) => CartItem(
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
          calories: existingItem.calories,
          productId: existingItem.productId,
          unit: existingItem.unit),
    );
    notifyListeners();
  }

  void decrementQuantity(String productId) {
    CartItem item =
        _items.values.firstWhere((element) => element.productId == productId);

    if (item.quantity <= 1) {
      _items.removeWhere((key, value) {
        return value.productId == productId;
      });
    } else {
      _items.update(
        productId,
        (existingItem) {
          return CartItem(
              title: existingItem.title,
              quantity: existingItem.quantity - 1,
              price: existingItem.price,
              calories: existingItem.calories,
              productId: existingItem.productId,
              unit: existingItem.unit);
        },
      );
    }

    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

  final _repository = Repository();
  bool loading = false;

  Future<void> orderCheckOut() async {
    if (!loading) {
      loading = true;
      notifyListeners();
    }

    List<Map<String, dynamic>> productData = [];
    _items.forEach((key, value) {
      productData.add({
        "product_id": int.parse(value.productId),
        "quantity": value.quantity,
        "price": value.price.toInt()
      });
    });
    Map<String, dynamic> map = {};
    map.putIfAbsent('customer_id', () => 24);
    map.putIfAbsent('total_price', () => totalAmount.toInt());
    map.putIfAbsent('products', () => productData);

    final response = await _repository.orderCheckout(map: map);
    if (response.error != null) {
      Alert.showToast(response.error?.getErrorMessage());
    } else {
      Alert.showToast('Order Successfully placed!');
      clearCart();
    }
    loading = false;
    notifyListeners();
  }
}
