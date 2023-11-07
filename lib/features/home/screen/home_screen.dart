import 'package:flutter/material.dart';
import 'package:technaures_machine_test/common/constants.dart';
import 'package:technaures_machine_test/features/customer/screen/customer_screen.dart';
import 'package:technaures_machine_test/features/home/widgets/category_widget.dart';
import 'package:technaures_machine_test/features/product/screen/product_screen.dart';
import 'package:technaures_machine_test/models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = Category.getAllCategories();
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(Constants.kCristiano),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body:
      SafeArea(
        child: CategoryList(
          categories: categories,
          onItemTapped: (index) => _navigateToCategoryDetailPage(index),
        ),
      ),
    );
  }

  void _navigateToCategoryDetailPage(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CustomerScreen()));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProductScreen()));
        break;
      default:
        break;
    }
  }
}
