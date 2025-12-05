import 'package:flutter/material.dart';
import 'package:union_shop/main.dart' show FooterSection;
import 'package:union_shop/cart_model.dart';

class ProductDetailPage extends StatefulWidget {
  final String title;
  final String price;
  final String originalPrice;
  final String imageUrl;
  final String description;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.originalPrice = '',
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;
  String _selectedColor = '';
  String _selectedSize = '';

  final List<String> _colors = ['Purple', 'Pink', 'Blue', 'Black'];
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

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
                                    onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
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
                                  onPressed: () {},
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

            // Product Detail Content
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left: Product image gallery
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 400,
                                color: Colors.grey[200],
                                child: Image.network(
                                  widget.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported,
                                            color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Thumbnail placeholders
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black, width: 2),
                                    ),
                                    child: Image.network(
                                      widget.imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(color: Colors.grey[300]);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.grey[200],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        // Right: Product info
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 16),
                              if (widget.originalPrice.isNotEmpty)
                                Row(
                                  children: [
                                    Text(
                                      widget.originalPrice,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      widget.price,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Text(
                                  widget.price,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              const SizedBox(height: 8),
                              const Text(
                                'Tax included.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 32),
                              // Color selector
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Color: ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: _selectedColor.isEmpty ? null : _selectedColor,
                                    items: _colors.map((color) => DropdownMenuItem(value: color, child: Text(color))).toList(),
                                    onChanged: (value) => setState(() => _selectedColor = value ?? ''),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    ),
                                    hint: const Text('Select color'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Size selector
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Size: ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: _selectedSize.isEmpty ? null : _selectedSize,
                                    items: _sizes.map((size) => DropdownMenuItem(value: size, child: Text(size))).toList(),
                                    onChanged: (value) => setState(() => _selectedSize = value ?? ''),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    ),
                                    hint: const Text('Select size'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              // Quantity selector
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Quantity',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: 80,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: TextEditingController(text: '$_quantity'),
                                      onChanged: (value) {
                                        setState(() {
                                          _quantity = int.tryParse(value) ?? 1;
                                          if (_quantity < 1) _quantity = 1;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              // ADD TO CART button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_selectedColor.isEmpty || _selectedSize.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Please select color and size')),
                                        );
                                        return;
                                      }
                                      final item = CartItem(
                                        title: widget.title,
                                        price: widget.price,
                                        imageUrl: widget.imageUrl,
                                        color: _selectedColor,
                                        size: _selectedSize,
                                        quantity: _quantity,
                                      );
                                      Cart.instance.addItem(item);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Added "${widget.title}" to cart')),
                                      );
                                    },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    side: const BorderSide(color: Colors.black, width: 1),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  child: const Text(
                                    'ADD TO CART',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Buy with Shop button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4d2963),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  child: const Text(
                                    'Buy with Shop',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // More payment options
                              Center(
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'More payment options',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    // Description section
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Social sharing
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.share, color: Colors.blue),
                          label: const Text(
                            'SHARE',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border, color: Colors.black),
                          label: const Text(
                            'LIKE',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Back to collection button
                    Center(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black, width: 1),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        ),
                        child: const Text(
                          'BACK TO COLLECTION',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer (matching home page)
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
