import 'package:flutter/material.dart';

class PortsmouthCityCollection extends StatelessWidget {
  const PortsmouthCityCollection({super.key});

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
                                    onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                                    },
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
                                    onSelected: (_) {},
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(value: 'clothing', child: Text('Clothing')),
                                      PopupMenuItem(value: 'merchandise', child: Text('Merchandise')),
                                      PopupMenuItem(value: 'halloween', child: Text('Halloween 🎃')),
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
                                    onSelected: (_) {},
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
                                    onPressed: () {},
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
                                    onPressed: () {},
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
                                  onPressed: () {},
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
            // Hero section with collection image
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.3),
                alignment: Alignment.center,
                child: const Text(
                  'Portsmouth City Collection',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Collection description
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "We're excited to launch the Portsmouth City Collection",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'This unique collection celebrates our vibrant city through Julia\'s iconic hand-drawn style - full of charm, character, and local landmarks that students and visitors alike will instantly recognise. From the Spinnaker Tower to The King\'s Theatre, each design captures the spirit of Portsmouth in bold lines and colourful detail.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Available in postcards, magnets, bookmarks and water bottles, these items make perfect mementos, gifts, or affordable keepsakes – whether you\'re a new student, proud local, or just passing through.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Filter and sort options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                children: [
                  const Text(
                    'FILTER BY',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: 'All products',
                    items: const [
                      DropdownMenuItem(value: 'All products', child: Text('All products')),
                      DropdownMenuItem(value: 'Julia Gash', child: Text('Julia Gash')),
                      DropdownMenuItem(value: 'Merchandise', child: Text('Merchandise')),
                      DropdownMenuItem(value: 'Portsmouth City Collection', child: Text('Portsmouth City Collection')),
                    ],
                    onChanged: (_) {},
                  ),
                  const Spacer(),
                  const Text(
                    'SORT BY',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: 'Featured',
                    items: const [
                      DropdownMenuItem(value: 'Featured', child: Text('Featured')),
                      DropdownMenuItem(value: 'Best selling', child: Text('Best selling')),
                      DropdownMenuItem(value: 'Alphabetically, A-Z', child: Text('Alphabetically, A-Z')),
                      DropdownMenuItem(value: 'Alphabetically, Z-A', child: Text('Alphabetically, Z-A')),
                      DropdownMenuItem(value: 'Price, low to high', child: Text('Price, low to high')),
                      DropdownMenuItem(value: 'Price, high to low', child: Text('Price, high to low')),
                      DropdownMenuItem(value: 'Date, old to new', child: Text('Date, old to new')),
                      DropdownMenuItem(value: 'Date, new to old', child: Text('Date, new to old')),
                    ],
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(right: 24.0, bottom: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '7 products',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),

            // Products grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 32,
                childAspectRatio: 0.75,
                children: const [
                  _CollectionProductCard(
                    title: 'Portsmouth City Magnet',
                    price: '£4.50',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                    description: 'Bring a bit of Portsmouth pride to your fridge, locker, or pinboard with our eye-catching Portsmouth City Magnet, featuring the artwork of renowned illustrator Julia Gash.',
                  ),
                  _CollectionProductCard(
                    title: 'Portsmouth City Postcard',
                    price: '£1.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                    description: 'Beautiful Portsmouth City Postcard featuring iconic landmarks. Share a piece of Portsmouth with friends and family.',
                  ),
                  _CollectionProductCard(
                    title: 'Portsmouth City Bookmark',
                    price: '£3.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityBookmark1_1024x1024@2x.jpg?v=1752230004',
                    description: 'Portsmouth City Bookmark. Perfect for keeping your place while reading. A charming souvenir of Portsmouth.',
                  ),
                  _CollectionProductCard(
                    title: 'Portsmouth City Keyring',
                    price: '£6.75',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityKeyring_1024x1024@2x.jpg?v=1757419192',
                    description: 'Portsmouth City Keyring. A durable and stylish accessory featuring beautiful Portsmouth-inspired design.',
                  ),
                  _CollectionProductCard(
                    title: 'Portsmouth City Notebook',
                    price: '£7.50',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityNotebook_1024x1024@2x.jpg?v=1757419192',
                    description: 'Portsmouth City Notebook. Perfect for writing, studying, or journaling. A stylish Portsmouth souvenir.',
                  ),
                  _CollectionProductCard(
                    title: 'Portsmouth City Coaster',
                    price: '£4.50',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityCoaster_1024x1024@2x.jpg?v=1757419192',
                    description: 'Portsmouth City Coaster. Protect your furniture while displaying Portsmouth pride. Set of durable coasters.',
                  ),
                  _CollectionProductCard(
                    title: 'Portsmouth City Water Bottle',
                    price: '£12.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityWaterBottle5_1024x1024@2x.jpg?v=1755251995',
                    description: 'Portsmouth City Water Bottle. Keep hydrated in style with this eco-friendly water bottle featuring Portsmouth design.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _CollectionProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String description;

  const _CollectionProductCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.description = 'Premium quality product from the Portsmouth City Collection.',
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
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: const TextStyle(fontSize: 13, color: Colors.black),
        ),
          ],
        ),
      );
  }
}
