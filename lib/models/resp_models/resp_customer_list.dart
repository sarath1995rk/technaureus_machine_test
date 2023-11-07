import 'package:technaures_machine_test/models/customer.dart';

/// error_code : 0
/// data : [{"id":1,"name":"Arun","profile_pic":"/media/customers/avatar.jpg","mobile_number":"9876543210","email":"arun@example.com","street":"abc street","street_two":"street","city":"kochi","pincode":675654,"country":"India","state":"kerala","created_date":"2023-10-19","created_time":"11:58:32.751027","modified_date":"2023-10-19","modified_time":"11:58:32.751041","flag":true}]
/// message : "success"

class RespCustomerList {
  RespCustomerList({
      num? errorCode, 
      List<Customer>? data,
      String? message,}){
    _errorCode = errorCode;
    _data = data;
    _message = message;
}

  RespCustomerList.fromJson(dynamic json) {
    _errorCode = json['error_code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Customer.fromJson(v));
      });
    }
    _message = json['message'];
  }
  num? _errorCode;
  List<Customer>? _data;
  String? _message;
RespCustomerList copyWith({  num? errorCode,
  List<Customer>? data,
  String? message,
}) => RespCustomerList(  errorCode: errorCode ?? _errorCode,
  data: data ?? _data,
  message: message ?? _message,
);
  num? get errorCode => _errorCode;
  List<Customer>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error_code'] = _errorCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

