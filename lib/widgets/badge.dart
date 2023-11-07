import 'package:flutter/material.dart';
import 'package:technaures_machine_test/common/palette.dart';


class CustomBadge extends StatelessWidget {
  final Widget child;
  final String value;

  const CustomBadge(this.child, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(kCartScreen);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Palette.darkBlue),
              constraints: const BoxConstraints(
                minWidth: 10,
                minHeight: 10,
              ),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}