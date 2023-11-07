import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technaures_machine_test/common/constants.dart';
import 'package:technaures_machine_test/common/palette.dart';
import 'package:technaures_machine_test/common/theme_x.dart';
import 'package:technaures_machine_test/features/customer/view_model/customer_view_model.dart';
import 'package:technaures_machine_test/features/customer/widget/customer_bottom_sheet.dart';
import 'package:technaures_machine_test/models/customer.dart';
import 'package:technaures_machine_test/rest/ip_class.dart';
import 'package:technaures_machine_test/widgets/custom_search_field.dart';
import 'package:technaures_machine_test/widgets/image_from_network.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  String _searchTerm = '';

  @override
  void initState() {
    Provider.of<CustomerViewModel>(context, listen: false).reset();
    Provider.of<CustomerViewModel>(context, listen: false).getCustomers();
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
        Provider.of<CustomerViewModel>(context, listen: false).getCustomers();
      } else {
        Provider.of<CustomerViewModel>(context, listen: false)
            .searchCustomers(searchTerm);
      }
      _searchTerm = searchTerm;
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomerViewModel customerViewModel =
        Provider.of<CustomerViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('CUSTOMERS', style: context.titleMedium()),
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
              addCustomer: () async {
                final result = await _showBottomSheet();
                if (result != null) {
                  final customerId = result.id;
                  if (customerId == null) {
                    if (mounted) {
                      Provider.of<CustomerViewModel>(context, listen: false)
                          .createCustomer(result);
                    }
                  } else {
                    if (mounted) {
                      Provider.of<CustomerViewModel>(context, listen: false)
                          .updateCustomer(result, customerId);
                    }
                  }
                }
              },
            ),
            Expanded(
              child: customerViewModel.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : customerViewModel.error.isNotEmpty
                      ? Center(
                          child: Text(customerViewModel.error),
                        )
                      : customerViewModel.customers.isEmpty
                          ? const Center(
                              child: Text("No Customers found!"),
                            )
                          : RefreshIndicator(
                              onRefresh: () {
                                return Provider.of<CustomerViewModel>(context,
                                        listen: false)
                                    .getCustomers();
                              },
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  itemBuilder: (ctx, index) {
                                    final customerData =
                                        customerViewModel.customers[index];
                                    return Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: ImageFromNetwork(
                                                imageUrl:
                                                    customerData.profilePic ==
                                                            null
                                                        ? Constants.kCristiano
                                                        : kMediaUrl +
                                                            customerData
                                                                .profilePic!,
                                                fit: BoxFit.cover,
                                                height: 90,
                                                width: 80,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      customerData.name ?? '',
                                                      style: context.bodyLarge(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () async {
                                                          final result =
                                                              await _showBottomSheet(
                                                                  customerDetails:
                                                                      customerData);
                                                          if (result != null) {
                                                            final customerId =
                                                                result.id;
                                                            if (customerId !=
                                                                null) {
                                                              if (mounted) {
                                                                Provider.of<CustomerViewModel>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .updateCustomer(
                                                                        result,
                                                                        customerId);
                                                              }
                                                            }
                                                          }
                                                        },
                                                        child: const Icon(
                                                          Icons.edit,
                                                          color:
                                                              Palette.darkBlue,
                                                        ))
                                                  ],
                                                ),
                                                Text('ID : ${customerData.id}',
                                                    style: context.bodyLarge(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textColor:
                                                            Palette.lightGrey)),
                                                Text(
                                                    '${customerData.street},${customerData.streetTwo},${customerData.city}',
                                                    style: context.bodyLarge(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textColor:
                                                            Palette.lightGrey)),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Due amount : ',
                                                      style: context.bodyLarge(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      'Not available',
                                                      style: context.bodyLarge(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          textColor:
                                                              Palette.red),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, __) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount:
                                      customerViewModel.customers.length),
                            ),
            )
          ],
        ),
      ),
    );
  }

  Future<Customer?> _showBottomSheet({Customer? customerDetails}) async {
    final value = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return CustomerBottomSheet(
          customerDetails: customerDetails,
        );
      },
    );
    return value;
  }
}
