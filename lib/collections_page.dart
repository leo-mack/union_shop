import 'package:flutter/material.dart';
import 'package:union_shop/main.dart' show FooterSection;

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: MediaQuery.of(context).size.width < 600 ? 120 : 150,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width < 600 ? 6 : 8,
                    ),
                    color: const Color(0xFF4d2963),
                    child: Text(
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width < 600 ? 10 : 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                                  TextButton(
                                    onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
                                    child: const Text('Home', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                                  ),
                                  const SizedBox(width: 12),
                                  PopupMenuButton<String>(
                                    onSelected: (String val) {
                                      if (val == 'sig-ess') {
                                        Navigator.pushNamed(context, '/collections/signature-essential');
                                      } else if (val == 'ports') {
                                        Navigator.pushNamed(context, '/collections/portsmouth-city');
                                      } else if (val == 'all') {
                                        Navigator.pushNamed(context, '/collections');
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      const PopupMenuItem<String>(value: 'sig-ess', child: Text('Signature & Essential Range')),
                                      const PopupMenuItem<String>(value: 'ports', child: Text('Portsmouth City Collection')),
                                      const PopupMenuItem<String>(value: 'all', child: Text('Collections')),
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
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width < 600 ? 20 : 40,
                horizontal: MediaQuery.of(context).size.width < 600 ? 16 : 40,
              ),
              child: Text(
                'Collections',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 600 ? 24 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Collections grid
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width < 600 ? 16.0 : 40.0,
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
                crossAxisSpacing: MediaQuery.of(context).size.width < 600 ? 16 : 40,
                mainAxisSpacing: MediaQuery.of(context).size.width < 600 ? 16 : 40,
                childAspectRatio: 1.5,
                children: const [
                  _CollectionCard(
                    title: 'Signature & Essential Range',
                    imageUrl: 'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
                    route: '/collections/signature-essential',
                  ),
                  _CollectionCard(
                    title: 'Portsmouth City Collection',
                    imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityNotebook_1024x1024@2x.jpg?v=1757419215',
                    route: '/collections/portsmouth-city',
                  ),
                  _CollectionCard(
                    title: 'The Print Shack',
                    imageUrl: 'https://shop.upsu.net/cdn/shop/files/CloseUp_1024x1024@2x.jpg?v=1614736784',
                    route: '/personalisation',
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

class _CollectionCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String route;

  const _CollectionCard({
    required this.title,
    required this.imageUrl,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey, size: 48),
                  ),
                ),
              ),
            ),
            // Dark overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
            // Title text
            Positioned.fill(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
