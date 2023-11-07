import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technaures_machine_test/common/palette.dart';
import 'package:technaures_machine_test/common/theme_x.dart';
import 'package:technaures_machine_test/features/cart/screen/cart_screen.dart';
import 'package:technaures_machine_test/features/cart/view_model/cart_view_model.dart';
import 'package:technaures_machine_test/features/product/view_model/product_view_model.dart';
import 'package:technaures_machine_test/rest/ip_class.dart';
import 'package:technaures_machine_test/utilities/alert.dart';
import 'package:technaures_machine_test/widgets/custom_search_field.dart';
import 'package:technaures_machine_test/widgets/image_from_network.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  String _searchTerm = '';

  @override
  void initState() {
    Provider.of<ProductViewModel>(context, listen: false).reset();
    Provider.of<ProductViewModel>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String searchTerm) {
    if (_searchTerm == searchTerm) {
      return;
    }
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (searchTerm.isEmpty) {
        Provider.of<ProductViewModel>(context, listen: false).getProducts();
      } else {
        Provider.of<ProductViewModel>(context, listen: false)
            .searchProducts(searchTerm);
      }
      _searchTerm = searchTerm;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel = Provider.of<ProductViewModel>(context);
    CartViewModel cartViewModel =
        Provider.of<CartViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('NESTO HYPER MARKET', style: context.titleMedium()),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          CustomSearchField(
            _searchController,
            _onSearchChanged,
            focusNode: _focusNode,
          ),
          Expanded(
            child: productViewModel.loading
                ? const Center(
                  child: CircularProgressIndicator(),
                )
                : productViewModel.error.isNotEmpty
                    ? Center(
                      child: Text(productViewModel.error),
                    )
                    : productViewModel.products.isEmpty
                        ? const Center(
                          child: Text("No products found!"),
                        )
                        : GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          itemCount: productViewModel.products.length,
                          itemBuilder: (ctx, i) {
                            final productData = productViewModel.products[i];
                            return Card(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        if (productData.image != null)
                                          Expanded(
                                            child: ImageFromNetwork(
                                              imageUrl: kMediaUrl +
                                                  productData.image!,
                                            ),
                                          ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(productData.name ?? '',
                                                      style: context
                                                          .titleMedium()),
                                                  Text(
                                                      productData.price
                                                              ?.toString() ??
                                                          '',
                                                      style: context
                                                          .titleMedium()),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      backgroundColor:
                                                          Palette.darkBlue),
                                                  onPressed: () {
                                                    cartViewModel.addItem(
                                                        productId: productData
                                                            .id!
                                                            .toString(),
                                                        title: productData
                                                            .name!
                                                            .toString(),
                                                        unit: '1',
                                                        price: productData
                                                            .price!
                                                            .toDouble(),
                                                        calories: 0.00);
                                                    Alert
                                                        .showSnackBarWithAction(
                                                      context,
                                                      'Item added to cart!',
                                                      'Go to cart',
                                                      () => Navigator.of(
                                                              context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CartScreen(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    'Add',
                                                    style: context.bodyMedium(
                                                        textColor:
                                                            Palette.white),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .8,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 5,
                            // mainAxisExtent: 264,
                          ),
                        ),
          ),
        ],
      )),
    );
  }
}
