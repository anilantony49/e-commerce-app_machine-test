import 'package:e_commerce_app/db/cart_db.dart';
import 'package:e_commerce_app/models/cart_models.dart';
import 'package:e_commerce_app/view/cart/check_out_screen/widgets/build_table_body.dart';
import 'package:e_commerce_app/view/cart/check_out_screen/widgets/build_table_header.dart';
import 'package:e_commerce_app/view/cart/invoice_receipt/widgets/build_animated_image.dart';
import 'package:e_commerce_app/view/cart/invoice_receipt/widgets/build_animated_text.dart';
import 'package:e_commerce_app/view/cart/invoice_receipt/widgets/invoice_receipt_components.dart';
import 'package:flutter/material.dart';

class InvoiceReceiptView extends StatefulWidget {
  final double grandTotal;
  const InvoiceReceiptView({super.key, required this.grandTotal});

  @override
  State<InvoiceReceiptView> createState() => _InvoiceReceiptViewState();
}

class _InvoiceReceiptViewState extends State<InvoiceReceiptView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    _fetchItems();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  List<CartModels> items = [];

  void _fetchItems() async {
    List<CartModels> fetchedItems = await CartDb.singleton.getCart();
    setState(() {
      items = fetchedItems;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildAnimatedImage(scaleAnimation),
                const SizedBox(height: 20),
                buildAnimatedText(),
                const SizedBox(height: 20),
                const DetailsBox(
                  label1: 'Order Number',
                  value1: 'CTR362',
                  label2: 'Bill Number',
                  value2: 'S178',
                ),
                const SizedBox(height: 10),
                SummaryBox(
                  title: 'Payment Summary',
                  label: 'Cash',
                  value: "\$${widget.grandTotal.toStringAsFixed(2)}",
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product details',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    buildTableHeader(),
                    buildTableBody(items),
                  ],
                ),
                const SizedBox(height: 20),
                DetailsBox(
                  label1: 'Total amount paid',
                  value1: "\$${widget.grandTotal.toStringAsFixed(2)}",
                  label2: 'Remaining amount to be paid',
                  value2: '\$0',
                ),
                const SizedBox(height: 10),
                const CustomerInfoBox(),
                const SizedBox(height: 20),
                InvoiceOptionsBox(grandTotal: widget.grandTotal,items:items,),
                const SizedBox(height: 20),
                ActionButton(
                  label: 'New sale',
                  onPressed: () {
                    // Handle New Sale action
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
