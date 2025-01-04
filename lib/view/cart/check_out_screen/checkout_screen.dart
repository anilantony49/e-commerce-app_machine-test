// import 'package:e_commerce_app/db/cart_db.dart';
// import 'package:e_commerce_app/models/cart_models.dart';
// import 'package:e_commerce_app/utils/text.dart';
// import 'package:e_commerce_app/view/cart/check_out_screen/widgets/build_summary_row.dart';
// import 'package:e_commerce_app/view/cart/check_out_screen/widgets/build_table_body.dart';
// import 'package:e_commerce_app/view/cart/check_out_screen/widgets/build_table_header.dart';
// import 'package:e_commerce_app/view/cart/estimate/estimate_view.dart';
// import 'package:e_commerce_app/widgets/round_button.dart';
// import 'package:flutter/material.dart';

// class CheckoutScreen extends StatefulWidget {
//   const CheckoutScreen({super.key});

//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   List<CartModels> items = [];
//   final double tax = 2.96;
//   final double roundOff = 0.04;

//   @override
//   void initState() {
//     super.initState();
//     _fetchItems();
//   }

//   void _fetchItems() async {
//     List<CartModels> fetchedItems = await CartDb.singleton.getCart();
//     setState(() {
//       items = fetchedItems;
//     });
//   }

//   double _calculateSubtotal() {
//     return items.fold(0.0, (sum, item) {
//       double price = double.tryParse(item.price) ?? 0;
//       int quantity = int.tryParse(item.quantity) ?? 0;
//       double discount = double.tryParse(item.discount) ?? 0.0;
//       return sum + (price * quantity - discount);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double subtotal = _calculateSubtotal();
//     final double grandTotal = subtotal + tax + roundOff;

//     return Container(
//       padding: const EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Center(
//             child: Text(
//               AppText.checkOutTitle,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 15),
//           buildTableHeader(),
//           buildTableBody(items),
//           const SizedBox(height: 15),
//           buildSummaryRow(AppText.subtotal, '\$${subtotal.toStringAsFixed(2)}'),
//           const SizedBox(height: 15),
//           buildSummaryRow(AppText.tax, '\$${tax.toStringAsFixed(2)}'),
//           const SizedBox(height: 15),
//           buildSummaryRow(AppText.roundOff, '\$${roundOff.toStringAsFixed(2)}'),
//           const SizedBox(height: 15),
//           buildSummaryRow(AppText.total, '\$${grandTotal.toStringAsFixed(2)}',
//               fontSize: 25),
//           const SizedBox(height: 25),
//           RoundButton(
//             title: AppText.placeOrder,
//             onPressed: () {
//                Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => EstimateView(grandTotal: grandTotal),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(height: 15),
//         ],
//       ),
//     );
//   }
// }
