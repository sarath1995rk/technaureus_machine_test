import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technaures_machine_test/common/palette.dart';
import 'package:technaures_machine_test/features/cart/view_model/cart_view_model.dart';

class IncDecButton extends StatelessWidget {
  final int qty;
  final String productId;

  const IncDecButton(this.qty, this.productId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<CartViewModel>(context, listen: false)
                .decrementQuantity(productId);
          },
          child: Container(
            height: 35,
            width: 30,
            decoration: const BoxDecoration(
              color : Palette.darkBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: const Icon(Icons.remove, color: Colors.white),
          ),
        ),
        Container(
          height: 35,
          width: 30,
          color : Palette.darkBlue,
          alignment: Alignment.center,
          child: Text(
            qty.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () {
            Provider.of<CartViewModel>(context, listen: false)
                .incrementQuantity(productId);
          },
          child: Container(
            height: 35,
            width: 30,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color : Palette.darkBlue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}