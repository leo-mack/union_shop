import 'package:flutter/material.dart';
import 'package:union_shop/main.dart' show FooterSection;

class SalePage extends StatelessWidget {
  const SalePage({super.key});

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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
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
                              errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300], width: 40, height: 40),
                            ),
                          ),
                          const Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false), child: const Text('Home', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                                  const SizedBox(width: 12),
                                  PopupMenuButton<String>(
                                    onSelected: (String val) {
                                      if (val == 'sig-ess') {
                                        Navigator.pushNamed(context, '/collections/signature-essential');
                                      } else if (val == 'ports') {
                                        Navigator.pushNamed(context, '/collections/portsmouth-city');
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      const PopupMenuItem<String>(value: 'sig-ess', child: Text('Signature & Essential Range')),
                                      const PopupMenuItem<String>(value: 'ports', child: Text('Portsmouth City Collection')),
                                    ],
                                    child: const Row(
                                      children: [
                                        Text('Shop', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_drop_down, color: Colors.black),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  PopupMenuButton<String>(
                                    onSelected: (String val) {
                                      if (val == 'about') Navigator.pushNamed(context, '/print-shack');
                                      else if (val == 'pers') Navigator.pushNamed(context, '/personalisation');
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      const PopupMenuItem<String>(value: 'about', child: Text('About')),
                                      const PopupMenuItem<String>(value: 'pers', child: Text('Personalisation')),
                                    ],
                                    child: const Row(
                                      children: [
                                        Text('The Print Shack', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_drop_down, color: Colors.black),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton(onPressed: () => Navigator.pushNamed(context, '/sale'), child: const Text('SALE!', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(icon: const Icon(Icons.search, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () {}),
                              IconButton(icon: const Icon(Icons.person_outline, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () => Navigator.pushNamed(context, '/login')),
                              IconButton(icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey), padding: const EdgeInsets.all(8), constraints: const BoxConstraints(minWidth: 32, minHeight: 32), onPressed: () => Navigator.pushNamed(context, '/cart')),
                            ],
                          ),
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
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: const Text(
                'Sale',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),

            // Sale products
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                childAspectRatio: 0.75,
                children: const [
                  _SaleProductCard(
                    title: 'Limited Edition Essential Zip Hoodies',
                    price: '£16.00',
                    originalPrice: '£20.00',
                    imageUrl: 'https://shop.upsu.net/cdn/shop/files/Pink_Essential_Hoodie_2a3589c2-096f-479f-ac60-d41e8a853d04_1024x1024@2x.jpg?v=1749131089',
                    description: 'Limited edition Essential Zip Hoodie. Premium quality, comfortable fit. Part of our Essential Range with over 20% off!',
                  ),
                  _SaleProductCard(
                    title: 'Essential T-shirt',
                    price: '£6.00',
                    originalPrice: '£10.00',
                    imageUrl: 'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
                    description: 'Classic Essential T-shirt in sage colour. Comfortable and versatile. Great value at just £6.00!',
                  ),
                ],
              ),
            ),

            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _SaleProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String originalPrice;
  final String imageUrl;
  final String description;

  const _SaleProductCard({
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.description,
  });

  void _navigateToDetail(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/product-detail',
      arguments: {
        'title': title,
        'price': price,
        'imageUrl': imageUrl,
        'description': description,
        'originalPrice': originalPrice,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        originalPrice,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
