import 'package:e_commerce_app/payment_simulation_screen.dart';
import 'package:e_commerce_app/utils/colors.dart';
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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PaymentSimulationScreen(totalAmount: totalAmount)),
            );
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
