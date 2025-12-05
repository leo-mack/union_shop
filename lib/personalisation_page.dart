import 'package:flutter/material.dart';
import 'package:union_shop/main.dart' show FooterSection;
import 'package:union_shop/cart_model.dart';

class PersonalisationPage extends StatefulWidget {
  const PersonalisationPage({super.key});

  @override
  State<PersonalisationPage> createState() => _PersonalisationPageState();
}

class _PersonalisationPageState extends State<PersonalisationPage> {
  int _selectedLines = 1;
  final List<TextEditingController> _personalisationControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  int _quantity = 1;

  @override
  void dispose() {
    for (var controller in _personalisationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addToCart() {
    final personalisationText = _personalisationControllers
        .take(_selectedLines)
        .map((c) => c.text)
        .toList();

    final item = CartItem(
      title: 'Personalisation',
      price: _selectedLines == 1 ? '£3.00' : '£5.00',
      imageUrl: 'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',
      color: '',
      size: '',
      personalisationLines: _selectedLines == 1 ? 'One Line of Text' : '$_selectedLines Lines of Text',
      personalisationText: personalisationText,
      quantity: _quantity,
    );

    Cart.instance.addItem(item);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart!')),
    );
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
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      const PopupMenuItem<String>(value: 'sig-ess', child: Text('Signature & Essential Range')),
                                      const PopupMenuItem<String>(value: 'ports', child: Text('Portsmouth City Collection')),
                                    ],
                                    child: const Row(
                                      children: [Text('Shop', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)), SizedBox(width: 4), Icon(Icons.arrow_drop_down, color: Colors.black)],
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
                                      children: [Text('The Print Shack', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)), SizedBox(width: 4), Icon(Icons.arrow_drop_down, color: Colors.black)],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton(onPressed: () {}, child: const Text('SALE!', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
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

            // Main content
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side - Product image
                  Expanded(
                    child: Column(
                      children: [
                        Image.network(
                          'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',
                          fit: BoxFit.cover,
                          height: 500,
                          errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300], height: 500),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                                child: Image.network(
                                  'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300]),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  // Right side - Product details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Personalisation', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                        const SizedBox(height: 16),
                        Text(
                          _selectedLines == 1 ? '£3.00' : '£5.00',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        const Text('Tax included.', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        const SizedBox(height: 28),
                        const Text('Number of Lines:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<int>(
                          value: _selectedLines,
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
                          items: const [
                            DropdownMenuItem(value: 1, child: Text('1 Line of Text')),
                            DropdownMenuItem(value: 2, child: Text('2 Lines of Text')),
                            DropdownMenuItem(value: 3, child: Text('3 Lines of Text')),
                            DropdownMenuItem(value: 4, child: Text('4 Lines of Text')),
                          ],
                          onChanged: (int? val) => setState(() => _selectedLines = val ?? 1),
                        ),
                        const SizedBox(height: 28),
                        ...List.generate(_selectedLines, (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personalisation Line ${index + 1}:',
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _personalisationControllers[index],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              ),
                            ),
                            const SizedBox(height: 28),
                          ],
                        )),
                        const Text('Quantity', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            initialValue: _quantity.toString(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
                            onChanged: (val) => setState(() => _quantity = int.tryParse(val) ?? 1),
                          ),
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _addToCart,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              side: const BorderSide(color: Colors.black, width: 1),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                            ),
                            child: const Text('ADD TO CART', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1)),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text('£3 for one line of text! £5 for two!', style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 12),
                        const Text('One line of text is 10 characters.', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        const SizedBox(height: 24),
                        const Text('Please ensure all spellings are correct before submitting your purchase as we will print your item with the exact wording you provide. We will not be responsible for any incorrect spellings printed onto your garment. Personalised items do not qualify for refunds.', style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.6)),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            GestureDetector(onTap: () {}, child: const Text('SHARE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.blue))),
                            const SizedBox(width: 24),
                            GestureDetector(onTap: () {}, child: const Text('TWEET', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.blue))),
                            const SizedBox(width: 24),
                            GestureDetector(onTap: () {}, child: const Text('PIN IT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.blue))),
                          ],
                        ),
                      ],
                    ),
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
