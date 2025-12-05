import 'dart:async';
import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/portsmouth_city_collection.dart';
import 'package:union_shop/login_page.dart';
import 'package:union_shop/product_detail_page.dart';
import 'package:union_shop/essential_range_collection.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/combined_collection.dart';
import 'package:union_shop/print_shack_page.dart';
import 'package:union_shop/personalisation_page.dart';
import 'package:union_shop/sale_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University of Portsmouth Students\' Union Store -- upsu-store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        '/cart': (context) => const CartPage(),
        '/about': (context) => const AboutPage(),
        '/print-shack': (context) => const PrintShackPage(),
        '/personalisation': (context) => const PersonalisationPage(),
        '/sale': (context) => const SalePage(),
        '/collections/portsmouth-city': (context) => const PortsmouthCityCollection(),
        '/collections/essential-range': (context) => const EssentialRangeCollection(),
        '/collections/signature-essential': (context) => const CombinedCollection(),
        '/login': (context) => const LoginPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/product-detail') {
          final args = settings.arguments as Map<String, String>?;
          return MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              title: args?['title'] ?? 'Product',
              price: args?['price'] ?? '£0.00',
              imageUrl: args?['imageUrl'] ?? '',
              description: args?['description'] ?? '',
              originalPrice: args?['originalPrice'] ?? '',
            ),
          );
        }
        return null;
      },
    );
  }
}

class HeroCarousel extends StatefulWidget {
  final double height;
  const HeroCarousel({super.key, this.height = 400});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  final PageController _controller = PageController();
  late Timer _timer;
  bool _isPlaying = true;
  int _current = 0;

  final List<String> _images = const [
    'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
    'https://images.unsplash.com/photo-1603319444400-216c0718d03c?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1668771085743-1d2d19818140?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  final List<String> _titles = const [
    'Essential Range - Over 20% OFF!',
    'The Print Shack',
    'Hungry?',
    'What\'s your next move...',
  ];

  final List<String> _subtitles = const [
    'Over 20% off our Essential Range. Come and grab yours while stock lasts!',
    'Let\'s create something uniquely you with our personalisation service --\nFrom £3 for one line of text!',
    'We got this 🍕',
    'Are you with us?',
  ];

