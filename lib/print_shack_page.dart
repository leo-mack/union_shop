import 'package:flutter/material.dart';
import 'package:union_shop/main.dart' show FooterSection;

class PrintShackPage extends StatelessWidget {
  const PrintShackPage({super.key});

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
                                    onSelected: (String value) {
                                      if (value == 'sig-ess') {
                                        Navigator.pushNamed(context, '/collections/signature-essential');
                                      } else if (value == 'ports') {
                                        Navigator.pushNamed(context, '/collections/portsmouth-city');
                                      } else if (value == 'collections') {
                                        Navigator.pushNamed(context, '/collections');
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(value: 'sig-ess', child: Text('Signature & Essential Range')),
                                      const PopupMenuItem<String>(value: 'ports', child: Text('Portsmouth City Collection')),
                                      const PopupMenuItem<String>(value: 'collections', child: Text('Collections')),
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
                                    onSelected: (String value) {
                                      if (value == 'about') {
                                        Navigator.pushNamed(context, '/print-shack');
                                      } else if (value == 'personalisation') {
                                        Navigator.pushNamed(context, '/personalisation');
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(value: 'about', child: Text('About')),
                                      const PopupMenuItem<String>(value: 'personalisation', child: Text('Personalisation')),
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
                                children: [
                                  TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500))),
                                ],
                              ),
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

            // Page title
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: const Text(
                'The Union Print Shack',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),

            // Hero images
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SizedBox(
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 600,
                      child: Image.network(
                        'https://cdn.shopify.com/s/files/1/0226/4599/7643/files/The_Union_Print_Shack_Logo_-_Personalisation.png?v=1760535658',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300]),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content sections
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Make It Yours at The Union Print Shack', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                    SizedBox(height: 12),
                    Text('Want to add a personal touch? We\'ve got you covered with heat-pressed customisation on all our clothing. Swing by the shop - our team\'s always happy to help you pick the right gear and answer any questions.', style: TextStyle(fontSize: 14, color: Color(0xFF666666), height: 1.6)),
                    SizedBox(height: 28),
                    Text('Uni Gear or Your Gear – We\'ll Personalise It', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                    SizedBox(height: 12),
                    Text('Whether you\'re repping your university or putting your own spin on a hoodie you already own, we\'ve got you covered. We can personalise official uni-branded clothing and your own items - just bring them in and let\'s get creative!', style: TextStyle(fontSize: 14, color: Color(0xFF666666), height: 1.6)),
                    SizedBox(height: 28),
                    Text('Simple Pricing, No Surprises', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                    SizedBox(height: 12),
                    Text('Customising your gear won\'t break the bank - just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. Turnaround time is up to three working days, and we\'ll let you know as soon as it\'s ready to collect.', style: TextStyle(fontSize: 14, color: Color(0xFF666666), height: 1.6)),
                    SizedBox(height: 28),
                    Text('Personalisation Terms & Conditions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                    SizedBox(height: 12),
                    Text('We will print your clothing exactly as you have provided it to us, whether online or in person. We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. Refunds are not provided for any personalised items.', style: TextStyle(fontSize: 14, color: Color(0xFF666666), height: 1.6)),
                    SizedBox(height: 28),
                    Text('Ready to Make It Yours?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                    SizedBox(height: 12),
                    Text('Pop in or get in touch today - let\'s create something uniquely you with our personalisation service - The Union Print Shack!', style: TextStyle(fontSize: 14, color: Color(0xFF666666), height: 1.6)),
                  ],
                ),
              ),
            ),

            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
