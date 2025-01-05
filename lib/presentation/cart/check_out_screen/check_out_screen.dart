import 'package:e_commerce_app/db/cart_db.dart';
import 'package:e_commerce_app/data/models/cart_model/cart_models.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/utils/text.dart';
import 'package:e_commerce_app/presentation/cart/check_out_screen/widgets/build_summary_row.dart';
import 'package:e_commerce_app/presentation/cart/check_out_screen/widgets/build_table_body.dart';
import 'package:e_commerce_app/presentation/cart/check_out_screen/widgets/build_table_header.dart';
import 'package:e_commerce_app/presentation/cart/invoice_receipt/invoice_receipt_view.dart';
import 'package:e_commerce_app/widgets/round_button.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  final double totalAmount;
  final CartModels? product;

  const CheckOutScreen({super.key, required this.totalAmount, this.product});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<CartModels> items = [];
  final double tax = 2.96;
  final double roundOff = 0.04;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  void _fetchItems() async {
    if (widget.product != null) {
      // If a single product is passed, display only that
      setState(() {
        items = [widget.product!]; // Add the single product to the list
      });
    } else {
      // If no product is passed, fetch all items from the cart
      List<CartModels> fetchedItems = await CartDb.singleton.getCart();
      setState(() {
        items = fetchedItems;
      });
    }
  }

  double _calculateSubtotal() {
    return items.fold(0.0, (sum, item) {
      double price = double.tryParse(item.price) ?? 0;
      int quantity = int.tryParse(item.quantity) ?? 0;
      double discount = double.tryParse(item.discount) ?? 0.0;
      return sum + (price * quantity - discount);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double subtotal = _calculateSubtotal();
    final double grandTotal = subtotal + tax + roundOff;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppText.checkOutTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15),
              buildTableHeader(),
              buildTableBody(items),
              const SizedBox(height: 15),
              buildSummaryRow(
                  AppText.subtotal, '\$${subtotal.toStringAsFixed(2)}'),
              const SizedBox(height: 15),
              buildSummaryRow(AppText.tax, '\$${tax.toStringAsFixed(2)}'),
              const SizedBox(height: 15),
              buildSummaryRow(
                  AppText.roundOff, '\$${roundOff.toStringAsFixed(2)}'),
              const SizedBox(height: 15),
              buildSummaryRow(
                  AppText.total, '\$${grandTotal.toStringAsFixed(2)}',
                  fontSize: 25),
              const SizedBox(height: 25),
              RoundButton(
                title: AppText.buyNow,
                onPressed: () {
                  nextScreen(
                      context,
                      InvoiceReceiptView(
                        grandTotal: grandTotal,
                        product: widget.product,
                      ));
                },
              ),
              const SizedBox(height: 15),
            ],
          ),
        ));
  }
}
