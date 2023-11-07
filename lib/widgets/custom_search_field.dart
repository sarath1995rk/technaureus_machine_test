import 'package:flutter/material.dart';
import 'package:technaures_machine_test/common/palette.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? _controller;
  final Function? onChanged;
  final String hintText;
  final VoidCallback? onTap;
  final bool readOnly;
  final FocusNode? focusNode;
  final VoidCallback? addCustomer;

  CustomSearchField(this._controller, this.onChanged,
      {this.hintText = 'Search',
      this.onTap,
      this.readOnly = false,
      this.focusNode,
      this.addCustomer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        elevation: 5.0,
        shadowColor: Palette.lightGrey,
        child: TextField(
          focusNode: focusNode,
          onTap: onTap,
          readOnly: readOnly,
          controller: _controller,
          cursorColor: Palette.black,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Palette.lightGrey.withOpacity(0.5), width: .1),
                borderRadius: BorderRadius.circular(15)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Palette.lightGrey.withOpacity(0.5), width: .1),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Palette.lightGrey.withOpacity(0.5), width: .1),
                borderRadius: BorderRadius.circular(15)),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            hintText: hintText,
            fillColor: Colors.white70,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.search),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: addCustomer != null
                  ? GestureDetector(
                      onTap: addCustomer,
                      child: const Icon(
                        Icons.add_circle,
                        color: Palette.darkBlue,
                      ),
                    )
                  : const Icon(Icons.qr_code),
            ),
          ),
          onChanged: (value) {
            onChanged!(value);
          },
        ),
      ),
    );
  }
}
