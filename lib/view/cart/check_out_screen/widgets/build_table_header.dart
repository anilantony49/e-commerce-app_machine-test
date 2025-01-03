import 'package:e_commerce_app/view/cart/cart_screen/widgets/build_table_cell.dart';
import 'package:flutter/material.dart';

Widget buildTableHeader() {
  return Table(
    border: TableBorder.all(color: Colors.black26),
    children: [
      TableRow(
        decoration: BoxDecoration(color: Colors.grey[200]),
        children: [
          buildTableCell('No'),
          buildTableCell('Name'),
          buildTableCell('Price (\$)'),
          buildTableCell('Qty/Kg'),
          buildTableCell('Disc'),
          buildTableCell('Amount (\$)'),
        ],
      ),
    ],
  );
}
