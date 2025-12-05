import 'package:flutter/material.dart';
import 'package:union_shop/main.dart' show FooterSection;

class CombinedCollection extends StatelessWidget {
  const CombinedCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 150,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
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
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                            },
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
                          // Navigation buttons
                          TextButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false), child: const Text('Home', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'signature-essential') {
                                Navigator.pushNamedAndRemoveUntil(context, '/collections/signature-essential', (route) => false);
                              } else if (value == 'portsmouth') {
                                Navigator.pushNamedAndRemoveUntil(context, '/collections/portsmouth-city', (route) => false);
                              }
                            },
                            itemBuilder: (context) => const [
                              PopupMenuItem(value: 'signature-essential', child: Text('Signature & Essential Range')),
                              PopupMenuItem(value: 'portsmouth', child: Text('Portsmouth City Collection')),
                            ],
                            child: Row(
                              children: const [
                                Text('Shop', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_drop_down, color: Colors.black),
                              ],
                            ),
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'about' || value == 'personalisation') {
                                Navigator.pushNamed(context, '/about');
                              }
                            },
                            itemBuilder: (context) => const [
                              PopupMenuItem(value: 'about', child: Text('About')),
                              PopupMenuItem(value: 'personalisation', child: Text('Personalisation')),
                            ],
                            child: Row(
                              children: const [
                                Text('The Print Shack', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_drop_down, color: Colors.black),
                              ],
                            ),
                          ),
                          TextButton(onPressed: () {}, child: const Text('Sale', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                          TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                          const Spacer(),
                          IconButton(icon: const Icon(Icons.search, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.person_outline, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () => Navigator.pushNamed(context, '/login')),
                          IconButton(icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () => Navigator.pushNamed(context, '/cart')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Page title
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40),
              child: const Text(
                'Signature & Essential Range',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Products Grid
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                  childAspectRatio: 0.75,
                  children: const [
                    // Signature Range Products
                    _CombinedProductCard(
                      title: 'Signature T-Shirt',
                      price: '£9.00',
                      originalPrice: '',
                      imageUrl: 'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
                      description: 'Classic Signature T-Shirt in premium quality fabric. A staple piece from our Signature collection.',
                    ),
                    _CombinedProductCard(
                      title: 'Signature Hoodie',
                      price: '£20.00',
                      originalPrice: '',
                      imageUrl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_1024x1024@2x.png?v=1745583498',
                      description: 'Premium Signature Hoodie with comfortable fit. Perfect for year-round wear.',
                    ),
                    // Essential Range Products
                    _CombinedProductCard(
                      title: 'Limited Edition Essential Zip Hoodies',
                      price: '£16.00',
                      originalPrice: '£20.00',
                      imageUrl: 'https://shop.upsu.net/cdn/shop/files/Pink_Essential_Hoodie_2a3589c2-096f-479f-ac60-d41e8a853d04_1024x1024@2x.jpg?v=1749131089',
                      description: 'Limited edition Essential Zip Hoodie. Premium quality, comfortable fit. Part of our Essential Range with over 20% off!',
                    ),
                    _CombinedProductCard(
                      title: 'Essential T-shirt',
                      price: '£6.00',
                      originalPrice: '£10.00',
                      imageUrl: 'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
                      description: 'Classic Essential T-shirt in sage colour. Comfortable and versatile. Great value at just £6.00!',
                    ),
                  ],
                ),
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

class _CombinedProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String originalPrice;
  final String imageUrl;
  final String description;

  const _CombinedProductCard({
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product-detail',
          arguments: {
            'title': title,
            'price': price,
            'originalPrice': originalPrice,
            'imageUrl': imageUrl,
            'description': description,
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              if (originalPrice.isNotEmpty)
                Row(
                  children: [
                    Text(
                      originalPrice,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      price,
                      style: const TextStyle(fontSize: 13, color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              else
                Text(
                  price,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
