# Union Shop - Functional Requirements Analysis

## Homepage (https://shop.upsu.net/)

### Navigation & Header
- **Top Navigation Bar**: Contains menu items leading to other pages
- **Mobile Navigation**: Collapsible/hamburger menu for mobile devices
- **Responsive Design**: Different layouts for desktop vs mobile

### Main Content Areas
- **Hero Section**: "The Print Shack" branding area
- **Product Showcase Sections**:
  - "Essential Basics - Over 50% Off" section with product cards
  - "Adventure Bound" section with product cards  
  - "Portsmouth Sticker Collection" section with product cards
  - "Our Range" section with category cards (Hoodies, Sweatshirts, Loungewear, Sale)

### Product Cards (on homepage)
- Product images
- Product names/titles
- Pricing information
- Links to individual product pages

### Footer
- **Social Media Links**: Links to social platforms
- **Mailing List Signup**: Email subscription functionality
- **Opening Hours**: Display of store hours
- **Help Section**: Support/help links
- **Search Functionality**: Search feature
- **Additional Links**: Various other navigation links

### Interactive Elements
- Navigation between pages
- Product card interactions (clicking leads to product pages)
- Mobile menu toggle
- Email signup form
- Social media link navigation

---

## Notes for Marking Criteria
- Focus on functionality replication, not visual design
- Key areas: Navigation, product display, responsive behavior, interactive elements

---

## Collections Page (https://shop.upsu.net/collections/)

### Layout & Structure
- **Grid Layout**: Collections displayed in a responsive grid format
- **Collection Cards**: Each collection has its own card with:
  - Collection image/thumbnail
  - Collection name/title overlay
  - Clickable functionality to navigate to collection listings

### Visible Collections (from screenshots)
- Adventure Essentials
- Black Friday 2024
- Portsmouth Essentials
- Essential Originals
- Essential Range
- Sweatshirts
- Hooded Edition Essentials Originals
- Merchandise
- Nike Tech Chance
- Your Personalised Here
- Portsmouth Sticker Collection
- Pride Collection
- SALE
- Signature & Essential Range
- Signature Range
- Shark Club
- Witton Uni Apprentice
- Student Casual Tee
- Student Scrubs
- Witton Uni Essentials
- Summer Essentials
- University Clothing
- Vintage Merchandise
- UPSU Socs
- Apparel Essentials

### Functionality Requirements
- **Navigation**: Clicking each collection card navigates to that collection's product listing
- **Responsive Grid**: Layout adapts between desktop and mobile views
- **Collection Organization**: Collections are organized and displayed systematically
- **Visual Hierarchy**: Clear visual distinction between different collections

### Footer & Navigation
- Same footer structure as homepage (social links, mailing list, opening hours, etc.)
- Same navigation structure as other pages

---

## Collection Listing Page (e.g., https://shop.upsu.net/collections/autumn-favourites)

### Page Header & Info
- **Collection Title**: "Autumn Favourites" (dynamic based on collection)
- **Collection Description**: "Shop all of this seasons must haves in one place!"
- **Product Count**: Shows total number of products (e.g., "10 products")

### Filtering & Sorting Controls
- **Filter By Dropdown**: "All products" with filtering options based on collection content
  - Available filters vary by collection (e.g., Clothing, Merchandise, Popular, PSUT, UniversityMerch)
  - Dynamic filtering based on what's actually in the collection
- **Sort By Dropdown**: Multiple sorting options
  - Featured (default)
  - Best selling
  - Alphabetically (A-Z)
  - Alphabetically (Z-A)  
  - Price (Low to High)
  - Price (High to Low)
  - Date (Old to New)
  - Date (New to Old)

### Product Grid Display
- **Responsive Grid Layout**: Products displayed in grid format
- **Product Cards**: Each product shows:
  - Product image
  - Product name/title
  - Price (including sale prices with strikethrough for original price)
  - "SALE" badge for discounted items
  - Clickable to navigate to individual product page

### Sample Products (from Autumn Favourites)
- Classic Sweatshirts (£23.00)
- Classic T-Shirts (£11.00)
- Classic Hoodies (£28.00)
- Classic Beanie Hat (£12.00)
- Lanyards (£2.75)
- Keep Cups (£6.50)
- A5 Notepad (Sold out)
- Pen (£1.00)
- Classic Sweatshirts - Neutral (£19.00, was £10.00 - SALE)

