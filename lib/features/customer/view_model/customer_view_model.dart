import 'package:flutter/material.dart';
import 'package:technaures_machine_test/models/customer.dart';
import 'package:technaures_machine_test/models/hive_models/customer_model.dart';
import 'package:technaures_machine_test/rest/repository.dart';
import 'package:technaures_machine_test/service/db_functions.dart';
import 'package:technaures_machine_test/utilities/alert.dart';

class CustomerViewModel extends ChangeNotifier {
  final _repository = Repository();
  bool loading = false;
  bool detailsLoading = true;
  String error = '';
  List<Customer> customers = [];

  Future<void> getCustomers() async {
    if (!loading) {
      loading = true;
      notifyListeners();
    }
    error = '';
    final response = await _repository.getCustomers();
    if (response.error != null) {
      final customerDataFromDb = await DbFunctions.getAllCustomers();
      if (customerDataFromDb.isEmpty) {
        error = response.error?.getErrorMessage();
      } else {
        customers = [];
        for (var element in customerDataFromDb) {
          customers.add(
            Customer(
                id: element.id,
                name: element.name,
                profilePic: element.image,
                street: element.address),
          );
        }
        Alert.showToast(response.error?.getErrorMessage());
      }
    } else {
      customers = [];
      response.data?.data?.forEach((element) {
        customers.add(element);
      });
      final List<CustomerModel> customerModelList = [];
      for (var element in customers) {
        customerModelList.add(
          CustomerModel(
              element.id?.toInt() ?? 0,
              element.name ?? '',
              element.profilePic ?? '',
              '${element.street},${element.streetTwo},${element.city}'),
        );
      }
      if (customerModelList.isNotEmpty) {
        await DbFunctions.addCustomers(customerModelList);
      }
    }
    loading = false;
    notifyListeners();
  }

  Future<void> searchCustomers(String query) async {
    if (!loading) {
      loading = true;
      notifyListeners();
    }
    error = '';
    final response = await _repository.searchCustomers(query);
    if (response.error != null) {
      error = response.error?.getErrorMessage();
    } else {
      customers = [];
      response.data?.data?.forEach((element) {
        customers.add(element);
      });
    }
    loading = false;
    notifyListeners();
  }

  Future<void> createCustomer(Customer customerData) async {
    final data = customerData.toJson();
    data.removeWhere((key, value) => value == null);
    if (!loading) {
      loading = true;
      notifyListeners();
    }

    final response = await _repository.createCustomer(map: data);
    if (response.error != null) {
      Alert.showToast(response.error?.getErrorMessage());
      loading = false;
      notifyListeners();
    } else {
      Alert.showToast('Customer successfully added');
      getCustomers();
    }
  }

  Future<void> updateCustomer(Customer customerData, num customerId) async {
    final data = customerData.toJson();
    data.removeWhere((key, value) => value == null);
    data.remove('id');
    if (!loading) {
      loading = true;
      notifyListeners();
    }

    final response = await _repository.updateCustomer(
        map: data, customerId: customerId.toInt());
    if (response.error != null) {
      Alert.showToast(response.error?.getErrorMessage());
      loading = false;
      notifyListeners();
    } else {
      Alert.showToast('Customer successfully updated');
      getCustomers();
    }
  }

  void reset() {
    loading = true;
  }
}
