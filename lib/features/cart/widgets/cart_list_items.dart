import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technaures_machine_test/common/palette.dart';
import 'package:technaures_machine_test/common/theme_x.dart';
import 'package:technaures_machine_test/features/cart/view_model/cart_view_model.dart';
import 'package:technaures_machine_test/features/cart/widgets/inc_dec_button.dart';

class CartListItems extends StatelessWidget {
  final String productId;
  final String title;
  final double calories;
  final double price;
  final int index;
  final int quantity;

  const CartListItems(this.productId, this.title, this.calories, this.price,
      this.index, this.quantity,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        title,
                        style: context.bodyLarge(),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IncDecButton(quantity, productId),
                    ),
                    IconButton(
                        onPressed: () =>
                            Provider.of<CartViewModel>(context, listen: false)
                                .removeItem(productId),
                        icon: const Icon(
                          Icons.delete,
                          color: Palette.red,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('\$ ${price * quantity}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