### Pagination
- **Multi-page Support**: Collections can span multiple pages
- **Page Navigation**: "Page 1 of 2" with navigation controls
- **Page Controls**: Previous/Next buttons for navigation

### Interactive Features
- **Filter Application**: Real-time filtering of products
- **Sort Application**: Real-time sorting of product display
- **Product Navigation**: Clicking products leads to individual product pages
- **Pagination Navigation**: Moving between pages of results

### Footer & Navigation
- Same footer structure as other pages
- Same navigation structure

---

## Sale Collection Page (https://shop.upsu.net/collections/sale-items)

### Special Collection Features
- **Dedicated Sale Section**: "SALE" link in main navigation bar
- **Sale-Specific Branding**: Page title "SALE" with promotional messaging
- **Sale Description**: "Don't miss out! Get yours before they're all gone!"
- **Discount Information**: "All prices shown are inclusive of the discount %" note

### Sale Product Display
- **Sale Badge Visibility**: Products show "SALE" badges prominently
- **Price Display**: Shows both original and discounted prices
  - Example: Classic Sweatshirts - Neutral (£19.00, was £10.99)
- **Sold Out Handling**: Some sale items may be "Sold out" (e.g., Nike Academy 18 Tech Pants)
- **Product Count**: Shows total sale items available (e.g., "76 products")

### Sample Sale Products (from screenshot)
- A5 Notepad (Sold out)
- Classic Sweatshirts - Neutral (£19.00, was £10.99)
- Recycled Notebook (£1.50)
- iPhone 5/6 Charge & Sync Cable (£3.00, was £5.60)
- Type C Charge & Sync Cable (£3.00, was £4.99)
- USB to USB Charge & Sync Cables (£3.00, was £4.60)
- Dimple Pop Fidget Keyring (£1.40, was £0.99)
- Nike Academy 18 Tech Pants (M) (Sold out)
- Nike Academy 18 Tech Pants (W) (£24.99, was £7.00)

### Standard Collection Functionality
- **Same Layout Structure**: Uses identical layout to other collection pages
- **Filtering & Sorting**: Same filtering and sorting options as regular collections
  - Filter by: All products dropdown
  - Sort by: Best selling dropdown (and other standard options)
- **Pagination**: Multi-page support ("Page 1 of 2")
- **Product Grid**: Responsive grid layout identical to other collections

### Sale-Specific Features
- **Promotional Banner**: Top banner highlighting sale ("BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF!")
- **Urgency Messaging**: "Don't miss out! Get yours before they're all gone!"
- **Clear Discount Display**: Strikethrough original prices with sale prices
- **Stock Status**: Clear indication of sold out items

### Interactive Features
- **Same Navigation**: All standard collection page interactions
- **Sale Product Selection**: Clicking sale products leads to individual product pages
- **Price Comparison**: Visual comparison between original and sale prices

---

## Individual Product Page (e.g., https://shop.upsu.net/collections/autumn-favourites/products/classic-sweatshirt-1)

### Product Images & Gallery
- **Main Product Image**: Large primary product image display
- **Image Thumbnails**: Multiple product images shown as clickable thumbnails below main image
- **Image Hover Zoom**: Hovering over main image shows zoomed version in same location (no popup/carousel)
- **Multiple Views**: Different angles/colors of the product available

### Product Information
- **Product Title**: "Classic Sweatshirts"
- **Price Display**: £23.00 with "Tax included" note
- **Product Description**: Text description of the product
  - "Bringing to you, our best selling Classic Sweatshirt. Available in 4 different colours."
  - "Soft, comfortable, 50% cotton and 50% polyester."

### Product Customization Options
- **Color Selection**: Dropdown menu for available colors
  - Example: "Black" (with other color options)
- **Size Selection**: Dropdown menu for available sizes  
  - Example: "S" (with other size options like M, L, XL)
- **Size Guide**: Available for products with size options
- **Quantity Selector**: Input field/dropdown to select quantity (default: 1)

### Purchase Options
- **Add to Cart Button**: Primary action button "ADD TO CART"
- **Buy with Shop Button**: Purple "Buy with Shop" button (external Shop app integration)
- **More Payment Options**: Link to additional payment methods
  - Leads to external Shop app with Google Pay and other options
  - Note: External payment integrations not required for coursework

### Social Sharing
- **Share Buttons**: Social media sharing options
  - Share on Facebook
  - Tweet on Twitter  
  - Pin on Pinterest

