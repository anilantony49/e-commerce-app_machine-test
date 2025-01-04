// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceOptionsBox extends pw.StatelessWidget {
//    InvoiceOptionsBox({super.key});

//   Future<void> _generatePDF(BuildContext context, double grandTotal) async {
//     // Create a PDF document
//     final pdf = pw.Document();

//     // Add content to the PDF
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text('Estimate Receipt', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 20),
//             pw.Text('Order Number: CTR362', style: pw.TextStyle(fontSize: 16)),
//             pw.Text('Bill Number: S178', style: pw.TextStyle(fontSize: 16)),
//             pw.SizedBox(height: 10),
//             pw.Text('Payment Summary:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//             pw.Text('Cash: \$${grandTotal.toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 16)),
//             pw.SizedBox(height: 10),
//             pw.Text('Customer Info:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//             pw.Text('Name: John Doe', style: pw.TextStyle(fontSize: 16)),
//             pw.Text('Address: 123 Main Street, City', style: pw.TextStyle(fontSize: 16)),
//             pw.Text('Phone: +123456789', style: pw.TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );

//     // Save the PDF to the device's storage
//     final output = await getTemporaryDirectory();
//     final file = File('${output.path}/receipt.pdf');
//     await file.writeAsBytes(await pdf.save());

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('PDF saved at ${file.path}')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildBox(
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Generate Receipt',
//             style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildSmallButton('PDF', onPressed: () => _generatePDF(context, 100.00)),
//               _buildSmallButton('XPS', onPressed: () {}),
//               _buildSmallButton('Print', onPressed: () {}),
//             ],
//           ),
//         ],
//       ),
//       minHeight: 60,
//       maxHeight: 90,
//     );
//   }
// }
