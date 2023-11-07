import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technaures_machine_test/common/constants.dart';

class Category {
  const Category(this.title, this.image);

  final String title;
  final String image;

  static List<Category> getAllCategories() {
    return  [
      const Category('Customers', Constants.kCustomerImage),
      const Category('Products', Constants.kProductImage),
      const Category('New Order', Constants.kCustomerImage),
      const Category('Return Order', Constants.kCustomerImage),
      const Category('Add payment', Constants.kCustomerImage),
      const Category("Today's Order", Constants.kCustomerImage),
      const Category("Today's Summary", Constants.kCustomerImage),
      const Category("Route", Constants.kCustomerImage),

    ];
  }
}