# Union Shop - University of Portsmouth Students' Union Store

A  Flutter e-commerce application developed as coursework for the University of Portsmouth Students' Union online store. This application provides a full on shopping experience with product browsing, cart management, personalisation services, and multiple product collections.

##  Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Technical Implementation](#technical-implementation)
- [Installation](#installation)
- [Usage](#usage)
- [Pages Overview](#pages-overview)
- [State Management](#state-management)
- [Testing](#testing)
- [Future Enhancements](#future-enhancements)

##  Features

### Core E-Commerce Functionality
- **Product Browsing**: View products organized by collections
- **Product Details**: Detailed product pages with color and size selection
- **Shopping Cart**: Add, remove, and update product quantities
- **Cart Persistence**: Cart state maintained across navigation using ValueNotifier
- **Price Calculation**: Dynamic total price calculation with real-time updates

### Product Collections
- **Signature & Essential Range**: Combined collection showcasing premium university merchandise
- **Portsmouth City Collection**: City-themed products for the city Portsmouth
- **Collections Overview**: Dedicated page showcasing all available collections
- **Sale Section**: Dedicated page displaying products with discounted prices

### Personalisation Service
- **Text Customisation**: Add 1-4 lines of custom text to products
- **Dynamic Pricing**: £3.00 for 1 line, £5.00 for 2+ lines
- **Custom Input Fields**: Dynamic form fields based on line selection
- **Personalisation Display**: Custom text shown in cart with line-by-line breakdown

### Navigation & UI
- **Responsive Header**: Consistent navigation bar across all pages
- **Dropdown Menus**: 
  - Shop dropdown (Collections, Signature & Essential Range, Portsmouth City)
  - Print Shack dropdown (About, Personalisation)
- **Sale Banner**: Promotional banner highlighting current sales
- **Footer**: Comprehensive footer with links and information
- **Breadcrumb Navigation**: Clear navigation paths throughout the app

### Additional Features
- **Print Shack Information**: Dedicated page about personalisation services
- **About Page**: Information about the Students' Union
- **Login System**: User authentication interface
- **Product Variants**: Support for color and size options
- **Sale Pricing**: Display both original and sale prices

## 📁 Project Structure

```
union_shop/
├── lib/
│   ├── main.dart                          # App entry point and home screen
│   ├── cart_model.dart                    # Cart state management model
│   ├── cart_page.dart                     # Shopping cart display
│   ├── product_page.dart                  # Product listing page
│   ├── product_detail_page.dart           # Individual product details
│   ├── collections_page.dart              # Collections overview
│   ├── combined_collection.dart           # Signature & Essential Range
│   ├── portsmouth_city_collection.dart    # Portsmouth City Collection
│   ├── essential_range_collection.dart    # Essential Range Collection
│   ├── sale_page.dart                     # Sale products page
│   ├── personalisation_page.dart          # Text personalisation service
│   ├── print_shack_page.dart             # Print Shack information
│   ├── about_page.dart                    # About the Union
│   └── login_page.dart                    # User authentication
├── test/
│   ├── home_test.dart                     # Home screen tests
│   └── product_test.dart                  # Product functionality tests
├── android/                               # Android platform files
├── ios/                                   # iOS platform files
├── web/                                   # Web platform files
├── pubspec.yaml                           # Project dependencies
└── README.md                              # This file
```

##  Technical Implementation

### Framework & Language
- **Flutter**: Cross-platform mobile/web framework
- **Dart**: Programming language
- **Material Design**: UI component library

### State Management
The application uses **ValueNotifier** and **ValueListenableBuilder** for reactive state management:

```dart
// Global cart instance
final cart = CartModel();

// Reactive UI updates
ValueListenableBuilder<List<CartItem>>(
  valueListenable: cart.items,
  builder: (context, items, child) {
    // UI rebuilds automatically when cart changes
  },
)
```

### Data Models

#### CartItem Model
Supports both regular products and personalised items:
- `title`: Product name
- `price`: Product price
- `imageUrl`: Product image path
- `color`: Selected color variant (optional)
- `size`: Selected size variant (optional)
- `personalisationLines`: Number of custom text lines (optional)
- `personalisationText`: List of custom text strings (optional)
- `quantity`: Number of items

### Navigation
Uses Flutter's named routes with `onGenerateRoute` for dynamic routing:
- Static routes: `/`, `/cart`, `/about`, `/sale`, etc.
- Dynamic routes: `/product-detail` with arguments
- Route parameters passed via `Navigator.pushNamed()` arguments

### Key Design Patterns
1. **Separation of Concerns**: Models, views, and business logic separated
2. **Reactive Programming**: ValueNotifier for state updates
3. **Widget Composition**: Reusable components across pages
4. **Null Safety**: Full Dart null safety implementation

##  Installation

### Prerequisites
- Flutter SDK (>=2.17.0 <4.0.0)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio (recommended IDEs)

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/leo-mack/union_shop.git
   cd union_shop
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # For web
   flutter run -d chrome
   
   # For Android
   flutter run -d android
   
   # For iOS
   flutter run -d ios
   ```

4. **Build for production**
   ```bash
   # Web
   flutter build web
   
   # Android APK
   flutter build apk
   
   # iOS
   flutter build ios
   ```

##  Usage

### Adding Products to Cart

1. Navigate to a collection (Shop dropdown → choose collection)
2. Click on a product to view details
3. For regular products:
   - Select color from dropdown
   - Select size from dropdown
   - Click "Add to Cart"
4. For personalised products:
   - Go to Print Shack → Personalisation
   - Choose number of lines (1-4)
   - Enter custom text for each line
   - Click "Add to Cart"

### Managing Cart

1. Click "Cart" in the navigation bar
2. View all added items with details
3. Adjust quantities using +/- buttons
4. Remove items by reducing quantity to 0
5. View total price at the bottom

### Browsing Collections

1. Click "Shop" dropdown in navigation
2. Options:
   - **Collections**: Overview of all collections
   - **Signature & Essential Range**: Premium products
   - **Portsmouth City Collection**: City-themed items

### Viewing Sale Items

1. Click "Sale" button in navigation bar
2. Browse all discounted products
3. Original prices shown with strikethrough
4. Sale prices displayed in red

##  Pages Overview

### Home Screen (`main.dart`)
- Hero banner with sale announcement
- Featured collections showcase
- Navigation to all major sections
- Quick access to cart and login

### Collections Page (`collections_page.dart`)
- Visual showcase of all collections
- Hero images for each collection
- Direct navigation to collection pages
- Descriptions of each collection

### Product Detail Page (`product_detail_page.dart`)
- Large product image
- Color selection dropdown
- Size selection dropdown
- Add to cart functionality
- Price display

### Cart Page (`cart_page.dart`)
- List of all cart items
- Product images and details
- Quantity controls
- Remove item functionality
- Total price calculation
- Display of personalisation details

### Personalisation Page (`personalisation_page.dart`)
- Product preview
- Line count selector (1-4 lines)
- Dynamic text input fields
- Price calculation based on lines
- Add to cart with custom text

### Sale Page (`sale_page.dart`)
- Grid layout of sale products
- Original price (strikethrough)
- Sale price (red highlight)
- Filters products with `originalPrice` set

### Print Shack Page (`print_shack_page.dart`)
- Service information
- Personalisation options
- Hero images
- Contact information

## State Management

### CartModel Implementation

The `CartModel` class manages the shopping cart state:

```dart
class CartModel {
  final ValueNotifier<List<CartItem>> items = ValueNotifier([]);
  
  void addItem(CartItem item) { }
  void removeItem(CartItem item) { }
  void updateQuantity(CartItem item, int newQuantity) { }
  double get totalPrice { }
  int get totalItems { }
}
```

**Key Features:**
- Automatic duplicate detection (same product + variants)
- Quantity aggregation for identical items
- Personalisation comparison for custom items
- Real-time total calculation
- Item count tracking

### Reactive UI Updates

All cart-dependent UI elements use `ValueListenableBuilder`:
- Cart item count badge
- Cart page product list
- Total price display
- Empty cart messages

## Testing

### Test Files
- `test/home_test.dart`: Home screen widget tests
- `test/product_test.dart`: Product functionality tests

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/home_test.dart

# Run with coverage
flutter test --coverage
```

### Test Coverage
- Widget rendering tests
- Navigation flow tests
- Cart functionality tests
- State management tests

## 🔮 Future Enhancements

### Planned Features
1. **Backend Integration**
   - REST API connection
   - Real-time inventory management
   - Order history tracking

2. **User Accounts**
   - User profiles
   - Saved addresses
   - Order history
   - Wishlist functionality

3. **Payment Integration**
   - Secure checkout process
   - Multiple payment methods
   - Order confirmation emails

4. **Advanced Features**
   - Product search functionality
   - Filter and sort options
   - Product reviews and ratings
   - Image zoom and gallery view
   - Size guide modal

5. **Performance Optimizations**
   - Image caching
   - Lazy loading
   - Pagination for product lists

6. **Accessibility**
   - Screen reader support
   - Keyboard navigation

## Development Notes

### Code Style
- Follows Flutter/Dart style guidelines
- Consistent naming conventions
- Comprehensive inline documentation
- Null safety enforced

### Dependencies
- `flutter`: Core framework
- `cupertino_icons`: iOS-style icons
- `flutter_test`: Testing framework
- `flutter_lints`: Linting rules

### Platform Support
-  Web
-  iOS
-  Linux
-  macOS
-  Windows

##  Author

**Leo Mack**
- GitHub: [@leo-mack](https://github.com/leo-mack)
- Project: University of Portsmouth Coursework TB1

##  License

This project is developed as coursework for the University of Portsmouth.

##  Acknowledgments

- Help from Friends
- Course instructors for guidance and feedback

---

**Version**: 1.0.0  
**Last Updated**: December 2025  
**Flutter Version**: >=2.17.0 <4.0.0