### Navigation
- **Back to Collection**: "← BACK TO AUTUMN FAVOURITES" link
- **Breadcrumb Navigation**: Shows path back to collection

### Size Guide Feature
- **Size Chart**: Available for applicable products
- **Size Information**: Detailed sizing information for customer reference

### Interactive Features
- **Image Gallery Navigation**: Click thumbnails to change main image
- **Hover Zoom**: Image zoom on hover functionality
- **Option Selection**: Dynamic dropdown menus for customization
- **Quantity Management**: Increase/decrease quantity before adding to cart
- **Social Sharing**: Functional social media sharing buttons

### Footer & Navigation
- Same footer structure as other pages
- Same navigation structure

---

## Shopping Cart Page (https://shop.upsu.net/cart)

### Navigation & Cart Indicator
- **Cart Icon Badge**: Cart icon in navbar shows notification count of items in cart
- **Dynamic Count**: Badge updates when items are added/removed from cart
- **Cart Access**: Clicking cart icon navigates to cart page

### Cart Header
- **Page Title**: "Your cart"
- **Continue Shopping Link**: Link to return to shopping/collections

### Cart Items Display
- **Product Table Layout**: Organized table with columns:
  - Product (image + details)
  - Price (individual item price)
  - Quantity (editable)
  - Total (calculated per item)

### Individual Cart Item Features
- **Product Image**: Thumbnail image of the product
- **Product Details**: 
  - Product name (e.g., "Classic Sweatshirts")
  - Selected options (Color: Black, Size: S)
- **Price Display**: Individual item price (£23.00)
- **Quantity Management**: 
  - Editable quantity field
  - Ability to increase/decrease quantity
- **Remove Option**: "Remove" link to delete item from cart
- **Line Total**: Calculated total for each item (price × quantity)

### Cart Summary
- **Subtotal Calculation**: Shows total of all items (£23.00)
- **Tax Information**: "Tax included and shipping calculated at checkout"
- **Order Notes**: "Add a note to your order" text area for customer comments

### Cart Actions
- **UPDATE Button**: Apply quantity changes to cart
- **CHECK OUT Button**: Primary checkout action (purple button)
- **Fast Checkout Options**:
  - "Shop" button (purple - external Shop app integration)
  - "G Pay" button (black - Google Pay integration)
  - Note: External payment integrations not required for coursework

### Interactive Features
- **Quantity Updates**: Real-time or on-demand quantity changes
- **Item Removal**: Remove individual items from cart
- **Cart Persistence**: Cart contents maintained across sessions
- **Price Calculations**: Automatic subtotal and total calculations
- **Order Notes**: Customer can add special instructions

### Empty Cart State
- **Empty Cart Handling**: Display when no items in cart
- **Continue Shopping**: Encourage return to product browsing

### Footer & Navigation
- Same footer structure as other pages
- Same navigation structure

---

## User Authentication (Sign In Page)

### Navigation to Authentication
- **Avatar Icon**: User avatar/account icon in header navigation
- **Sign In Access**: Clicking avatar icon navigates to authentication page
- **External Authentication**: Uses Shopify authentication system (external URL)

### Sign In Options
- **Multiple Authentication Methods**:
  - Email-based sign in (primary method)
  - Shop account integration (external Shop app)
- **Authentication Flow**: External Shopify authentication system
  - Note: For coursework, students should implement basic authentication UI/flow
  - External Shopify integration not required - focus on login/signup forms and state management

### Sign In Form
- **Email Input**: Email address field for account login
- **Continue Button**: Proceed with email-based authentication
- **Alternative Options**: "Sign in with Shop" button for Shop app integration

### Authentication State Management
- **Login Status**: Track user authentication state across the application
- **User Session**: Maintain user session after successful login
- **Account Access**: Authenticated users can access account features
- **Guest vs. Authenticated**: Different functionality available based on login status

### Coursework Implementation Notes
- **Focus Area**: Basic authentication UI and state management
- **External Integration**: Shopify/Shop app integration not required
- **Core Functionality**: Login forms, signup forms, session management
- **User Experience**: Proper authentication flow and user feedback

---

## User Account Dashboard (Post-Login)

### Account Navigation
- **Account Access**: After successful login, users access account dashboard
- **Avatar Menu**: Clicking avatar icon shows account options when logged in
- **Account Sections**: Multiple sections accessible from account area

