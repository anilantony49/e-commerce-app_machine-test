import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/text.dart';
import 'package:flutter/material.dart';

Widget buildCheckOut(BuildContext context, double totalAmount) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          onPressed: () {
            // showCheckout(context);
          },
          height: 60,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
          minWidth: double.maxFinite,
          elevation: 0.1,
          color: Appcolor.primary,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppText.checkoutText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  "\$${totalAmount.toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
