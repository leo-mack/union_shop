import 'package:flutter/material.dart';
import 'package:union_shop/main.dart' show FooterSection;

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header (consistent with other pages)
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
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK\nLASTS!',
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
                              errorBuilder: (context, error, stackTrace) {
                                return Container(color: Colors.grey[300], width: 40, height: 40, child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)));
                              },
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
                                        Text('Shop', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_drop_down, color: Colors.black),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
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
                              Row(mainAxisSize: MainAxisSize.min, children: [TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))]),
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

            // About content
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width < 600 ? 24 : 60,
                horizontal: MediaQuery.of(context).size.width < 600 ? 16 : 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'About us',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width < 600 ? 24 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width < 600 ? 20 : 40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width < 600 ? double.infinity : 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to the Union Shop!',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width < 600 ? 14 : 16,
                            color: Colors.grey,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "We're dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width < 600 ? 12 : 14,
                            color: Colors.grey,
                            height: 1.6,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'All online purchases are available for delivery or instore collection!',
                          style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.6),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don\'t hesitate to contact us at hello@upsu.net.',
                          style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.6),
                        ),
                        SizedBox(height: 16),
                        Text('Happy shopping!', style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.6)),
                        SizedBox(height: 16),
                        Text('The Union Shop & Reception Team', style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.6)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
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
