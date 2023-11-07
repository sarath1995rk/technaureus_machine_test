import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technaures_machine_test/common/palette.dart';
import 'package:technaures_machine_test/common/theme_x.dart';
import 'package:technaures_machine_test/features/cart/view_model/cart_view_model.dart';
import 'package:technaures_machine_test/features/cart/widgets/cart_list_items.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    CartViewModel cartViewModel = Provider.of<CartViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart \nNESTO HYPER MARKET',
              style: context.titleMedium(), textAlign: TextAlign.center),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu),
            )
          ],
        ),
        body: cartViewModel.items.isEmpty
            ? const Center(child: Text('No items in cart!'))
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              final item =
                                  cartViewModel.items.values.toList()[index];
                              return CartListItems(
                                  item.productId,
                                  item.title,
                                  item.calories,
                                  item.price,
                                  index,
                                  item.quantity);
                            },
                            separatorBuilder: (c, i) {
                              return const Divider(
                                thickness: 1,
                              );
                            },
                            itemCount: cartViewModel.items.length),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Palette.white,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sub total',
                                      style: context.bodyMedium(),
                                    ),
                                    Consumer<CartViewModel>(
                                        builder: (_, val, __) {
                                      return Text(
                                        '\$ ${val.totalAmount}',
                                        style: context.bodyMedium(),
                                      );
                                    })
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Taxes',
                                      style: context.bodyMedium(),
                                    ),
                                    Consumer<CartViewModel>(
                                        builder: (_, val, __) {
                                      return Text(
                                        '\$ 0',
                                        style: context.bodyMedium(),
                                      );
                                    })
                                  ],
                                ),
                                const Divider(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: context.bodyLarge(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Consumer<CartViewModel>(
                                        builder: (_, val, __) {
                                      return Text(
                                        '\$ ${val.totalAmount}',
                                        style: context.bodyLarge(
                                            fontWeight: FontWeight.bold),
                                      );
                                    })
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            backgroundColor: Palette.darkBlue),
                                        onPressed: () {
                                          Provider.of<CartViewModel>(context,
                                                  listen: false)
                                              .orderCheckOut();
                                        },
                                        child: cartViewModel.loading
                                            ? const SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Palette.white,
                                                    ))
                                            : Text(
                                                'Order',
                                                style: context.bodyMedium(
                                                    textColor: Palette.white),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            backgroundColor: Palette.darkBlue),
                                        onPressed: () {},
                                        child: Text(
                                          'Order & Deliver',
                                          textAlign: TextAlign.center,
                                          style: context.bodyMedium(
                                              textColor: Palette.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // SubmitButton()
                  ],
                ),
              ));
  }
}
