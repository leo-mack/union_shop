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
            // Header (consistent with other pages)
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
                                  child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          // Minimal centered nav
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false), child: const Text('Home', style: TextStyle(color: Colors.black))),
                                  PopupMenuButton<String>(
                                    onSelected: (value) {
                                      if (value == 'signature-essential') {
                                        Navigator.pushNamed(context, '/collections/signature-essential');
                                      } else if (value == 'portsmouth') {
                                        Navigator.pushNamed(context, '/collections/portsmouth-city');
                                      } else if (value == 'collections') {
                                        Navigator.pushNamed(context, '/collections');
                                      }
                                    },
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(value: 'signature-essential', child: Text('Signature & Essential Range')),
                                      PopupMenuItem(value: 'portsmouth', child: Text('Portsmouth City Collection')),
                                      PopupMenuItem(value: 'collections', child: Text('Collections')),
                                    ],
                                    child: Row(
                                      children: const [
                                        Text('Shop', style: TextStyle(color: Colors.black)),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_drop_down, color: Colors.black),
                                      ],
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                    onSelected: (value) {
                                      if (value == 'about' || value == 'personalisation') {
                                        Navigator.pushNamed(context, '/print-shack');
                                      }
                                    },
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(value: 'about', child: Text('About')),
                                      PopupMenuItem(value: 'personalisation', child: Text('Personalisation')),
                                    ],
                                    child: Row(
                                      children: const [
                                        Text('The Print Shack', style: TextStyle(color: Colors.black)),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_drop_down, color: Colors.black),
                                      ],
                                    ),
                                  ),
                                  TextButton(onPressed: () => Navigator.pushNamed(context, '/sale'), child: const Text('Sale', style: TextStyle(color: Colors.black))),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(mainAxisSize: MainAxisSize.min, children: [TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About', style: TextStyle(color: Colors.black)))]),
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
                                IconButton(icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () => Navigator.pushNamed(context, '/cart')),
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

            // Cart body
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ValueListenableBuilder<List<CartItem>>(
                valueListenable: Cart.instance.itemsNotifier,
                builder: (context, items, _) {
                  // Empty cart
                  if (items.isEmpty) {
                    return SizedBox(
                      height: 360,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('your cart is currently empty', style: TextStyle(fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                            child: const Text('Continue Shopping'),
                          ),
                        ],
                      ),
                    );
                  }

                  // Non-empty cart: layout like screenshot
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        const Text('Your cart', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                        const SizedBox(height: 8),
                        TextButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false), child: const Text('Continue shopping', style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF4d2963)))),
                        const SizedBox(height: 24),

                        // Headers
                        Row(
                          children: const [
                            Expanded(flex: 6, child: Text('Product', style: TextStyle(color: Colors.grey))),
                            Expanded(flex: 2, child: Text('Price', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey))),
                            Expanded(flex: 2, child: Text('Quantity', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey))),
                            Expanded(flex: 2, child: Text('Total', textAlign: TextAlign.end, style: TextStyle(color: Colors.grey))),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(height: 1),

                        // Items
                        Column(
                          children: items.map((item) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // Product
                                      Expanded(
                                        flex: 6,
                                        child: Row(
                                          children: [
                                            Container(width: 72, height: 72, color: Colors.grey[200], child: Image.network(item.imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey[300]))),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(item.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                                  const SizedBox(height: 6),
                                                  if (item.personalisationLines.isNotEmpty) ...[
                                                    Text('Lines: ${item.personalisationLines}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                                    const SizedBox(height: 4),
                                                    ...item.personalisationText.asMap().entries.map((entry) => 
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 4),
                                                        child: Text('Line ${entry.key + 1}: ${entry.value}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                                      )
                                                    ),
                                                  ] else ...[
                                                    Text('Color: ${item.color}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                                    const SizedBox(height: 4),
                                                    Text('Size: ${item.size}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                                  ],
                                                  TextButton(onPressed: () => Cart.instance.removeItem(item), child: const Text('Remove', style: TextStyle(color: Color(0xFF4d2963)))),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Price
                                      Expanded(flex: 2, child: Text(item.price, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Colors.black))),

                                      // Quantity
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: SizedBox(
                                            width: 96,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                IconButton(icon: const Icon(Icons.remove), onPressed: () {
                                                  final newQty = item.quantity - 1;
                                                  if (newQty < 1) {
                                                    Cart.instance.removeItem(item);
                                                  } else {
                                                    Cart.instance.updateQuantity(item, newQty);
                                                  }
                                                }, padding: EdgeInsets.zero, constraints: const BoxConstraints()),
                                                Text('${item.quantity}', style: const TextStyle(fontSize: 14)),
                                                IconButton(icon: const Icon(Icons.add), onPressed: () => Cart.instance.updateQuantity(item, item.quantity + 1), padding: EdgeInsets.zero, constraints: const BoxConstraints()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Line total
                                      Expanded(flex: 2, child: Text('£${item.lineTotal.toStringAsFixed(2)}', textAlign: TextAlign.end, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                                    ],
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 24),

                        // Note and summary
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Note
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Add a note to your order', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                                  SizedBox(height: 8),
                                  SizedBox(height: 80, child: TextField(maxLines: 4, decoration: InputDecoration(border: OutlineInputBorder()))),
                                ],
                              ),
                            ),

                            const SizedBox(width: 24),

                            // Summary/actions
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Subtotal', style: TextStyle(fontSize: 14, color: Colors.grey)),
                                      Text('£${Cart.instance.total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text('Tax included and shipping calculated at checkout', style: TextStyle(fontSize: 12, color: Colors.grey), textAlign: TextAlign.right),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black)), child: const Text('UPDATE')),
                                      const SizedBox(width: 12),
                                      ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)), child: const Text('CHECK OUT')),
                                    ],
                                  ),
                                  const SizedBox(height: 18),
                                  Row(
                                    children: [
                                      Expanded(child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple), child: const Padding(padding: EdgeInsets.symmetric(vertical: 12.0), child: Text('shop', style: TextStyle(color: Colors.white))))),
                                      const SizedBox(width: 12),
                                      Expanded(child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child: const Padding(padding: EdgeInsets.symmetric(vertical: 12.0), child: Text('G Pay', style: TextStyle(color: Colors.white))))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 36),
                      ],
                    ),
                  );
                },
              ),
            ),

            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
