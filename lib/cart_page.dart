import 'package:flutter/material.dart';
import 'package:union_shop/main.dart' show FooterSection;
import 'package:union_shop/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header (matching home page)
            Container(
              height: 150,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK\nLASTS!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 40,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 40,
                                  height: 40,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          // centered nav (kept minimal here)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
                                    child: const Text('Home', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton(onPressed: () {}, child: const Text('Shop', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                                  const SizedBox(width: 12),
                                  TextButton(onPressed: () {}, child: const Text('The Print Shack', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                                  const SizedBox(width: 12),
                                  TextButton(onPressed: () {}, child: const Text('Sale', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(mainAxisSize: MainAxisSize.min, children: [
                                TextButton(onPressed: () {}, child: const Text('About', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500))),
                              ]),
                            ],
                          ),
                          const Spacer(),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(icon: const Icon(Icons.search, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () {}),
                                IconButton(icon: const Icon(Icons.person_outline, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () => Navigator.pushNamed(context, '/login')),
                                IconButton(icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () {}),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Cart content (shows items when present)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: ValueListenableBuilder<List<CartItem>>(
                valueListenable: Cart.instance.itemsNotifier,
                builder: (context, items, _) {
                  if (items.isEmpty) {
                    return SizedBox(
                      height: 320,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'your cart is currently empty',
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4d2963),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              ),
                              child: const Text('Continue Shopping'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...items.map((item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey[200],
                                child: Image.network(item.imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey[300])),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove_circle_outline),
                                          onPressed: () {
                                            final newQty = item.quantity - 1;
                                            if (newQty < 1) {
                                              Cart.instance.removeItem(item);
                                            } else {
                                              Cart.instance.updateQuantity(item, newQty);
                                            }
                                          },
                                        ),
                                        Text(item.quantity.toString(), style: const TextStyle(fontSize: 14)),
                                        IconButton(
                                          icon: const Icon(Icons.add_circle_outline),
                                          onPressed: () => Cart.instance.updateQuantity(item, item.quantity + 1),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('£${(item.lineTotal).toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                  TextButton(
                                    onPressed: () => Cart.instance.removeItem(item),
                                    child: const Text('Remove', style: TextStyle(color: Colors.black)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black)),
                          Text('£${Cart.instance.total.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text('CHECKOUT'),
                          ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Footer
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
