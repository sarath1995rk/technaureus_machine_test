import 'package:hive/hive.dart';
import 'package:technaures_machine_test/models/hive_models/customer_model.dart';
import 'package:technaures_machine_test/models/hive_models/product_model.dart';

class DbFunctions {
  static Future<void> addProducts(List<ProductModel> productModels) async {
    final productDb = await Hive.openBox<ProductModel>('product_db');
    await productDb.clear();
    await productDb.addAll(productModels);
  }

  static Future<List<ProductModel>> getAllProducts() async {
    final productDb = await Hive.openBox<ProductModel>('product_db');
    return productDb.values.toList();
  }

  static Future<void> addCustomers(List<CustomerModel> customerModels) async {
    final customerDb = await Hive.openBox<CustomerModel>('customer_db');
    await customerDb.clear();
    await customerDb.addAll(customerModels);
  }

  static Future<List<CustomerModel>> getAllCustomers() async {
    final customerDb = await Hive.openBox<CustomerModel>('customer_db');
    return customerDb.values.toList();
  }
}
