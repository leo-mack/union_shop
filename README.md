# Union Shop

A Flutter e-commerce app I built for my coursework project. It's an online store for the University of Portsmouth Students' Union where you can browse products, manage a shopping cart, and even personalise items with custom text.

## What This App Does

I created a working online shop with these main features:
- Browse products organized into collections (Signature & Essential Range, Portsmouth City Collection)
- View individual product pages where you can pick colors and sizes
- Add items to your cart and manage quantities
- Customise products with 1-4 lines of text (costs £3 for 1 line, £5 for 2+ lines)
- See sale items with discounted prices
- Navigate between different pages using dropdown menus

## Key Features

### Shopping Experience
The app has different product collections you can browse through:
- **Signature & Essential Range** - Premium uni merchandise
- **Portsmouth City Collection** - Portsmouth themed products
- **Collections Page** - Shows all available collections
- **Sale Page** - All discounted items in one place

When you click on a product, you get taken to a detail page where you can:
- See a bigger product image
- Choose a color (Purple, Pink, Blue, Black, Navy Blue)
- Pick a size (XS, S, M, L, XL, XXL)
- Add it to your cart

The shopping cart keeps track of everything you've added. You can change quantities with +/- buttons, and it automatically calculates the total price.

### The Print Shack (Personalisation)
This is a cool feature I added where you can personalise products with custom text:
- Pick how many lines you want (1 to 4)
- Input fields appear dynamically based on your selection
- Pricing works out as £3.00 for 1 line or £5.00 for 2 or more
- Your custom text shows up in the cart with all the details

### Navigation
I made sure there's a consistent header on every page with:
- Shop dropdown menu (access all collections)
- The Print Shack dropdown (About page and Personalisation)
- Sale button
- Cart button (shows how many items you have)
- Login button

There's also a sale banner at the top and a footer at the bottom on all pages.

## Technical Details

Built using **Flutter** and **Dart**. I used:
- **ValueNotifier** for state management - this keeps the cart updated across all pages
- **Named routes** for navigation between pages
- **Singleton pattern** for the cart so there's only one cart instance
- **Material Design** widgets for the UI

The cart is reactive, meaning when you add something, the UI updates automatically without refreshing.

## Project Structure

The main code is in the `lib` folder:
- `main.dart` - Home page with the featured collections
- `cart_model.dart` - Manages the shopping cart (CartItem class and Cart logic)
- `cart_page.dart` - Displays your cart items
- `product_detail_page.dart` - Shows individual products with color/size options
- `collections_page.dart` - Overview page showing all collections
- `combined_collection.dart` - Signature & Essential Range products
- `portsmouth_city_collection.dart` - Portsmouth City themed items
- `sale_page.dart` - All the sale items
- `personalisation_page.dart` - Where you add custom text to products
- `print_shack_page.dart` - Info about The Print Shack services
- `about_page.dart` - About the Students' Union
- `login_page.dart` - Login page

I also wrote tests for each page in the `test` folder to make sure everything works properly.

### How the Cart Works

The `cart_model.dart` file is important - it handles all the cart logic. I used a **singleton pattern** so there's only one cart throughout the app. The cart uses **ValueNotifier** which means when you add or remove items, any page that's listening (like the cart icon in the header) updates automatically.

The CartItem class stores:
- Product title, price, and image
- Selected color and size
- Personalisation details (if any)
- Quantity

When you add the same product with the same color/size, it just increases the quantity instead of creating a duplicate entry.

## How to Run

You'll need Flutter installed on your computer (I used Flutter SDK 2.17.0 or higher).

1. Clone the repo:
   ```bash
   git clone https://github.com/leo-mack/union_shop.git
   cd union_shop
   ```

2. Get the dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run -d chrome      # For web
   flutter run -d android     # For Android
   flutter run -d ios         # For iOS
   ```

## How to Use

### Shopping for Products
- Start on the home page where you'll see featured collections
- Use the **Shop** dropdown to browse:
  - Collections (shows all available collections)
  - Signature & Essential Range
  - Portsmouth City Collection
- Click on any product to see more details
- On the product page, select a color and size from the dropdowns
- Click **Add to Cart**

### Personalising Items
- Go to **The Print Shack** dropdown and click **Personalisation**
- Pick how many lines of text you want (1-4)
- The input fields appear dynamically
- Type your custom text
- Price is £3 for 1 line, £5 for 2+ lines
- Add to cart and your text will show up with the item

### Managing the Cart
- Click **Cart** to see all your items
- Use the **+** and **-** buttons to change quantities
- If you reduce quantity to 0, the item gets removed
- The total price updates automatically
- For personalized items, you can see all your custom text lines
4. Sale prices are displayed in red
5. Click on any item to view details and add to cart

## Testing

I wrote tests for all the main pages to verify everything works correctly. The tests check:
- Page rendering (making sure elements appear)
- Navigation between pages
- Cart functionality (adding items, updating quantities)
- Personalisation feature
- Sale page filtering

Run the tests with:
```bash
flutter test
```

Each page has its own test file in the `test` folder. I used Flutter's widget testing framework which simulates user interactions like tapping buttons and filling in forms.

## What I Learned

This was my first proper e-commerce app and I learned a lot about:
- State management with ValueNotifier (keeping the cart synced across pages)
- Flutter navigation using named routes
- Creating reusable widgets
- Handling user input with forms and dropdowns
- Writing widget tests

The trickiest part was getting the cart to work properly - making sure duplicate items get combined instead of creating separate entries, and handling both regular products and personalized items differently.

## Future Improvements

Things I could add to make it better:
- Actual payment integration (maybe Stripe or PayPal)
- User accounts with proper authentication
- Backend database (currently products are hardcoded)
- Search and filter functionality
- Product reviews and ratings
- Image galleries for products
- Order history

## About

Made by Leo Mack  
University of Portsmouth Coursework  
December 2025

Built with Flutter and Dart.
