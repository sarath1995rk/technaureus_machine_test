import 'package:technaures_machine_test/models/resp_models/resp_check_out.dart';
import 'package:technaures_machine_test/models/resp_models/resp_customer.dart';
import 'package:technaures_machine_test/models/resp_models/resp_customer_list.dart';
import 'package:technaures_machine_test/models/resp_models/resp_product.dart';
import 'package:technaures_machine_test/models/resp_models/resp_product_list.dart';
import 'package:technaures_machine_test/rest/api_client.dart';
import 'package:dio/dio.dart';
import 'package:technaures_machine_test/rest/server_error.dart';
import 'package:technaures_machine_test/rest/server_response.dart';

class Repository {
  late Dio _dio;
  late ApiClient _apiClient;

  Repository() {
    _dio = Dio();
    _apiClient = ApiClient(_dio);
  }

  ///Products

  Future<ServerResponse<RespProductList>> getProducts() async {
    RespProductList response;
    try {
      response = await _apiClient.getProducts();
    } catch (e) {
      ServerError error = ServerError.withError(error: e as DioError);
      return ServerResponse()..error = error;
    }
    return ServerResponse()..data = response;
  }

  Future<ServerResponse<RespProduct>> getProductDetails(int productId) async {
    RespProduct response;
    try {
      response = await _apiClient.getProductDetails(productId);
    } catch (e) {
      ServerError error = ServerError.withError(error: e as DioError);
      return ServerResponse()..error = error;
    }
    return ServerResponse()..data = response;
  }

  Future<ServerResponse<RespProductList>> searchProduct(String query) async {
    RespProductList response;
    try {
      response = await _apiClient.searchProducts(query);
    } catch (e) {
      ServerError error = ServerError.withError(error: e as DioError);
      return ServerResponse()..error = error;
    }
    return ServerResponse()..data = response;
  }

  ///Customers

  Future<ServerResponse<RespCustomerList>> getCustomers() async {
    RespCustomerList response;
    try {
      response = await _apiClient.getCustomers();
    } catch (e) {
      ServerError error = ServerError.withError(error: e as DioError);
      return ServerResponse()..error = error;
    }
    return ServerResponse()..data = response;
  }

  Future<ServerResponse<RespCustomerList>> searchCustomers(String query) async {
    RespCustomerList response;
    try {
      response = await _apiClient.searchCustomers(query);
    } catch (e) {
      ServerError error = ServerError.withError(error: e as DioError);
      return ServerResponse()..error = error;
    }
    return ServerResponse()..data = response;
  }

  Future<ServerResponse<RespCustomer>> createCustomer(
      {required Map<String, dynamic> map}) async {
    RespCustomer response;
    try {
      response = await _apiClient.addCustomer(map);
    } catch (e) {
      ServerError error = ServerError.withError(error: e as DioError);
      return ServerResponse()..error = error;
    }
    return ServerResponse()..data = response;
  }

  Future<ServerResponse<RespCustomer>> updateCustomer(
      {required Map<String, dynamic> map, required int customerId}) async {
    RespCustomer response;
    try {
      response = await _apiClient.updateCustomer(customerId, map);
    } catch (e) {
      ServerError error = ServerError.withError(error: e as DioError);
      return ServerResponse()..error = error;
    }
    return ServerResponse()..data = response;
  }

  ///Check out
  ///
  Future<ServerResponse<RespCheckOut>> orderCheckout(
      {required Map<String, dynamic> map}) async {
    RespCheckOut response;
    try {
      response = await _apiClient.orderCheckOut(map);
    } catch (e) {
      ServerError error = ServerError.withError(error: e as DioError);
      return ServerResponse()..error = error;
    }
    return ServerResponse()..data = response;
  }
}
