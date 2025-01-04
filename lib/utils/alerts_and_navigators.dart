import 'package:e_commerce_app/db/cart_db.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/constants.dart';
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

customSnackbar(BuildContext context, String message,
    {IconData? leading, String? trailing}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      backgroundColor: Appcolor.dLightBlueGrey2,
      dismissDirection: DismissDirection.up,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          if (leading != null)
            Icon(
              leading,
              color: Colors.white,
            ),
          kWidth(10),
          SizedBox(
            width: MediaQuery.of(context).size.width - 150,
            child: Text(
              message,
              // overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          if (trailing != null)
            Text(
              trailing,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Colors.white,
              ),
            )
        ],
      ),
    ),
  );
}
