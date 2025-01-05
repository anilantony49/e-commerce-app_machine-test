import 'package:e_commerce_app/db/cart_db.dart';
import 'package:e_commerce_app/data/models/cart_model/cart_models.dart';
import 'package:e_commerce_app/presentation/cart/check_out_screen/check_out_screen.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/utils/text.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Calculate the total amount for the product
    double totalAmount = double.tryParse(product["price"]) ?? 0;
    // Define selectedProduct from the product map
    CartModels selectedProduct = CartModels(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: product["name"],
      price: product["price"],
      quantity: product["qty"],
      image: product["icon"],
      unit: product["unit"],
      discount: product["discount"],
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product["name"]),
        backgroundColor: Appcolor.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Discount
            Stack(
              children: [
                Center(
                  child: Hero(
                    tag:
                        'product-icon-${product["name"]}', // Same tag as in BuildProductCard

                    child: Image.asset(
                      product["icon"],
                      width: 200,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red, // Background color for discount
                      borderRadius: BorderRadius.circular(12), // Rounded edges
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Text(
                      "${product["discount"]}% OFF",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white, // White text for contrast
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Price Container
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green, // Green background for price
                    borderRadius: BorderRadius.circular(20), // Rounded edges
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    "\$${product["price"]}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Quantity Information
            Text(
              "Quantity: ${product["qty"]} ${product["unit"]}",
              style: TextStyle(
                fontSize: 18,
                color: Appcolor.secondaryText,
              ),
            ),
            const SizedBox(height: 10),

            // Product Description
            Text(
              product["description"],
              style: TextStyle(
                fontSize: 18,
                color: Appcolor.secondaryText,
              ),
            ),
            const SizedBox(height: 50),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ValueListenableBuilder(
                  valueListenable: CartDb.singleton.cartNotifier,
                  builder: (BuildContext context, List<CartModels> cartItems,
                      Widget? _) {
                    bool isItemInCart = cartItems
                        .any((cartItem) => cartItem.title == product["name"]);
                    return MaterialButton(
                      onPressed: () async {
                        // Check if the item is already in the cart
                        if (isItemInCart) {
                          // Remove item from cart
                          final cartItem = cartItems.firstWhere(
                              (cartItem) => cartItem.title == product["name"]);
                          await CartDb.singleton.removeCart(cartItem.id);

                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(AppText.itemRemovedText),
                                duration: const Duration(seconds: 2)),
                          );
                        } else {
                          // Add item to cart
                          final newItem = CartModels(
                              id: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                              title: product["name"],
                              price: product["price"],
                              quantity: product["qty"],
                              image: product["icon"],
                              unit: product["unit"],
                              discount: product["discount"]);

                          await CartDb.singleton.addCart(newItem);

                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(AppText.itemAddedText),
                                duration: const Duration(seconds: 2)),
                          );
                        }
                      },
                      minWidth: 100,
                      elevation: 0.1,
                      color: Appcolor.primary,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: Text(
                        isItemInCart ? "Remove from cart" : "Add to cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    );
                  },
                ),
                MaterialButton(
                  onPressed: () {
                    nextScreen(
                      context,
                      CheckOutScreen(
                        totalAmount: totalAmount,
                        product: selectedProduct,
                      ),
                    );
                  },
                  minWidth: 100,
                  elevation: 0.1,
                  color: Appcolor.primary,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
