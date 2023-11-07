import 'package:flutter/material.dart';
import 'package:technaures_machine_test/common/font_weight.dart';
import 'package:technaures_machine_test/common/palette.dart';
import 'package:technaures_machine_test/common/theme_x.dart';
import 'package:technaures_machine_test/models/customer.dart';

class CustomerBottomSheet extends StatefulWidget {
  const CustomerBottomSheet({Key? key, this.customerDetails}) : super(key: key);
  final Customer? customerDetails;

  @override
  State<CustomerBottomSheet> createState() => _CustomerBottomSheetState();
}

class _CustomerBottomSheetState extends State<CustomerBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _streetController = TextEditingController();
  final _street2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _pinCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _stateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.customerDetails != null) {
      _nameController.text = widget.customerDetails?.name ?? '';
      _emailController.text = widget.customerDetails?.email ?? '';
      _mobileController.text = widget.customerDetails?.mobileNumber ?? '';
      _streetController.text = widget.customerDetails?.street ?? '';
      _street2Controller.text = widget.customerDetails?.streetTwo ?? '';
      _cityController.text = widget.customerDetails?.city ?? '';
      _pinCodeController.text =
          widget.customerDetails?.pincode?.toString() ?? '';
      _countryController.text = widget.customerDetails?.country ?? '';
      _stateController.text = widget.customerDetails?.state ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _streetController.dispose();
    _street2Controller.dispose();
    _cityController.dispose();
    _pinCodeController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0.001),
        child: DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.9,
          maxChildSize: 0.9,
          snap: true,
          expand: false,
          builder: (_, controller) {
            return Container(
              decoration: const BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Add Customer',
                              style: context.bodyLarge(
                                fontWeight: AppFontWeight.semiBold,
                                textColor: Palette.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(
                              Icons.clear,
                              color: Palette.secondary,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          child: ListView(
                            children: [
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                    hintText: 'Customer name'),
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Customer name cannot be empty'
                                      : null;
                                },
                              ),
                              TextFormField(
                                controller: _mobileController,
                                decoration:
                                    const InputDecoration(hintText: 'Mobile'),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Mobile cannot be empty'
                                      : null;
                                },
                              ),
                              TextFormField(
                                controller: _emailController,
                                decoration:
                                    const InputDecoration(hintText: 'Email'),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Email cannot be empty'
                                      : null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Address',
                                style: context.bodyLarge(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _streetController,
                                      decoration: const InputDecoration(
                                          hintText: 'Street'),
                                      validator: (value) {
                                        return value!.isEmpty
                                            ? '*required'
                                            : null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _street2Controller,
                                      decoration: const InputDecoration(
                                          hintText: 'Street 2'),
                                      validator: (value) {
                                        return value!.isEmpty
                                            ? '*required'
                                            : null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _cityController,
                                      decoration: const InputDecoration(
                                          hintText: 'City'),
                                      validator: (value) {
                                        return value!.isEmpty
                                            ? '*required'
                                            : null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _pinCodeController,
                                      decoration: const InputDecoration(
                                          hintText: 'Pin code'),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        return value!.isEmpty
                                            ? '*required'
                                            : null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _countryController,
                                      decoration: const InputDecoration(
                                          hintText: 'Country'),
                                      validator: (value) {
                                        return value!.isEmpty
                                            ? '*required'
                                            : null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _stateController,
                                      decoration: const InputDecoration(
                                          hintText: 'State'),
                                      validator: (value) {
                                        return value!.isEmpty
                                            ? '*required'
                                            : null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
                                child: SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: Palette.darkBlue),
                                    onPressed: _save,
                                    child: Text(
                                      'Submit',
                                      style: context.bodyMedium(
                                          textColor: Palette.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Customer customer = Customer(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        mobileNumber: _mobileController.text.trim(),
        street: _streetController.text.trim(),
        streetTwo: _street2Controller.text.trim(),
        city: _cityController.text.trim(),
        pincode: int.parse(_pinCodeController.text.trim()),
        country: _countryController.text.trim(),
        state: _stateController.text.trim(),
        id: widget.customerDetails?.id,
        profilePic: widget.customerDetails?.profilePic);

    Navigator.of(context).pop(customer);
  }
}
