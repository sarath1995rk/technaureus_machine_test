import 'package:technaures_machine_test/models/product.dart';

/// error_code : 0
/// data : {"id":1,"name":"kashmir kiwi","image":"/media/products/kashmir-kiwi.jpg","price":300,"created_date":"2023-10-19","created_time":"11:09:08.834893","modified_date":"2023-10-19","modified_time":"11:16:25.900111","flag":true}
/// message : "success"

class RespProduct {
  RespProduct({
      num? errorCode, 
      Product? data,
      String? message,}){
    _errorCode = errorCode;
    _data = data;
    _message = message;
}

  RespProduct.fromJson(dynamic json) {
    _errorCode = json['error_code'];
    _data = json['data'] != null ? Product.fromJson(json['data']) : null;
    _message = json['message'];
  }
  num? _errorCode;
  Product? _data;
  String? _message;
RespProduct copyWith({  num? errorCode,
  Product? data,
  String? message,
}) => RespProduct(  errorCode: errorCode ?? _errorCode,
  data: data ?? _data,
  message: message ?? _message,
);
  num? get errorCode => _errorCode;
  Product? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error_code'] = _errorCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : 1
/// name : "kashmir kiwi"
/// image : "/media/products/kashmir-kiwi.jpg"
/// price : 300
/// created_date : "2023-10-19"
/// created_time : "11:09:08.834893"
/// modified_date : "2023-10-19"
/// modified_time : "11:16:25.900111"
/// flag : true

