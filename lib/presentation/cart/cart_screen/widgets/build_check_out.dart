import 'package:e_commerce_app/presentation/cart/check_out_screen/check_out_screen.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

// build_check_out.dart
Widget buildCheckOut(BuildContext context, double totalAmount) {
  return Container(
    padding: const EdgeInsets.all(16),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total: \$${totalAmount.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        MaterialButton(
          onPressed: () {
            nextScreen(
                context, CheckOutScreen(totalAmount: totalAmount));
          },
          minWidth: 100,
          elevation: 0.1,
          color: Appcolor.primary,
          height: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
          child: const Text("Proceed to Payment",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              )),
        ),
      ],
    ),
  );
}
