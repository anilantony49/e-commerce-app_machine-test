import 'package:e_commerce_app/db/cart_db.dart';
import 'package:e_commerce_app/models/cart_models.dart';
import 'package:e_commerce_app/utils/cart_actions.dart';
import 'package:e_commerce_app/utils/text.dart';
import 'package:e_commerce_app/view/cart/cart_screen/widgets/build_check_out.dart';
import 'package:e_commerce_app/widgets/custom_appbar.dart';
import 'package:e_commerce_app/widgets/image_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.myCart),
      body: ValueListenableBuilder(
        valueListenable: CartDb().cartNotifier,
        builder: (BuildContext context, List<CartModels> newItem, Widget? _) {
          // calculate total amount
          final double totalAmount = newItem.fold(
              0.0,
              (sum, item) =>
                  sum + (double.parse(item.price) * int.parse(item.quantity)));
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  itemBuilder: (context, index) {
                    // Get item data
                    final item = newItem[index];
                    return ImageCart(
                      initialQuantity: int.parse(item.quantity),
                      title: item.title,
                      basePrice: double.parse(item.price),
                      image: item.image,
                      onRemove: () => CartActions.removeItemsAndShowSnackbar(
                          context, item.id),
                      unit: item.unit,
                      id: item.id,
                      discount: item.discount,
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  itemCount: newItem.length,
                ),
              ),
              buildCheckOut(context, totalAmount)
            ],
          );
        },
      ),
    );
  }
}
