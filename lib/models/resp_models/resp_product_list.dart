import 'package:technaures_machine_test/models/product.dart';

/// error_code : 0
/// Product : [{"id":2,"name":"kashmir apple","image":"/media/products/kashmir-apple.jpg","price":300,"created_date":"2023-10-19","created_time":"11:09:51.676761","modified_date":"2023-10-19","modified_time":"11:16:15.045366","flag":true}]
/// message : "success"

class RespProductList {
  RespProductList({
      num? errorCode, 
      List<Product>? product, 
      String? message,}){
    _errorCode = errorCode;
    _product = product;
    _message = message;
}

  RespProductList.fromJson(dynamic json) {
    _errorCode = json['error_code'];
    if (json['data'] != null) {
      _product = [];
      json['data'].forEach((v) {
        _product?.add(Product.fromJson(v));
      });
    }
    _message = json['message'];
  }
  num? _errorCode;
  List<Product>? _product;
  String? _message;
RespProductList copyWith({  num? errorCode,
  List<Product>? product,
  String? message,
}) => RespProductList(  errorCode: errorCode ?? _errorCode,
  product: product ?? _product,
  message: message ?? _message,
);
  num? get errorCode => _errorCode;
  List<Product>? get product => _product;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error_code'] = _errorCode;
    if (_product != null) {
      map['data'] = _product?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : 2
/// name : "kashmir apple"
/// image : "/media/products/kashmir-apple.jpg"
/// price : 300
/// created_date : "2023-10-19"
/// created_time : "11:09:51.676761"
/// modified_date : "2023-10-19"
/// modified_time : "11:16:15.045366"
/// flag : true

