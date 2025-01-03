import 'package:e_commerce_app/db/cart_db.dart';
import 'package:e_commerce_app/utils/text.dart';
import 'package:flutter/material.dart';

class CartActions {
  static void removeItemsAndShowSnackbar(BuildContext context, String itemId) {
    CartDb.singleton.removeCart(itemId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppText.itemRemovedText),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
