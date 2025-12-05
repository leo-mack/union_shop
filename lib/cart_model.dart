import 'package:flutter/foundation.dart';

class CartItem {
  final String title;
  final String price; // e.g. '£16.00'
  final String imageUrl;
  final String color;
  final String size;
  final String personalisationLines; // e.g. 'One Line of Text' or 'Two Lines of Text'
  final List<String> personalisationText; // e.g. ['Line 1', 'Line 2']
  int quantity;

  CartItem({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.size,
    this.personalisationLines = '',
    this.personalisationText = const [],
    this.quantity = 1,
  });

  double get unitPrice {
    final parsed = double.tryParse(price.replaceAll(RegExp(r'[^0-9\.]'), ''));
    return parsed ?? 0.0;
  }

  double get lineTotal => unitPrice * quantity;
}

class Cart {
  Cart._privateConstructor();
  static final Cart instance = Cart._privateConstructor();

  final ValueNotifier<List<CartItem>> itemsNotifier = ValueNotifier<List<CartItem>>([]);

  List<CartItem> get items => List.unmodifiable(itemsNotifier.value);

  void addItem(CartItem item) {
    // If same title & price & image & color & size & personalisation exists, just increase quantity
    final list = List<CartItem>.from(itemsNotifier.value);
    final idx = list.indexWhere((e) => 
      e.title == item.title && 
      e.price == item.price && 
      e.imageUrl == item.imageUrl && 
      e.color == item.color && 
      e.size == item.size &&
      e.personalisationLines == item.personalisationLines &&
      _personalisationTextEqual(e.personalisationText, item.personalisationText)
    );
    if (idx >= 0) {
      list[idx].quantity += item.quantity;
    } else {
      list.add(item);
    }
    itemsNotifier.value = list;
  }

  bool _personalisationTextEqual(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  void removeItem(CartItem item) {
    final list = List<CartItem>.from(itemsNotifier.value);
    list.removeWhere((e) => 
      e.title == item.title && 
      e.price == item.price && 
      e.imageUrl == item.imageUrl && 
      e.color == item.color && 
      e.size == item.size &&
      e.personalisationLines == item.personalisationLines &&
      _personalisationTextEqual(e.personalisationText, item.personalisationText)
    );
    itemsNotifier.value = list;
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity < 1) return;
    final list = List<CartItem>.from(itemsNotifier.value);
    final idx = list.indexWhere((e) => 
      e.title == item.title && 
      e.price == item.price && 
      e.imageUrl == item.imageUrl && 
      e.color == item.color && 
      e.size == item.size &&
      e.personalisationLines == item.personalisationLines &&
      _personalisationTextEqual(e.personalisationText, item.personalisationText)
    );
    if (idx >= 0) {
      list[idx].quantity = quantity;
      itemsNotifier.value = list;
    }
  }

  double get total {
    return itemsNotifier.value.fold(0.0, (sum, item) => sum + item.lineTotal);
  }

  void clear() {
    itemsNotifier.value = [];
  }
}
