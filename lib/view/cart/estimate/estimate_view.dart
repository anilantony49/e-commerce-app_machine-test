import 'package:e_commerce_app/view/cart/estimate/widgets/build_animated_image.dart';
import 'package:e_commerce_app/view/cart/estimate/widgets/build_animated_text.dart';
import 'package:e_commerce_app/view/cart/estimate/widgets/estimate_components.dart';
import 'package:flutter/material.dart';

class EstimateView extends StatefulWidget {
  final double grandTotal;
  const EstimateView({super.key, required this.grandTotal});

  @override
  State<EstimateView> createState() => _EstimateViewState();
}

class _EstimateViewState extends State<EstimateView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
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
              DetailsBox(
                label1: 'Total amount paid',
                value1: "\$${widget.grandTotal.toStringAsFixed(2)}",
                label2: 'Remaining amount to be paid',
                value2: '\$0',
              ),
              const SizedBox(height: 10),
              const CustomerInfoBox(),
              const SizedBox(height: 20),
              const InvoiceOptionsBox(),
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
    );
  }
}
