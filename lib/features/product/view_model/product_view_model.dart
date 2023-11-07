import 'package:flutter/foundation.dart';
import 'package:technaures_machine_test/models/hive_models/product_model.dart';
import 'package:technaures_machine_test/models/product.dart';
import 'package:technaures_machine_test/rest/repository.dart';
import 'package:technaures_machine_test/service/db_functions.dart';
import 'package:technaures_machine_test/utilities/alert.dart';

class ProductViewModel extends ChangeNotifier {
  final _repository = Repository();

  List<Product> products = [];
  bool loading = false;
  bool detailsLoading = true;
  String error = '';

  Future<void> getProducts() async {
    if (!loading) {
      loading = true;
      notifyListeners();
    }
    error = '';
    final response = await _repository.getProducts();
    if (response.error != null) {
      final productDataFromDb = await DbFunctions.getAllProducts();
      if (productDataFromDb.isEmpty) {
        error = response.error?.getErrorMessage();
      } else {
        products = [];
        for (var element in productDataFromDb) {
          products.add(
            Product(
                id: element.id,
                name: element.name,
                price: element.price,
                image: element.image),
          );
        }
        Alert.showToast(response.error?.getErrorMessage());
      }
    } else {
      products = [];
      response.data?.product?.forEach((element) {
        products.add(element);
      });
      final List<ProductModel> productModelList = [];
      for (var element in products) {
        productModelList.add(
          ProductModel(element.id?.toInt() ?? 0, element.name ?? '',
              element.image ?? '', element.price ?? 0),
        );
      }
      if (productModelList.isNotEmpty) {
        await DbFunctions.addProducts(productModelList);
      }
    }
    loading = false;
    notifyListeners();
  }

  Future<Product?> getProductDetails(int productId) async {
    Product? data;
    if (!detailsLoading) {
      detailsLoading = true;
      notifyListeners();
    }
    error = '';
    final response = await _repository.getProductDetails(productId);
    if (response.error != null) {
      error = response.error?.getErrorMessage();
    } else {
      data = response.data?.data;
    }
    detailsLoading = false;
    notifyListeners();
    return data;
  }

  Future<void> searchProducts(String query) async {
    if (!loading) {
      loading = true;
      notifyListeners();
    }
    error = '';
    final response = await _repository.searchProduct(query);
    if (response.error != null) {
      error = response.error?.getErrorMessage();
    } else {
      products = [];
      response.data?.product?.forEach((element) {
        products.add(element);
      });
    }
    loading = false;
    notifyListeners();
  }

  void reset() {
    loading = true;
  }
}
