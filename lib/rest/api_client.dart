import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:technaures_machine_test/models/resp_models/resp_check_out.dart';
import 'package:technaures_machine_test/models/resp_models/resp_customer.dart';
import 'package:technaures_machine_test/models/resp_models/resp_customer_list.dart';
import 'package:technaures_machine_test/models/resp_models/resp_product.dart';
import 'package:technaures_machine_test/models/resp_models/resp_product_list.dart';
import 'package:technaures_machine_test/rest/interceptors.dart';
import 'package:technaures_machine_test/rest/ip_class.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options.connectTimeout = 60000;
    dio.options.receiveTimeout = 60000;
    dio.interceptors.add(LoggingInterceptors());
    dio.interceptors.add(AppInterceptors());
    return _ApiClient(dio, baseUrl: kBaseUrl);
  }

  ///Products
  ///
  @GET(kAllProducts)
  Future<RespProductList> getProducts();

  @GET('$kAllProducts?id={productId}')
  Future<RespProduct> getProductDetails(@Path("productId") int productId);

  @GET('$kAllProducts?search_query={query}')
  Future<RespProductList> searchProducts(@Path("query") String query);

  ///Customer
  ///
  @GET(kCustomers)
  Future<RespCustomerList> getCustomers();

  @GET('$kCustomers?search_query={query}')
  Future<RespCustomerList> searchCustomers(@Path("query") String query);

  @POST(kCustomers)
  @Header('Content-Type: application/json')
  Future<RespCustomer> addCustomer(@Body() Map<String, dynamic> map);

  @PUT('$kCustomers?id={customerId}')
  @Header('Content-Type: application/json')
  Future<RespCustomer> updateCustomer(
      @Path("customerId") int customerId, @Body() Map<String, dynamic> map);

  ///Customer
  ///

  @POST(kCheckout)
  @Header('Content-Type: application/json')
  Future<RespCheckOut> orderCheckOut(@Body() Map<String, dynamic> map);
}
