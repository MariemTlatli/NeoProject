import 'package:flutter/foundation.dart';
import '../Models/Item.dart';

class CartModel extends ChangeNotifier {
  List<Item> items = [];
  double totalPrice = 0.0;
  void add(Item i) {
    items.add(i);
    totalPrice += i.price;
    notifyListeners();
  }

  void remove(Item i) {
    items.remove(i);
    totalPrice -= i.price;
    notifyListeners();
  }

  // nombres de produit choisi
  int get count {
    return items.length;
  }

  double get GetTotalPrice {
    return totalPrice;
  }

  List<Item> get GetMyList {
    return items;
  }
}
