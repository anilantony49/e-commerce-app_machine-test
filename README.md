# e_commerce_app

## Cartify

### Table of Contents

1. [About the Project](#about-the-project)
2. [Features](#features)
3. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)
7. [Contact](#contact)

### About the Project

Cartify aims to deliver a user-friendly e-commerce application showcasing essential features for an intuitive shopping experience. The app will include functionalities such as product listing, detailed product views, user authentication, a shopping cart, and a checkout system, all within an attractive and seamless interface.

### Features

- **Product Listing**: The app showcases a curated list of 20 hard-coded products, each presented with high-quality images, names, and prices to ensure clarity and engagement.
- **"Add to Cart" Button**: Each product includes an "Add to Cart" button, allowing users to seamlessly add items to their cart with a single tap.
- **User-Centric UI Design**: The product listing screen is thoughtfully designed to offer a clean, organized, and aesthetically pleasing layout, ensuring users can quickly locate and interact with products without confusion.

#### 1. Product Details Screen

- **Navigation**: Users can seamlessly navigate to the details screen by selecting any product from the product listing.
- **Detailed Information Display**: Showcases an expanded view of the product, including its image, name, price, and detailed description, helping users make informed decisions.

##### Purchase Options:
- **"Add to Cart" Button**: Allows users to add the product directly to their shopping cart.
- **"Buy Now" Button**: Provides an option to proceed directly to the checkout process for immediate purchase.

#### 2. User Authentication

Cartify ensures secure access for users through an OTP-based authentication system, enhancing the app's reliability. This feature allows users to sign up and log in effortlessly while maintaining data security.

#### 3. Cart Functionality

- **Cart Screen**: A dedicated screen where users can review all the products they've added to their cart. Each item will be displayed with its name, price, and quantity.
- **Total Cost Display**: The app will calculate and show the total cost of the items in the cart, providing users with an easy-to-understand breakdown of their purchases.
- **Remove Items Option**: Users can easily remove products from the cart, allowing them to adjust their selections before proceeding to checkout.
- **Proceed to Checkout Button**: Once users are satisfied with their cart, a prominent button will enable them to continue to the checkout process, facilitating a seamless transition to payment and order completion.

#### 4. Checkout and Transaction

- **Payment Simulation**: During the checkout process, users will be guided through a simulated payment step, using dummy data to mimic a real-world transaction process. This ensures a smooth and realistic experience without requiring actual financial processing.

##### Transaction Finalization:
- **Buy Now Button**: Once users are ready to complete their purchase, a "Buy Now" button will be available to finalize the transaction.
- **PDF Receipt Generation**: After the transaction is complete, the app will generate a PDF receipt that includes:
  - A detailed list of product names and prices.
  - The total cost of the purchase.
  - Options for users to either download or share the receipt, ensuring that they have a record of their purchase.

#### State Management Used: Bloc  
#### Database Used: Hive  
#### App Architecture: Clean Architecture

### Getting Started

To get a local copy up and running, follow these steps.

#### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)
- A text editor or IDE (VS Code, Android Studio, etc.)

#### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/anilantony49/e-commerce-app_machine-test.git
    cd e-commerce-app_machine-test
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app:

    ```bash
    flutter run
    ```

### Usage

1. Open the app on your emulator or physical device.

#### How to Use Cartify

Here’s a step-by-step guide on how to use the Cartify e-commerce app:

#### 1. Sign-Up/Login
- **Sign-Up**:
  - Open the app and click on the "Sign Up" button.
  - Enter your phone number to receive an OTP (One-Time Password).
  - Input the OTP you receive to complete the sign-up process.
- **Login**:
  - If you already have an account, simply click on the "Login" button.
  - Enter your phone number and verify it using the OTP sent to your device.

#### 2. Explore Products
- Once logged in, you’ll land on the product listing screen, which displays 20 pre-defined products.
  - Each product will show the product name, image, and price.
  - Browse through the products and select any item you are interested in.

#### 3. Product Details
- **View Product Details**:
  - Tap on any product to view more detailed information about it, such as descriptions, sizes, or available options.
  - On this screen, you’ll also find the "Add to Cart" button to add the item to your cart or the "Buy Now" button for an immediate purchase.

#### 4. Add to Cart
- **Add Items to Cart**:
  - While browsing products, click the "Add to Cart" button on any item you want to purchase.
  - This will add the product to your cart, and you can continue shopping or proceed to checkout at any time.

#### 5. View Cart
- **Access Your Cart**:
  - Tap on the cart icon at the top of the screen to view all the items you’ve added to your cart.
  - You’ll be able to see the names of the products, their prices, and the total cost of your items.
- **Remove Items from Cart**:
  - If you change your mind, you can remove products from the cart by clicking the "Remove" button next to each product.

#### 6. Proceed to Checkout
- **Checkout Process**:
  - Once you’re ready to buy, tap the "Proceed to Checkout" button.
  - The app will simulate a payment process where you’ll see a summary of your order.

#### 7. Payment Simulation
- **Simulate Payment**:
  - You’ll be guided through a dummy payment process, which will simulate how a real payment would proceed.

#### 8. Finalizing the Transaction
- **Complete Your Purchase**:
  - After the payment simulation, click the "Buy Now" button to finalize your purchase.

#### 9. Download or Share Receipt
- **Receive Receipt**:
  - After completing the purchase, a PDF receipt will be generated.
  - The receipt will include product names, prices, and the total cost.
  - You can download and store the receipt on your phone device.

With these easy steps, you’ll be able to navigate through Cartify, from signing up and adding products to your cart to finalizing your purchase and receiving a receipt! Enjoy the features of the application!

### Contributing

Contributions are welcome!  
To contribute:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/NewFeature`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature/NewFeature`).
5. Open a pull request.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Contact

- **Project Link**: [https://github.com/anilantony49/e-commerce-app_machine-test.git](https://github.com/anilantony49/e-commerce-app_machine-test.git)
- **Email**: anilantony49@gmail.com