### Orders Section (Default Landing Page)
- **Orders Overview**: "Orders" page as main account landing page
- **Order History**: Display of past orders (if any exist)
- **Order Status**: Show status of each order (e.g., Processing, Shipped, Delivered, Cancelled)
- **Order Details**: Each order shows:
  - Order number/ID
  - Order date
  - Items purchased
  - Order total
  - Current status
- **Empty State**: "No orders yet" message when user has no order history
- **Call to Action**: "Go to store to place an order" link for users with no orders

### Profile Section
- **Personal Information Management**:
  - **Name**: Editable name field with edit icon
  - **Email**: Display email address (manighahrmani@yahoo.com in example)
  - **Address Management**: 
    - "Addresses" section with "+ Add" option
    - "No addresses added" state when no addresses exist
    - Ability to add/edit shipping addresses

### Settings Section
- **Account Security**:
  - **Sign Out Everywhere**: Option to log out from all devices
  - Security explanation: "If you've lost a device or have security concerns, log out everywhere to ensure the security of your account"
  - **Sign Out Everywhere Button**: Action button to execute global logout
  - **Device Information**: "You'll also be signed out on this device"

### Account Navigation Structure
- **Shop**: Link back to main store
- **Orders**: Order history and management
- **Profile**: Personal information and addresses
- **Settings**: Account security and logout options

### Interactive Features
- **Profile Editing**: Edit personal information (name, addresses)
- **Address Management**: Add, edit, remove shipping addresses
- **Order Tracking**: View order status and details
- **Security Actions**: Global logout functionality
- **Navigation**: Easy switching between account sections

### Coursework Implementation Notes
- **Focus Areas**: Account dashboard UI, order management, profile editing
- **Data Management**: User profile data, order history, address management
- **State Management**: Account information persistence, logout functionality
- **External Integration**: Shopify account system not required - implement basic account management

---

## The Print Shack Section

### Navigation & Access
- **Dropdown Menu**: "The Print Shack" in main navigation with dropdown options
- **Two Main Pages**: About page and Personalisation page
- **Specialized Service**: Custom printing and personalisation services

### About Page (https://shop.upsu.net/pages/personalisation)
- **Service Overview**: "The Union Print Shack" branding and description
- **Hero Images**: Visual showcase of personalised items ("YOUR NAME HERE" examples)
- **Service Description**: 
  - "Make It Yours at The Union Print Shack"
  - "Want to add a personal touch? We've got you covered with heat-pressed customisation on all our clothing"
  - "Swing by the shop - our team's always happy to help you pick the right gear and answer any questions"

### Service Information Sections
- **Uni Gear or Your Gear**: "We'll Personalise It"
  - Can personalise official uni-branded clothing AND customer's own items
  - "Just bring them in and let's get creative!"
- **Simple Pricing, No Surprises**:
  - £3 for one line of text or small chest logo
  - £5 for two lines or large back logo
  - 3 working days turnaround time
- **Terms & Conditions**:
  - Print exactly as provided (online or in person)
  - Not responsible for spelling errors
  - Text must be clearly displayed in capitals or lowercase
  - No refunds for personalised items
- **Call to Action**: "Pop in or get in touch today - let's create something uniquely you with our personalisation service - The Union Print Shack!"

### Personalisation Product Page (https://shop.upsu.net/products/personalise-text)

#### Product Information
- **Product Title**: "Personalisation"
- **Price**: £3.00 (Tax included)
- **Product Images**: Examples of personalised items with "YOUR NAME HERE" text

#### Dynamic Customization System
- **Text Type Selection**: "Per Line: One Line of Text" dropdown with options:
  - One Line of Text
  - Two Lines of Text  
  - Three Lines of Text
  - Four Lines of Text
  - Small Logo Chest
  - Small Logo Back
- **Dynamic Input Fields**: Text entry boxes appear based on selection
  - Selecting "Two Lines" shows two text input fields
  - Selecting "Four Lines" shows four text input fields
  - Logo options accept text-only input (no image upload)

#### Personalisation Details
- **Text Input**: "Personalisation Line 1:" with text entry field
- **Character Limit**: "One line of text is 10 characters"
- **Pricing Information**: "£3 for one line of text! £5 for two!"
- **Important Notices**:
  - "Please ensure all spellings are correct before submitting your purchase"
  - "We will print your item with the exact wording you provide"
  - "We will not be responsible for any incorrect spellings printed onto your garment"
  - "Personalised items do not qualify for refunds"

#### Purchase Options
- **Quantity Selector**: Standard quantity input field
- **Add to Cart**: "ADD TO CART" button
- **Social Sharing**: Standard social media sharing buttons

