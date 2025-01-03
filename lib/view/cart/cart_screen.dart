import 'package:e_commerce_app/utils/text.dart';
import 'package:e_commerce_app/view/cart/widgets/build_check_out.dart';
import 'package:e_commerce_app/widgets/custom_appbar.dart';
import 'package:e_commerce_app/widgets/image_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: AppText.myCart),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemBuilder: (context, index) {
                  return ImageCart(
                    initialQuantity: 10,
                    title: "title",
                    basePrice: 10.0,
                    image: "image",
                    onRemove: () => (context),
                    unit: "unit",
                    id: "id",
                    discount: "discount",
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
                itemCount: 10,
              ),
            ),
            buildCheckOut(
              context,
            )
          ],
        ));
  }
}
