import 'package:e_commerce_app/data/models/cart_model/cart_models.dart';
import 'package:e_commerce_app/presentation/cart/cart_screen/widgets/build_table_cell.dart';
import 'package:flutter/material.dart';


Widget buildTableBody(List<CartModels> items) {
  return Table(
    border: TableBorder.all(color: Colors.black12),
    children: items.asMap().entries.map((entry) {
      int index = entry.key;
      CartModels item = entry.value;

      double price = double.tryParse(item.price) ?? 0.0;
      int quantity = int.tryParse(item.quantity) ?? 0;
      double discount = double.tryParse(item.discount) ?? 0.0;
      double totalPrice = (price * quantity) - discount;

      return TableRow(
        children: [
          buildTableCell('${index + 1}', fontWeight: FontWeight.w400),
          buildTableCell(item.title, fontWeight: FontWeight.w400),
          buildTableCell(item.price, fontWeight: FontWeight.w400),
          buildTableCell(item.quantity, fontWeight: FontWeight.w400),
          buildTableCell(discount.toStringAsFixed(2),
              fontWeight: FontWeight.w400),
          buildTableCell(totalPrice.toStringAsFixed(2),
              fontWeight: FontWeight.w400),
        ],
      );
    }).toList(),
  );
}