  final List<String> _buttonLabels = const [
    'BROWSE COLLECTION',
    'FIND OUT MORE',
    'ORDER DOMINO\'S PIZZA NOW',
    'FIND YOUR STUDENT ACCOMODATION',
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!_isPlaying) return;
      final next = (_current + 1) % _images.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _goTo(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _prev() {
    final prev = (_current - 1 + _images.length) % _images.length;
    _goTo(prev);
  }

  void _next() {
    final next = (_current + 1) % _images.length;
    _goTo(next);
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _images.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (context, index) {
              return Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.45),
                  ),
                ),
              );
            },
          ),

          // Content overlay (per-slide title, subtitle, and the purple browse button)
          Positioned(
            left: 24,
            right: 24,
            top: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _titles[_current],
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  _subtitles[_current],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Navigate based on current slide
                    if (_current == 0) {
                      Navigator.pushNamed(context, '/collections/essential-range');
                    } else if (_current == 1) {
                      Navigator.pushNamed(context, '/collections/the-print-shack');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    _buttonLabels[_current],
                    style: const TextStyle(fontSize: 14, letterSpacing: 1),
                  ),
                ),
              ],
            ),
          ),

          // Controls: arrows, dots, pause
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: _prev,
                ),

                // Dots
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(_images.length, (i) {
                    return GestureDetector(
                      onTap: () => _goTo(i),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: _current == i ? 12 : 8,
                        height: _current == i ? 12 : 8,
                        decoration: BoxDecoration(
                          color: _current == i ? Colors.white : Colors.white54,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ),

                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: _next,
                ),

                const SizedBox(width: 12),

                // Pause/Play button on the right of the controls
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: _togglePlay,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

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
                              navigateToHome(context);
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
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          // Navigation bar: 4 buttons centered (with About below)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () => navigateToHome(context),
                                    child: const Text(
                                      'Home',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Shop with dropdown
                                  PopupMenuButton<String>(
                                    onSelected: (value) {
                                      if (value == 'signature-essential') {
                                        Navigator.pushNamed(context, '/collections/signature-essential');
                                      } else if (value == 'portsmouth') {
                                        Navigator.pushNamed(context, '/collections/portsmouth-city');
                                      }
                                    },
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(value: 'signature-essential', child: Text('Signature & Essential Range')),
                                      PopupMenuItem(value: 'portsmouth', child: Text('Portsmouth City Collection')),
                                    ],
                                    child: Row(
                                      children: const [
                                        Text(
                                          'Shop',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_drop_down, color: Colors.black),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // The Print Shack with dropdown
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
                                        Text(
                                          'The Print Shack',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_drop_down, color: Colors.black),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton(
                                    onPressed: () => Navigator.pushNamed(context, '/sale'),
                                    child: const Text(
                                      'Sale',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () => Navigator.pushNamed(context, '/about'),
                                    child: const Text(
                                      'About',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
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
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: () => Navigator.pushNamed(context, '/login'),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                                ),
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

            // Hero Section (carousel)
            HeroCarousel(height: 400),

            // Essential Range Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'ESSENTIAL RANGE - OVER 20% OFF!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Limited Edition Essential Zip Hoodies',
                          price: '£16.00',
                          originalPrice: '£20.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/Pink_Essential_Hoodie_2a3589c2-096f-479f-ac60-d41e8a853d04_1024x1024@2x.jpg?v=1749131089',
                          description: 'Limited edition Essential Zip Hoodie. Premium quality, comfortable fit. Part of our Essential Range with over 20% off!',
                        ),
                        ProductCard(
                          title: 'Essential T-shirt',
                          price: '£6.00',
                          originalPrice: '£10.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
                          description: 'Classic Essential T-shirt in sage colour. Comfortable and versatile. Great value at just £6.00!',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Signature Range Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'SIGNATURE RANGE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Signature Hoodie',
                          price: '£32.99',
                          originalPrice: '',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/SageHoodie_1024x1024@2x.png?v=1745583498',
                          description: 'Premium Signature Hoodie in sage colour. Perfect for any season. Quality crafted for maximum comfort and durability.',
                        ),
                        ProductCard(
                          title: 'Signature T-Shirt',
                          price: '£14.99',
                          originalPrice: '',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
                          description: 'Signature T-Shirt in indigo blue. High quality fabric with a classic design. A wardrobe staple from the Union Shop.',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Portsmouth City Collection Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'PORTSMOUTH CITY COLLECTION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Portsmouth City Postcard',
                          price: '£1.00',
                          originalPrice: '',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          description: 'Beautiful Portsmouth City Postcard featuring iconic landmarks. Share a piece of Portsmouth with friends and family.',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Magnet',
                          price: '£4.50',
                          originalPrice: '',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          description: 'Bring a bit of Portsmouth pride to your fridge, locker, or pinboard with our eye-catching Portsmouth City Magnet, featuring the artwork of renowned illustrator Julia Gash.',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Bookmark',
                          price: '£3.00',
                          originalPrice: '',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityBookmark1_1024x1024@2x.jpg?v=1752230004',
                          description: 'Portsmouth City Bookmark. Perfect for keeping your place while reading. A charming souvenir of Portsmouth.',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Keyring',
                          price: '£6.75',
                          originalPrice: '',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityKeyring_1024x1024@2x.jpg?v=1757419192',
                          description: 'Portsmouth City Keyring. A durable and stylish accessory featuring beautiful Portsmouth-inspired design.',
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/collections/portsmouth-city'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text(
                        'VIEW ALL',
                        style: TextStyle(fontSize: 14, letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  final TextEditingController _emailController = TextEditingController();
  bool _subscriptionSuccess = false;

  void _validateAndSubscribe() {
    final email = _emailController.text.trim();
    final isValid = email.endsWith('@gmail.com') || email.endsWith('@myport.ac.uk');

    if (isValid) {
      setState(() {
        _subscriptionSuccess = true;
      });
      _emailController.clear();
      // Reset after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _subscriptionSuccess = false;
          });
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email (@gmail.com or @myport.ac.uk)')),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Opening Hours
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Opening Hours',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '❄️ Winter Break Closure Dates ❄️',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Closing 4pm 19/12/2025',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    const Text(
                      'Reopening 10am 05/01/2026',
                      style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Last post date: 12pm on 18/12/2025',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '------------------------',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '(Term Time)',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Monday - Friday 10am - 4pm',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '(Outside of Term Time / Consolidation Weeks)',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Monday - Friday 10am - 3pm',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Purchase online 24/7',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              // Help and Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Help and Information',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Terms & Conditions of Sale Policy',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              // Latest Offers / Newsletter
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Latest Offers',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (!_subscriptionSuccess)
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: 'Email address',
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: _validateAndSubscribe,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text(
                              'SUBSCRIBE',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )
                    else
                      Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.green[100],
                        child: const Text(
                          '✓ Thank you for subscribing!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          // Bottom footer with social icons on left and payment methods on right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Social media buttons
              Row(
                children: [
                  IconButton(
                    icon: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/733/733547.png',
                      width: 24,
                      height: 24,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.facebook, size: 24, color: Colors.black);
                      },
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/733/733579.png',
                      width: 24,
                      height: 24,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.tag, size: 24, color: Colors.black);
                      },
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              // Payment method logos
              Wrap(
                spacing: 12,
                children: [
                  _PaymentMethodLogo('Apple Pay', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Apple_Pay_logo.svg/220px-Apple_Pay_logo.svg.png'),
                  _PaymentMethodLogo('Diners', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Diners_Club_Logo.svg/220px-Diners_Club_Logo.svg.png'),
                  _PaymentMethodLogo('Discover', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Discover_Card_logo.svg/220px-Discover_Card_logo.svg.png'),
                  _PaymentMethodLogo('Google Pay', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Google_Pay_Logo.svg/220px-Google_Pay_Logo.svg.png'),
                  _PaymentMethodLogo('Maestro', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Maestro_logo.svg/220px-Maestro_logo.svg.png'),
                  _PaymentMethodLogo('Mastercard', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Mastercard_2019_logo.svg/220px-Mastercard_2019_logo.svg.png'),
                  _PaymentMethodLogo('Shop Pay', 'https://cdn.shopify.com/s/files/1/0250/5902/8187/files/ShopPay_Logo.png'),
                  _PaymentMethodLogo('Union Pay', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/UnionPay_logo.svg/220px-UnionPay_logo.svg.png'),
                  _PaymentMethodLogo('Visa', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/220px-Visa_Inc._logo.svg.png'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '© 2025, upsu-store Powered by Shopify',
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodLogo extends StatelessWidget {
  final String name;
  final String logoUrl;

  const _PaymentMethodLogo(this.name, this.logoUrl);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      logoUrl,
      width: 45,
      height: 28,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: 45,
          height: 28,
          color: Colors.grey[300],
          child: Center(
            child: Text(
              name,
              style: const TextStyle(fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String originalPrice;
  final String imageUrl;
  final String description;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.originalPrice = '',
    this.description = 'Premium quality product from the Union Shop.',
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
