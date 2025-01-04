import 'package:e_commerce_app/models/cart_models.dart';
import 'package:e_commerce_app/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

class DetailsBox extends StatelessWidget {
  final String label1;
  final String value1;
  final String label2;
  final String value2;

  const DetailsBox({
    super.key,
    required this.label1,
    required this.value1,
    required this.label2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBox(
      Column(
        children: [
          _buildKeyValueRow(label1, value1),
          const SizedBox(height: 20),
          _buildKeyValueRow(label2, value2),
        ],
      ),
      minHeight: 60,
      maxHeight: 80,
    );
  }
}

class SummaryBox extends StatelessWidget {
  final String title;
  final String label;
  final String value;

  const SummaryBox({
    super.key,
    required this.title,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBox(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildKeyValueRow(label, value),
        ],
      ),
      minHeight: 60,
      maxHeight: 80,
    );
  }
}

class CustomerInfoBox extends StatelessWidget {
  const CustomerInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBox(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.customerInfo,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                AppText.customerName,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(
                height: 20,
                child: VerticalDivider(color: Colors.grey, thickness: 1),
              ),
              Text(
                AppText.customerNumber,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            AppText.customerAddress,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
      minHeight: 60,
      maxHeight: 120,
    );
  }
}

class InvoiceOptionsBox extends StatelessWidget {
  final double grandTotal;
  final List<CartModels> items;
  const InvoiceOptionsBox(
      {super.key, required this.grandTotal, required this.items});

  Future<void> _generatePDF(
    BuildContext context,
  ) async {
    // Create a PDF document
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Invoice Receipt',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Order Number:', style: pw.TextStyle(fontSize: 16)),
                pw.Text('CTR362', style: pw.TextStyle(fontSize: 16)),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Bill Number:', style: pw.TextStyle(fontSize: 16)),
                pw.Text('S178', style: pw.TextStyle(fontSize: 16)),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              AppText.customerInfo,
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Name:', style: pw.TextStyle(fontSize: 16)),
                pw.Text(AppText.customerName,
                    style: pw.TextStyle(fontSize: 16)),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Address:', style: pw.TextStyle(fontSize: 16)),
                pw.Text(AppText.customerAddress,
                    style: pw.TextStyle(fontSize: 16)),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Phone:', style: pw.TextStyle(fontSize: 16)),
                pw.Text(AppText.customerNumber,
                    style: pw.TextStyle(fontSize: 16)),
              ],
            ),
            pw.SizedBox(height: 20),
            // Add product details
            pw.Text(
              'Product details:',
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            // Create a table for product details
            pw.Table(
              border: pw.TableBorder.all(), // Adds a border around the table
              columnWidths: {
                0: pw.FlexColumnWidth(3), // Adjust column widths as needed
                1: pw.FlexColumnWidth(2),
                2: pw.FlexColumnWidth(1),
                3: pw.FlexColumnWidth(2),
              },
              children: [
                // Add the table header row
                pw.TableRow(
                  children: [
                    pw.Center(
                        child: pw.Text('Product',
                            style: pw.TextStyle(
                                fontSize: 16, fontWeight: pw.FontWeight.bold))),
                    pw.Center(
                        child: pw.Text('Price',
                            style: pw.TextStyle(
                                fontSize: 16, fontWeight: pw.FontWeight.bold))),
                    pw.Center(
                        child: pw.Text('Qty',
                            style: pw.TextStyle(
                                fontSize: 16, fontWeight: pw.FontWeight.bold))),
                    pw.Center(
                        child: pw.Text('Discount',
                            style: pw.TextStyle(
                                fontSize: 16, fontWeight: pw.FontWeight.bold))),
                  ],
                ),
                // Loop through the items and add each product's details as a row
                for (var item in items)
                  pw.TableRow(
                    children: [
                      pw.Center(
                          child: pw.Text(item.title,
                              style: pw.TextStyle(fontSize: 14))),
                      pw.Center(
                          child: pw.Text(
                              '\$${double.tryParse(item.price)?.toStringAsFixed(2) ?? '0.00'}',
                              style: pw.TextStyle(fontSize: 14))),
                      pw.Center(
                          child: pw.Text(item.quantity,
                              style: pw.TextStyle(fontSize: 14))),
                      pw.Center(
                          child: pw.Text('${item.discount}%',
                              style: pw.TextStyle(fontSize: 14))),
                    ],
                  ),
              ],
            ),

            pw.SizedBox(height: 20),
            pw.Text(
              'Payment Summary:',
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Cash:', style: pw.TextStyle(fontSize: 16)),
                pw.Text(
                  '\$${grandTotal.toStringAsFixed(2)}',
                  style: pw.TextStyle(fontSize: 16),
                ),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Total amount paid: ',
                    style: pw.TextStyle(fontSize: 16)),
                pw.Text('\$${grandTotal.toStringAsFixed(2)}',
                    style: pw.TextStyle(fontSize: 16)),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Remaining amount to be paid:',
                    style: pw.TextStyle(fontSize: 16)),
                pw.Text(
                  '\$0',
                  style: pw.TextStyle(fontSize: 16),
                ),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Tax:', style: pw.TextStyle(fontSize: 16)),
                pw.Text(
                  '\$ 2.96',
                  style: pw.TextStyle(fontSize: 16),
                ),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Round off:', style: pw.TextStyle(fontSize: 16)),
                pw.Text(
                  '\$ 0.04',
                  style: pw.TextStyle(fontSize: 16),
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Total:',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  '\$${grandTotal.toStringAsFixed(2)}',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // Save the PDF to the device's storage
    try {
      final directory = Directory('/storage/emulated/0/Download');
      if (!directory.existsSync()) {
        directory.createSync();
      }
      final file = File('${directory.path}/receipt.pdf');

      await file.writeAsBytes(await pdf.save());

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved at ${file.path}')),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save PDF: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBox(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.invoiceText,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSmallButton('PDF', onPressed: () => _generatePDF(context)),
              _buildSmallButton('XPS', onPressed: () {}),
              _buildSmallButton('Print', onPressed: () {}),
            ],
          ),
        ],
      ),
      minHeight: 60,
      maxHeight: 90,
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

Widget _buildBox(Widget child,
    {required double minHeight, required double maxHeight}) {
  return ConstrainedBox(
    constraints: BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
    child: DecoratedBox(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 231, 229, 229)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    ),
  );
}

Widget _buildKeyValueRow(String key, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        key,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Text(
        value,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget _buildSmallButton(String label, {required VoidCallback onPressed}) {
  return SizedBox(
    width: 80,
    height: 30,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(label),
    ),
  );
}
