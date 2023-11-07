import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technaures_machine_test/common/palette.dart';
import 'package:technaures_machine_test/features/cart/screen/cart_screen.dart';
import 'package:technaures_machine_test/features/cart/view_model/cart_view_model.dart';
import 'package:technaures_machine_test/features/customer/screen/customer_screen.dart';
import 'package:technaures_machine_test/features/home/screen/home_screen.dart';
import 'package:technaures_machine_test/widgets/badge.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State {
  int _selectedTab = 0;

  final List _pages = [
    const HomeScreen(),
    const Center(
      child: Text("New order"),
    ),
    const CartScreen(),
    const Center(
      child: Text("Return Order"),
    ),
    const CustomerScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Palette.darkBlue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.indeterminate_check_box_outlined),
                label: "New Order"),
            BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  const Icon(Icons.shopping_cart_outlined),
                  Consumer<CartViewModel>(builder: (context, val, __) {
                    return Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Palette.darkBlue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          val.itemCount.toString(),
                          style:
                              const TextStyle(color: Colors.white, fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  })
                ],
              ),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.integration_instructions_outlined),
                label: "Return Order"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person_3_rounded), label: "Customers"),
          ],
        ),
      ),
    );
  }
}
