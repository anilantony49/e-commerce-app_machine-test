// import 'package:pdf/widgets.dart'; // No alias
// import 'package:flutter/material.dart'; // Flutter import

// class InvoiceOptionsBox extends StatelessWidget {
//   final double grandTotal;

//   const InvoiceOptionsBox({super.key, required this.grandTotal});

//   Future<void> _generatePDF(BuildContext context) async {
//     // Create a PDF document
//     final Document pdf = Document();

//     // Add content to the PDF
//     pdf.addPage(
//       Page(
//         build: (Context context) => Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Invoice Receipt',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Order Number:', style: TextStyle(fontSize: 16)),
//                 Text('CTR362', style: TextStyle(fontSize: 16)),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Bill Number:', style: TextStyle(fontSize: 16)),
//                 Text('S178', style: TextStyle(fontSize: 16)),
//               ],
//             ),
//             SizedBox(height: 20),
//             _buildPdfTableHeader(),
//             _buildPdfTableBody(),
//           ],
//         ),
//       ),
//     );

//     // Save PDF
//     final output = File('invoice.pdf');
//     await output.writeAsBytes(await pdf.save());
//   }

//   Widget _buildPdfTableHeader() {
//     return Row(
//       children: [
//         Expanded(
//           child: Text('Item', style: TextStyle(fontSize: 14)),
//         ),
//         Expanded(
//           child: Text('Quantity', style: TextStyle(fontSize: 14)),
//         ),
//         Expanded(
//           child: Text('Price', style: TextStyle(fontSize: 14)),
//         ),
//       ],
//     );
//   }

//   Widget _buildPdfTableBody() {
//     // Example table data; replace with your actual data.
//     final items = [
//       {'item': 'Product A', 'quantity': '2', 'price': '20.00'},
//       {'item': 'Product B', 'quantity': '1', 'price': '15.00'},
//     ];

//     return Column(
//       children: items.map((item) {
//         return Row(
//           children: [
//             Expanded(
//               child: Text(item['item']!, style: TextStyle(fontSize: 14)),
//             ),
//             Expanded(
//               child: Text(item['quantity']!, style: TextStyle(fontSize: 14)),
//             ),
//             Expanded(
//               child: Text(item['price']!, style: TextStyle(fontSize: 14)),
//             ),
//           ],
//         );
//       }).toList(),
//     );
//   }
// }