#### Interactive Features
- **Dynamic Form Generation**: Input fields change based on text type selection
- **Real-time Pricing**: Price updates based on text line selection
- **Form Validation**: Character limits and text requirements
- **Cart Integration**: Add personalised service to cart with custom text

### Coursework Implementation Notes
- **Complex Form Logic**: Dynamic form generation based on dropdown selection
- **Custom Product Type**: Service-based product rather than physical inventory
- **Text Validation**: Character limits and input validation
- **Pricing Logic**: Different prices based on customization options
- **User Input Management**: Collect and validate custom text input

---

## About Us Page (https://shop.upsu.net/pages/about-us)

### Page Content
- **Page Title**: "About us"
- **Welcome Message**: "Welcome to the Union Shop!"
- **Service Description**: 
  - "We're dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round!"
  - "We even offer an exclusive personalisation service!"
- **Delivery Information**: "All online purchases are available for delivery or instore collection!"
- **Customer Service**: 
  - "We hope you enjoy our products as much as we enjoy offering them to you"
  - "If you have any questions or comments, please don't hesitate to contact us at hello@upsu.net"
- **Closing**: "Happy shopping! The Union Shop & Reception Team"

### Page Features
- **Static Content Page**: Informational page with company/service information
- **Contact Information**: Email contact provided (hello@upsu.net)
- **Service Highlights**: Mentions personalisation service with link
- **Standard Layout**: Uses same header, footer, and navigation as other pages

### Interactive Elements
- **Personalisation Service Link**: Link to personalisation service from text
- **Contact Email**: Clickable email link for customer inquiries
- **Standard Navigation**: Same navigation and footer as other pages

---

## Search Functionality (https://shop.upsu.net/search)

### Search Access
- **Header Search Icon**: Magnifying glass icon in top navigation bar
- **Expandable Search**: Clicking search icon reveals search input box in header
- **Footer Link**: "Search" link available in footer "Help and Information" section
- **Search Page**: Dedicated search page with search functionality
- **Multiple Entry Points**: Search accessible from both header and footer

### Search Interface
- **Search Box**: Text input field with placeholder text
- **Submit Button**: "SUBMIT" button to execute search
- **Search Query Display**: Shows current search term (e.g., "hoodie")
- **Results Count**: Displays number of results found (e.g., "7 RESULTS FOR 'HOODIE'")

### Search Results Display
- **Product List Format**: Results displayed as a vertical list (not grid)
- **Product Information**: Each result shows:
  - Product image (thumbnail)
  - Product name/title
  - Price information (including sale prices with strikethrough)
  - Clickable links to individual product pages

### Sample Search Results (for "hoodie")
- Signature Hoodie (£32.99)
- Classic Hoodies (£25.00)
- Limited Edition Essential Zip Hoodies (£20.00, was £14.99)
- Classic Hoodies - Burgundy (£25.00, was £12.00)
- Classic Rainbow Hoodies (£30.00, was £12.99)
- Graduation Hoodies (£35.00)

### Additional Search Content
- **Related Content**: Shows related items like "The Union Print Shack" service
- **Service Information**: Includes relevant service descriptions in search results
- **Date Information**: Shows dates for relevant content (e.g., "Jun 16, 2025")

### Search Functionality Features
- **Text-based Search**: Search through product names and descriptions
- **Real-time Results**: Results update based on search query
- **Product Navigation**: Clicking results leads to individual product pages
- **Price Display**: Shows current prices and sale information in results
- **Mixed Content**: Can show both products and service information

### Interactive Features
- **Search Query Input**: Text input with search functionality
- **Result Navigation**: Clickable results leading to product pages
- **Search Refinement**: Ability to modify search terms and re-search
- **Product Selection**: Direct navigation to products from search results

### Coursework Implementation Notes
- **Search Algorithm**: Implement text-based product search functionality
- **Results Display**: Format and display search results appropriately
- **Navigation Integration**: Connect search results to existing product pages
- **Query Management**: Handle search input and result processing
- **Mixed Content Types**: Handle both product and service content in results

---

## Completed Functional Analysis

All major pages and functionality have been documented:
✅ Homepage & Navigation
✅ Collections (regular + sale)
✅ Product listings with filtering/sorting
✅ Individual product pages with customization
✅ Shopping cart management
✅ User authentication & account management
✅ The Print Shack (About + Personalisation)
✅ About Us page
✅ Search functionality